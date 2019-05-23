#!/usr/bin/env ruby
require 'socket'

class NNTP_server
	attr_accessor :realm, :user, :pass, :echo, :io
	#echo: 0 do not output anythin, 1: output answers, 2: add commands
	def initialize(realm="yaf", echo: 2, **opts)
		@realm=realm
		@echo=echo
	end

	def connect(auth: true)
		if @io
			yield(@io) if block_given? 
		else
			case realm
			when "yaf"
				@io=TCPSocket.open('localhost', 2319)
			when "forum"
				config=File.read("/opt/flrn/share/flrn/flrnrc_forum")
				prog=config.match(/name forum set server\s*(.*)/)[1]
				authconfig=File.read("#{ENV['HOME']}/.flrn/.flrnrc.auth_forum_201408")
				@user=authconfig.match(/name forum set auth_user\s*(.*)/)[1]
				@pass=authconfig.match(/name forum set auth_pass\s*(.*)/)[1]
				@io=open(prog,'r+')
			else
				warn "Realm not recognized"
				return nil
			end
			slurp
			authenticate if auth
			if block_given?
				yield(@io)
				close(@io)
			end
		end
		return @io
	end

	def slurp(echo: @echo)
		r=@io.gets
		puts "< #{r}" if echo
		return r
	end
	def write(m, echo: @echo)
		puts "> #{m}" if echo>1
		@io.write(m)
	end
	def send(*m)
		write(m.map {|i| i.chomp}.join("\n")+"\n")
		return slurp
	end
	def close()
		if @io
			send "QUIT"
			@io.close
			@io=nil
		end
	end

	def authenticate(user: @user, pass: @pass)
		send "AUTHINFO USER #{user}" if user
		send "AUTHINFO PASS #{pass}" if pass
	end
	def check_group(group)
		r=send "GROUP #{group}"
		not r=~/^411 No such group/
	end
	def post(m)
		send "POST"
		send(m.to_s,".")
	end

	def send_post(m)
		connect
		post(m)
		close
	end
end

class NNTP_msg
	attr_reader :msg, :ħeader,:body
	def initialize(m)
		self.msg=m
	end

	def to_s
		return @msg
	end
	def msg=(msg)
		@msg=msg
		split=@msg.split(/\n\s*\n/m, 2)
		if split.length==1
			@body=split.first
			@header=""
		else
			@header,@body=split
		end
		@header_hash={}
		@header.each_line do |l|
			r=l.match(/^(\w*):(.*)$/)
			@header_hash[r[1]]=r[2] if r
		end
	end

	def canonicalize(realm, control: false, **opts)
		header=""
		unless @header_hash['From']
			from=case realm
				when "forum"; "Damien Robert <damien.robert__forum@normalesup.org>"
				when "yaf"; "Damien Robert <damien.robert__yaf@normalesup.org>"
				else "Damien Robert <damien.olivier.robert+news@gmail.com>"
				end
			header+="From: #{from}\n"
		end
		unless @header_hash['Newsgroups']
			newsgroup=case realm
				when "forum"; "ens.forum.essais"
				when "yaf"; "yaf.essai"
				end
			header+="Newsgroups: #{newsgroup}\n"
		end
		unless @header_hash['Content-Type']
			charset=case realm
				when "forum"; "utf-8"
				when "yaf"; "iso-8859-1"
				end
			header+="Content-Type: text/plain; charset=#{charset}\n"
		end
		header+="Subject: test\n" unless @header_hash['Subject']
		header+="Control: cancel <899qh19zehlhsdfa@example.com>\n" if control and !@header_hash['Control']

		nheader=@header.chomp+"\n"+header.chomp+"\n"
		nmsg=nheader+"\n"+@body
		nmsg.encode!("ISO-8859-1") if realm=="yaf"
		self.msg=nmsg
	end

	def post(server, canonicalize: true, **opts)
		server=NNTP_server.new(server,**opts) unless NNTP_server == server
		if opts[:check_group]
			server.check_group(group) or return false
		end
		canonicalize(server.realm, **opts) if canonicalize
		server.send_post(@msg)
	end
end

if __FILE__ == $0
	require 'optparse'
	@opts={realm: 'forum'}
	optparse = OptionParser.new do |opt|
		opt.banner = "Post to nntp server"
		opt.on("--realm=[REALM]", "realm to post") do |v|
			@opts[:realm]=v
		end
		opt.on("-v", "--verbose", Integer, "verbose level [2 by default]") do |v|
			@opts[:echo]=v
		end
		opt.on("--ontrol", "post in ontrol") do |v|
			@opts[:realm]="forum"
			@opts[:control]=true
		end
	end
	optparse.parse!

	msg=NNTP_msg.new(ARGF.read)
	msg.post(@opts[:realm], **@opts)
end
