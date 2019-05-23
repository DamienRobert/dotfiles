require 'pathname'
require 'time'
require 'simplecolor'
SimpleColor.mix_in_string

def read_mailbox(file)
	empty_line=/^$/
	mails=[]
	mode=:content; index=0
	headers=content=all=from_header=last=cur_header=content_header=from_date=nil
	clear= Proc.new do
		headers={}
		content=""; all=""; from_header=""; last=""
		cur_header=content_header=from_date=nil
	end
	clear.call

	error = Proc.new do |msg, color=:black|
		warn "Line #{index}, mail #{from_header.chomp}: #{msg}".color(color)
	end

	new_mail= Proc.new do
		length=content.length
		lines=content.each_line.count
		clean_content=content.strip
		clean_length=clean_content.length
		clean_lines=clean_content.each_line.count

		content.chomp!; all.chomp!
		mail={headers: headers, content: content, all: all, from_header: from_header, from_date: from_date}
		if (c=headers['Content-Length']&.to_i) and not (clean_length..length).include?(c)
			error.("wrong content-length #{length} != #{c}", :red)
		end
		if (c=headers['Lines']&.to_i) and not (clean_lines..lines).include?(c)
			color=:yellow
			color=:green if headers['Content-Length']
			error.("wrong Lines count #{lines} != #{c}", color)
		end
		unless all.empty? and from_date.nil?
			mails << mail
			yield mail if block_given?
		end
	end

	# Envelope from regexp
	daysname=/(:?Mon|Tue|Wed|Thu|Fri|Sat|Sun)/
	months=/(:?Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)/
	day=/\d\d?/; hms=/\d\d:\d\d:\d\d/; year=/\d\d\d\d/
	tz=/[+-]\d\d(:?\d\d)?/
	envfrom=Regexp.new(/^From\s+\S+\s+(#{daysname}\s+#{months}\s+#{day}\s+#{hms}(\s+#{tz})?\s+#{year}(\s+#{tz})?)$/)

	io=File.read(file, mode: 'rb')
	io.each_line do |l|
		index+=1
		case mode
		when :content
			if (r=l.match(envfrom))
			# It is *much* faster in expanded form...
			# if (r=l.match(/^From\s+.+\s+((Mon|Tue|Wed|Thu|Fri|Sat|Sun)\s+(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s+\d\d?\s+\d\d:\d\d:\d\d(\s+[+-]\d\d(:?\d\d)?)?\s+\d\d\d\d(\s+[+-]\d\d(:?\d\d)?)?$)/))
				new_mail.call
				clear.call
				from_header=l.chomp; from_date=Time.parse(r[1])
				mode=:header
				error.("Detected new from but without preceding empty line",:yellow) unless last.match(empty_line)
				all<<l.sub(/^From /, 'X-Original-Envelope-From: ')
			else
				all << l
				content << l
			end
		when :header
			r=l.match(/^([\w\-_]*):\s*(.*)$/)
			if r
				headers[cur_header]=content_header unless cur_header.nil?
				cur_header=r[1]
				content_header=r[2]
			elsif l.match(/^>From\s+/)
				# check up for dummy from envelope
				# l.delete_prefix!('>')
				l.sub(/^>From /, 'X-Old-Original-Envelope-From: ')
			elsif l.match(empty_line)
				headers[cur_header]=content_header unless cur_header.nil?
				mode=:content
			else
				if cur_header.nil?
					error.("In header mode but found no headers => #{l.chomp}",:yellow)
					mode=:content
					content << l
				else
					# the header continue into next line
					content_header<<l
				end
			end
			all << l
		end
		last=l
	end
	new_mail.call
	mails
end

def mailbox_to_maildir(mailbox, maildir)
	maildir=Pathname.new(maildir)
	raise "Not a directory: #{maildir}" unless maildir.directory?
	['cur', 'new', 'tmp'].each {|f| (maildir+f).mkpath}
	# nnnnnnnnn.cccc.mbox:2,XXXX
	# cccc: message count
	count=0
	read_mailbox(mailbox) do |mail|
		#time=Time.parse(mail[:headers][:date] || Time.now).to_i
		time=mail[:from_date].to_i
		count+=1
		#Flags are in X-Status: A=replied, F=important, R=read, D=deleted
		#So A=>R, F=>F, R=>S, D=>T
		flags=""
		flags+='F' if mail[:headers]["X-Status"]&.include?('F')
		flags+='R' if mail[:headers]["X-Status"]&.include?('A')
		flags+='T' if mail[:headers]["X-Status"]&.include?('D')
		# Nb: flags in Status: R=read, O=old, D=deleted, N=new, U=not downloaded
		out=maildir+"cur"+"#{sprintf('%04d', count)}.#{time}.mbox:2,S#{flags}"
		out.write(mail[:all])
	end
	count
end

def is_mailbox?(file)
	return false if File.empty?(file)
	begin
		File.read(file, 1000, mode: 'rb').match(/From /)
	rescue => e
		warn "!!! Error: #{e} on #{file}".color(:yellow)
	end
end

def mailboxes_to_maildir(src, dest)
	mail=Pathname.new(src)
	dest=Pathname.new(dest)
	l=Dir.chdir(mail) do
		Pathname.glob('**/*')
	end
	l.map do |p|
		absp=mail+p
		next if absp.directory?
		#skip maildirs
		if ['cur', 'new', 'tmp'].include?(p.dirname.basename.to_s)
			# puts "Skipping #{p}: it is a maildir".color(:blue)
			next 
		end
		unless is_mailbox?(absp)
			puts "Skipping #{p}, not a mailbox".color(:blue)
			next
		end
		destp=dest+p
		next if p.to_s =~ /mime-exemples/
		puts "# Converting #{p} to #{destp}".color(:bold)
		destp.mkpath
		c=mailbox_to_maildir(absp, destp)
		puts "# Got #{c} emails"
		p
	end.compact
end

# for i in **/*(.); do if [[ -e /tmp/maildir/$i ]]; then echo "$i"; rm -f $i; mv /tmp/maildir/$i $i; fi; done;
