#!/usr/bin/env ruby
#vim: fdm=syntax
require 'dr/config/process_files'

module ::DR
class Offlineimap
	def initialize(comp)
		@computer=comp
		@accounts=@computer.get_authinfo(gpg: false)
		@keys=@accounts.keys.keep_if {|k| @accounts[k].key?(:maildir)}
	end

	def account_name(name)
		@accounts[name][:maildir].to_s #.gsub('@','.')
	end

	def account(name)
		repo=account_name(name)
		repodir=@accounts[name][:maildir]
		autorefresh= name =~ /gmail/ ? 30 : 10
		quick=5; idle=[]; filter=[]; notfilter=[]
		type="IMAP"

		local=""; remote=""

		#nametrans, idle, type, ssl
		case name.to_s
		when "phare", "inria", /gmail/
			idle=%w(INBOX)
			
			rnametrans="re.sub('INBOX', 'Inbox', re.sub(' ', '_', foldername))"
			lnametrans="re.sub('Inbox', 'INBOX', re.sub('_', ' ', foldername))"
			if name == :phare
				lnametrans = "'phare/' + #{lnametrans}"
				rnametrans= "re.sub ('^phare/', '', #{rnametrans})"
			elsif name.to_s=~/gmail/
				lnametrans= "re.sub('^Gmail', '[Gmail]', #{lnametrans})"
				rnametrans = "re.sub('^\\[Gmail\\]', 'Gmail', #{rnametrans})"
				type="Gmail"
				# https://github.com/OfflineIMAP/offlineimap/issues/573
				remote << "ssl_version = tls1_2\n"
			end
			local << "nametrans = lambda foldername: #{lnametrans}\n"
			remote << "nametrans = lambda foldername: #{rnametrans}\n"

			remote << "sslcacertfile = /etc/ssl/certs/ca-certificates.crt\n"
		end
		remote << "idlefolders = #{idle.inspect}\n" unless idle.empty?
		remote << "type = #{type}\n" if type

		# filter
		case name.to_s
		when "phare"
			filter=['phare/Inbox', 'phare/ML', 'phare/postponed', 'phare/Sent']
		when "inria"
			notfilter = ['Trash', 'Contacts', 'Emailed Contacts', "Incoming", "ML/imb", "ML/inria"]
		when /gmail/
			notfilter=['[Gmail]/All Mail','[Gmail]/Important', '[Gmail]/Spam', '[Gmail]/Starred', '[Gmail]/Trash', '[Gmail]/Chats', 'Call log', 'SMS']
			notfilter += ['backups/inria', 'backups/inria-all', 'backups/phare', 'backups/phare-all', 'robertdamien@yahoo.com/Sent'] if name==:gmailpp
		end
		remote << "folderfilter = lambda foldername: foldername in #{filter.inspect}\n" unless filter.empty?
		remote << "folderfilter = lambda foldername: foldername not in #{notfilter.inspect}\n" unless notfilter.empty?

		# misc
		case name.to_s
		when "phare"
			remote << "subscribedonly = no\n"
		when /gmail/
			#desactivate OAUTH2 for gmail for accounts which don't have an oauth token, see https://bbs.archlinux.org/viewtopic.php?id=206424
			#
			# Setting up oauth:
			#    https://github.com/OfflineIMAP/offlineimap/issues/228
			#    https://github.com/OfflineIMAP/offlineimap/blob/master/offlineimap.conf#L887-L967
			#    https://hobo.house/2017/07/17/using-offlineimap-with-the-gmail-imap-api/
			#for informations on how to set it up
			#=> crypt/.auth/google_tokens/offlineimap_dor.json contains token for
			#  a 'custom application' which can acces gmail imap.
			#=> To generate a new refresh token for an account:
			#   python2 ~/usr/dist/gmail-oauth2-tools/python/oauth2.py --generate_oauth2_token \ --client_id=YOUR_CLIENT_ID --client_secret=YOUR_CLIENT_SECRET
			remote<< <<EOS unless AuthInfo::GMAIL_TOKENS.include?(name)
auth_mechanisms = LOGIN
EOS
		end

		# passwords
		auth=<<EOS
remotehosteval = get_server_fromdict("#{name}")
remoteusereval = get_user_fromdict("#{name}")
EOS
		if AuthInfo::GMAIL_TOKENS.include?(name)
			auth+=<<EOS
oauth2_client_id_eval = get_id_token_fromdict("#{name}")
oauth2_client_secret_eval = get_secret_token_fromdict("#{name}")
oauth2_refresh_token_eval = get_refresh_token_fromdict("#{name}")
EOS
		else
			auth+=<<EOS
remotepasseval = get_password_fromdict("#{name}")
EOS
		end

		hooks=""
		hooks << "postsynchook = notmuch new\n" if SH.find_executable('notmuch')

		output= <<EOS
[Account #{repo}]
localrepository = Local-#{repo}
remoterepository = Remote-#{repo}
autorefresh = #{autorefresh}
quick = #{quick}
#{hooks}

[Repository Local-#{repo}]
type = Maildir
localfolders = ~/Mail/#{repodir}/
sep = /
#{local}

[Repository Remote-#{repo}]
ssl = yes
#{auth}
#{remote}
EOS
return output
	end

	def main
		output= <<EOS
# vi: set ft=python
[general]
maxsyncaccounts = #{@keys.length}
accounts = #{@keys.map {|a| account_name(a)}.join(',')}
pythonfile = ~/mine/config/files/offlineimap.py
# ui = BlinkenLights
ui = Basic
metadata = ~/.offlineimap
# https://github.com/OfflineIMAP/offlineimap/issues/536
socktimeout = 10
fsync=False

[mbnames]
enabled = yes
filename = ~/Mail/.muttrc.mailboxes
header = "mailboxes "
peritem = "+%(accountname)s/%(foldername)s"
sep = " "
footer = "\\n"
EOS
output << @keys.map { |a| account(a) }.join("\n")
output
#return "#Generated @#{`date --iso-8601=seconds`}\n"+output
	end
end
end

#we are called by a process_helper
if self.instance_of?(::DR::Eruby::Context)
	if @computer.attribute?(:user_mail,:offlineimap)
		write_file(".offlineimaprc",generated_from(true)+Offlineimap.new(@computer).main)
	end
end

if __FILE__ == $0
	#too lazy to add options, use 'process_files -c comp offlineimap.rb' to handle computers
	require 'dr/config/computers'
	puts DR::Offlineimap.new(DR::Computer.new).main
end
