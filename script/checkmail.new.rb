#!/usr/bin/env ruby

require 'pathname'
require 'maildir'
require 'mail'
require 'mail_extract'
require 'simplecolor'
require 'dr/base/encoding'
require 'cgi'

SimpleColor.mix_in_string

module MailCheck
	@default_maildirs=Pathname.glob(Pathname.new(ENV['HOME'])+'Mail/*/Inbox/')

	class << self
		attr_accessor :default_maildirs
	end

	class MailBox
		attr_accessor :mailbox

		def initialize(mailbox)
			@mailbox=::Maildir.new(mailbox,false) #do not create cur,tmp,new dirs
		end

		def to_s
			@mailbox.path
		end

		def check
			@mailbox.list(:new)
		end
	end

	# list of mailboxes
	class MailDirs
		attr_accessor :maildirs

		def initialize(maildirs=MailCheck.default_maildirs)
			@maildirs=maildirs.map {|m| MailBox.new(m)}
		end

		def check
			newmails={}
			@maildirs.each do |m|
				newmails[m]=m.check
			end
			newmails
		end

		def self.nbmails(newmails)
			newmails.values.inject(0) {|sum,x| sum+x.length}
		end
	end

	class Format
		attr_accessor :opts
		def initialize(opts)
			@opts=opts
		end

		def emphasize(text)
			if @opts[:notify]
				"<b>#{text}</b>"
			else
				text.color(:bold)
			end
		end

		def mail_body(mail)
			charset=mail.charset
			if mail.multipart?
				part = mail.parts.select { |p| p.content_type =~ /text\/plain/ }.first rescue nil
				part = mail.parts.select { |p| p.content_type =~ /text\/html/ }.first rescue nil if part.nil?
				mail=part unless part.nil?
			end
			case mail.content_type
			when /text\/plain/
				message = mail.body.decoded
				charset=mail.charset if mail.charset
				message.force_encoding(charset) if charset
				#convert to UTF-8
				message=DR::Encoding.to_utf8(message)

				#message.gsub!(/(^ *|>.*)\n/,'') #filter
				message=MailExtract.parse(message)
			when /text\/html/
				message = mail.body.decoded
				#IO.popen("lynx -dump -stdin", "r+") {|pipe|
				IO.popen("w3m -dump -T text/html", "r+") {|pipe|
					pipe.puts message
					pipe.close_write
					message=pipe.read
				}
				#Usually html messages are spam so I reduce the size
				message=message.split("\n").first(10).join("\n")
			else
				return ""
			end

			if @opts[:notify]
				message=CGI::escapeHTML(message)
			end
			message=message.chomp+"\n\n" unless message.empty?
			return message
		end

		# format an email
		def mail_format(mail, body: @opts[:body])
			case mail
				when Maildir::Message
					mail=File.read(mail.path)
				when Pathname
					mail=File.read(mail)
				when String
					mail=mail
			end
			begin
				mail=Mail.new(mail)
			rescue StandardError => e
				warn "Error in reading mail: #{e}"
				#Force the encoding, cf https://github.com/mikel/mail/issues/736
				mail=Mail.new(DR::Encoding.to_utf8(mail))
			end
			begin
				from=mail.from || [""]
				subject=mail.subject || ""
				date=mail.date || ""
			rescue StandardError => e
				warn "Error in parsing mail headers: #{e}"
				raise e
			end
			if @opts[:notify]
				format="&lt;<i>#{CGI::escapeHTML(from.join(" "))}</i>&gt; #{CGI::escapeHTML(subject)}\n"
			else
				format="<#{from.join(" ").color(:red)}> #{subject.color(:green)} (#{date.to_s.color(:yellow)})\n"
			end
			format=DR::Encoding.to_utf8(format)
			if body
				begin
					format+=mail_body(mail)
				rescue StandardError => e
					warn "Error in parsing mail body: #{e}"
					raise e
				end
			end
			return format
		end

		# format a mbox name
		def mailbox_format(mailbox, emphasize: true)
			name=mailbox.to_s
			name=name.sub(/^#{ENV['HOME']}\/Mail\//,'').sub(/(\/new)\/$/,'')
			name=self.emphasize(name) if emphasize
			name
		end

		# format a list of maildirs
		def maildirs_format(maildirs)
			format=""
			maildirs.each do |k,v|
				if !v.empty?
					format+=mailbox_format(k)+"\n"
					v.map do |m|
						begin
							format+="- "+ mail_format(m)
						rescue StandardError => e
							warn "Error in formatting #{k}->#{m}: #{e}"
						end
					end
				end
			end
			format
		end

		# just show a summary of nb mails by mailboxes
		def maildirs_summary(maildirs)
			format=""
			maildirs.each do |k,v|
				if !v.empty? or @opts[:read]
					format+="- "+ mailbox_format(k, emphasize: false)+": "+v.length.to_s+"\n"
					#format+="#{v.length} new messages.\n"
				end
			end
			format
		end

		def maildirs_print(maildirs)
			nbmails=MailDirs.nbmails(maildirs)
			if @opts[:summary]
				format=maildirs_summary(maildirs)
				if nbmails > 0 or @opts[:read]
					format=emphasize("New mails: #{nbmails}")+"\n"+format
				end
			else
				format=maildirs_format(maildirs)
			end
			if @opts[:notify]
				if nbmails == 0
				 system("notify-send -t 2 -i mail-read ' '") if @opts[:read]
				else
					system('notify-send', '-i', 'mail-unread', ' ', format)
				end
			else
				puts format
			end
		end

		def inotify_format(event)
			mbox=Pathname.new(event.watcher.path)
			mail=mbox+event.name
			return mailbox_format(mbox)+": "+
				mail_format(mail)
		end

		def inotify_print(event)
			format=inotify_format(event)
			if @opts[:notify]
				system('notify-send', '-i', 'mail-unread', ' ', format)
			else
				puts format
			end
		end
	end

end

if __FILE__ == $0
	require "optparse"
	opts={:color => true, :notify => false, :read => true, :status => false,
		:summary => false, :daemon => false, :body => false, :tray => false}
	optparse = OptionParser.new do |opt|
		opt.banner= "#{File.basename($0)} [options] maildirs"
		opt.on("-c", "--[no-]color", "Color output", "on by default") do |v|
			opts[:color]=v
		end
		opt.on("--notify", "Notify output") do |v|
			opts[:notify]=v
			opts[:color]=!v
		end
		opt.on("--[no-]read", "read mails", "still show even when all mail is read, on by default") do |v|
			opts[:read]=v
		end
		opt.on("-s", "--summary", "summary", "show only amount of new mails") do |v|
			opts[:summary]=v
		end
		opt.on("--status", "exit status 1 if new mail") do |v|
			opts[:status]=v
		end
		opt.on("--daemon", "Demon mode") do |v|
			opts[:daemon]=v
		end
		opt.on("--body", "Show body of messages") do |v|
			opts[:body]=v
		end
		opt.on("--tray", "Launch in systray") do |v|
			opts[:tray]=v
		end
	end
	optparse.parse!
	if !opts[:color]
		SimpleColor.enabled=false
	end
	@format=MailCheck::Format.new(opts)

	paths=ARGV
	if paths.empty?
		paths=MailCheck.default_maildirs
	end
	paths.map! {|p| Pathname.new(p).expand_path}

	if opts[:daemon]
		require 'rb-inotify'
		notifier = INotify::Notifier.new
		paths.each do |path|
			notifier.watch((path+"new/").to_s, :moved_to, :create, :onlydir) do |event|
				@format.inotify_print(event)
			end
		end
		loop do
			notifier.process
		end
	else
		m=MailCheck::MailDirs.new(paths)
		msgs=m.check

		if opts[:status]
			if MailCheck::MailDirs.nbmails(msgs) == 0
				exit 0
			else
				exit 1
			end
		else
			@format.maildirs_print(msgs)
		end
	end
end
