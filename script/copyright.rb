#!/usr/bin/env ruby
# rubocop: enable Layout/IndentationWidth

def replace(l, offset, content)
	l[offset[0], offset[1] - offset[0]] = content
end

def copyright(lines, verbose: false, change_year: true, name: nil)
	lines.each_line.map do |l|
		if l =~ /Copyright.*#{name}/
			lorig = l.dup if verbose
			l.gsub!(/\([cC]\)/, "©")
			change_year = Time.now.year.to_s if change_year == true
			if (m = l.match(/\W(\d{4})[-–](\d{4})\W/))
				l[m.offset(1)[1], 1] = "–" # replace '-' by the en-dash
				endyear = m[2]
				replace(l, m.offset(2), change_year) if change_year && change_year != endyear
			elsif (m = l.match(/\W(\d{4})\W/))
				year = m[1]
				replace(l, m.offset(1), "#{year}–#{change_year}") if change_year && change_year != year
			end
			puts "#{lorig.chomp} -> #{l.chomp}" if verbose && l.match(/©/) && (lorig != l) # be verbose on real copyright lines
		end
		l
	end.join
end

if $PROGRAM_NAME == __FILE__
	require "optparse"
	opts = { verbose: true, dryrun: false, year: false }
	optparse = OptionParser.new do |opt|
		opt.banner = "#{File.basename($PROGRAM_NAME)} files"
		opt.on("-v", "--[no-]verbose", "verbose") do |v|
			opts[:verbose] = v
		end
		opt.on("-d", "--[no-]dry-run", "dry run") do |v|
			opts[:dryrun] = v
		end
		opt.on("-y", "--year", "=[year]", "update year", "Use current year when on by default") do |v|
			opts[:year] = v
		end
		opt.on("--name=name", "Only update copyright for name") do |v|
			opts[:name] = v
		end
	end
	optparse.parse!

	p opts
	ARGV.each do |file|
		year = opts[:year]
		if year == "git"
			Dir.chdir(File.dirname(file)) do
				# date=short gives yyyy-mm-dd
				year = `git log -1 --format=%cd --date=format:%Y`.chomp
			end
		end
		puts "-- #{file} (#{year})" if opts[:verbose]
		text = copyright(File.read(file), verbose: opts[:verbose], change_year: year, name: opts[:name])
		File.open(file, "w") { |f| f.puts(text) } unless opts[:dryrun]
	end
end
# ~/script/copyright.rb -d -y {~rubygems,~progs}/*/{LICENSE,README,COPYING}*(N)

# ~/script/copyright.rb --name="Damien Robert" --year=git -d ~/dist/@github/*/{COPYING,*.{md,txt}} ~/website/common/erb_common.rb
# gitstatus.rb
# vcs action 'git ci -a -m "Copyright"' ~/dist/@github/*
# vcs push ~/dist/@github/*
