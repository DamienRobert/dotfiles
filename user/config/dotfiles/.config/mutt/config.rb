#!/usr/bin/env ruby
#vim: fdm=syntax

require 'json'
require 'pathname'
require "dr/config/computers"

module DR
	module Mutt
		extend self
		@muttdir=Pathname.home+".mutt"
		@maildir=ENV['MAILDIR'] ? Pathname.new(ENV['MAILDIR']+(ENV['MAILDIR'].end_with?("/") ? '' : '/')) : Pathname.home+"Mail/"

		@relmaildir=Pathname.new(@maildir.to_s.delete_prefix(ENV['HOME']))
		@computer=DR::Computer.new('current')

		def version
			@version||=`mutt -v`
		end

		def convert(s)
			#s.gsub("\n","; ")
			s.split("\n").join("; ")+";"
		end

		def gpg(loopback=true)
			##note: I now use gpgme, this is as a fallback in case mutt is not compiled for it
			##note2: mutt+gpgme does not allow an encrypt-to-self :-(
			passfd= loopback ? "%?p?--pinentry-mode loopback --passphrase-fd 0?" : ""
			if Pathname.new("/usr/lib/neomutt/pgpewrap").exist?
				pgpewrap="/usr/lib/neomutt/pgpewrap"
			elsif Pathname.new("/usr/lib/mutt/pgpewrap").exist?
				pgpewrap="/usr/lib/mutt/pgpewrap"
			else
				pgpewrap="pgpewrap"
			end
			selfkey=
				begin
					File.read(ENV['HOME']+"/.gnupg/gpg.conf")[/^default-key\s*(.*)/,1]
				rescue
				end or "0x99000009"

				#note3: neomutt does support encrypt to self
				#note3: and so does mutt 1.9
				#note3: in neomutt, pgp_self_encrypt_as is a synonym to pgp_default_key
				#but pgp_default_key does not exist in mutt
				gpgme=""
				gpgme+=<<EOS if version =~/(^patch-encrypt-to-self-neomutt$|\+encrypt_to_self|Mutt 1\.9)/
## GPGME
set crypt_use_gpgme
set pgp_self_encrypt
set pgp_sign_as = #{selfkey}
set pgp_self_encrypt_as = #{selfkey}
# self encrypt postponed messages marked for encryption
set postpone_encrypt
EOS
			return <<EOS
#{gpgme}

#### gpg commands
# decode application/pgp
set pgp_decode_command="gpg #{passfd} --status-fd=2 --no-verbose --quiet --batch --output - %f"

# verify a pgp/mime signature
set pgp_verify_command="gpg --status-fd=2 --no-verbose --quiet --batch --output - --verify %s %f"

# decrypt a pgp/mime attachment
set pgp_decrypt_command="gpg #{passfd} --status-fd=2 --no-verbose --quiet --batch --output - %f"

# create a pgp/mime signed attachment
set pgp_sign_command="gpg #{passfd} --no-verbose --batch --quiet --output - --armor --detach-sign --textmode %?a?-u %a? %f"

# create a application/pgp signed (old-style) message
set pgp_clearsign_command="gpg #{passfd} --no-verbose --batch --quiet --output - --armor --textmode --clearsign %?a?-u %a? %f"

# create a pgp/mime encrypted attachment
set pgp_encrypt_only_command="#{pgpewrap} gpg #{passfd} --encrypt-to #{selfkey} --batch --quiet --no-verbose --output - --encrypt --textmode --armor --always-trust -- -r %r -- %f"

# create a pgp/mime encrypted and signed attachment
set pgp_encrypt_sign_command="#{pgpewrap} gpg #{passfd} --encrypt-to #{selfkey} --batch --quiet --no-verbose --textmode --output - --encrypt --sign %?a?-u %a? --armor --always-trust -- -r %r -- %f"

# import a key into the public key ring
set pgp_import_command="gpg --no-verbose --import %f"

# export a key from the public key ring
set pgp_export_command="gpg --no-verbose --export --armor %r"

# verify a key
set pgp_verify_key_command="gpg --verbose --batch --fingerprint --check-sigs %r"

# read in the public key ring
set pgp_list_pubring_command="gpg --no-verbose --batch --quiet --with-colons --list-keys %r"

# read in the secret key ring
set pgp_list_secring_command="gpg --no-verbose --batch --quiet --with-colons --list-secret-keys %r"

# fetch keys
# set pgp_getkeys_command=""
####
EOS
		end
		
		def sendmailssh
			'unset smtp_url smtp_pass; set sendmail="ssh sendmailssh /usr/sbin/sendmail -oem -oi"'
		end

		def default_sendmail
			sendmailssh
		end

		def smtp(account)
			@computer.auth[account] && smtp=@computer.auth[account][:smtp]
			if smtp
				#"set smtp_url=\"#{AuthInfo.extraquote(smtp.to_public)}\"; set smtp_password=\"#{AuthInfo.extraquote(smtp.password)}\""
				#"set smtp_password=\"#{AuthInfo.extraquote(smtp.password)}\""
				"set smtp_url=\"#{AuthInfo.extraquote(smtp)}\""
			elsif account==:ssh
				sendmailssh
			else
				default_sendmail
			end
		end

		def default_config
			return convert(<<EOS)
set mail_check=5 timeout=600
unset signature smtp_url smtp_pass
EOS
		end
		
		def config(account, maildir: :auth)
			output=""
			signature=@muttdir+"signature-#{account}"
			if signature.exist?
				output << "set signature=#{signature};"
			end
			output << default_config if account==:default

			if (uris=@computer.auth[account])
				output << convert(<<EOS) if uris.include?(:mail)
set from="Damien Robert <#{uris[:mail].to}>"
EOS
				if maildir == :auth
					maildir=uris[:maildir].to_s 
					maildir="+#{maildir}" unless Pathname.new(maildir).absolute?
				end
			else
				maildir="" if maildir == :auth
			end
			maildir += "/" unless maildir.empty? or maildir[-1]=="/"
			case account.to_s
			when "phare"
				output << convert(<<EOS)
send2-hook ~G 'set from="Damien Robert <Damien.Robert__gnupg@normalesup.org>"'
set postponed=#{maildir}postponed
EOS
			when "inria"
				output << convert(<<EOS)
set postponed=#{maildir}/Drafts
EOS
			when /^gmail/
				output << convert(<<EOS)
set postponed=#{maildir}Gmail/Drafts
set record=#{maildir}Gmail/Sent_Mail
EOS
			end
			output<< smtp(account)
			output
			# ! -- refers to your $spoolfile (incoming) mailbox [defaul to $MAIL]
			# > -- refers to your $mbox file (read mails from $spoolfile) [not used in my settings]
			# < -- refers to your $record file (outgoing mail)
			# - or !! -- refers to the file you've last visited
			# ~ -- refers to your home directory
			# = or + -- refers to your $folder directory
			# @alias -- refers to the default save folder as determined by the address of the alias
			# ^ refer to the current mailbox
		end

		def accounts_default
			# Default settings for maildir mailboxes
			# I do this two times, because mutt ploum@plam will not call the folder-hook...
			<<EOS
## Accounts
set folder='#{@maildir}' record="=local/sent" postponed="=local/postponed"; #{config(:default)}
# folder-hook . "set folder='#{@maildir}'
folder-hook . "set record='^' postponed='+local/postponed'; #{AuthInfo.extraquote(config(:default))}"
account-hook . "unset preconnect imap_user imap_pass imap_authenticators"
EOS
		end

		def accounts
			o=accounts_default
			auth=@computer.authinfo
			auth.each do |k,v|
				maildir=v[:maildir]
				o<< <<EOS if maildir
folder-hook #{@maildir+maildir.to_s} "#{AuthInfo.extraquote(config(k))}"
EOS
			end
		o
		end

		def imap
			o="## IMAP\n#{mailboxes :imap}"
			@computer.auth.each do |k,v|
				imap=v[:imap]
				spool=imap.to_public
				spooldir=spool+"/"
				extra=nil
				case k.to_s
				when /^gmail/
					extra="unset record; set postponed=#{spooldir}[Gmail]/Drafts;"
				end
				o<< <<EOS
account-hook "#{spool}" "#{AuthInfo.extraquote("set imap_user=\"#{imap.user}\" imap_pass=\"#{AuthInfo.extraquote(imap.password)}\"")}"
folder-hook "#{spool}" "#{DR::AuthInfo.extraquote(config(k, maildir: spooldir), extra, join:"; ")}"
EOS
			end
			o
			#Explication de $record pour gmail:
			#Je veux sauver dans [Gmail]/Sent_Mail, que ce soit localement ou par imap
			#(sauf que localement c'est Gmail/Sent_Mail vu les traductions offlineimap)
			#Dans le cas imap, gmail sauve tout seul quand on utilise son smtp, d'où le unset record en imap
			#Rem: d'autres applications imap (ex sur Android) vont typiquement sauver sur Sent (que Gmail traduit en [imap]/Sent)
			
			#POP3 - port 110, IMAP - port 143, SMTP - port 25, HTTP - port 80
			#Secure SMTP (SSMTP) - port 465
			#Secure IMAP (IMAP4-SSL) - port 585
			#IMAP4 over SSL (IMAPS) - port 993
			#Secure POP3 (SSL-POP) - port 995
		end

		# specific config for recent neomutt/mutt versions
		def patched_config
			zhooks=<<'EOS'
## +compressed
# Handler for gzip compressed mailboxes
open-hook   '\.gz$' "gzip --stdout --decompress '%f' >  '%t'"
close-hook  '\.gz$' "gzip --stdout              '%t' >  '%f'"
append-hook '\.gz$' "gzip --stdout              '%t' >> '%f'"
# Handler for bzip2 compressed mailboxes
open-hook   '\.bz2$' "bzip2 --stdout --decompress '%f' >  '%t'"
close-hook  '\.bz2$' "bzip2 --stdout              '%t' >  '%f'"
append-hook '\.bz2$' "bzip2 --stdout              '%t' >> '%f'"
# Handler for xz compressed mailboxes
open-hook   '\.xz$' "xz --stdout --decompress '%f' >  '%t'"
close-hook  '\.xz$' "xz --stdout              '%t' >  '%f'"
append-hook '\.xz$' "xz --stdout              '%t' >> '%f'"
# Handler for pgp encrypted mailboxes
# Handler for gpg encrypted mailboxes
# gpg does not support appending to an encrypted file
open-hook   '\.gpg$' "gpg --decrypt < '%f' > '%t'"
# close-hook  '\.gpg$' "gpg --encrypt --recipient YourGpgUserIdOrKeyId < '%t' > '%f'"
EOS

			sidebar=<<'EOS'
## +sidebar
unset sidebar_visible
set mail_check_stats
set sidebar_divider_char = '|'
set sidebar_format="%B%* %! %?N?%N/?%S"
#default: set sidebar_format="%B%* %?F? !%F ?%?N?%N/?%S"
# %B name, %F flagged, %N new, %S total
# Ctrl-Down: Move the highlight to the prev mailbox
macro index,pager <C-Up> "<enter-command>set sidebar_visible<enter><sidebar-prev>" "Move up in the sidebar"
# Move the highlight to the next mailbox
macro index,pager <C-Down> "<enter-command>set sidebar_visible<enter><sidebar-next>" "Move down in the sidebar"
# Open the highlighted mailbox
bind index,pager \Co sidebar-open
macro index,pager <C-Right> "<sidebar-open><enter-command>unset sidebar_visible<enter>" "Open sidebar folder"
macro index,pager <C-Left> "<enter-command>toggle sidebar_visible<enter>" "Toggle the sidebar"
# Shorten mailbox names
set sidebar_short_path
# set sidebar_component_depth=1
set sidebar_delim_chars='/'
set sidebar_folder_indent

#color sidebar_indicator default color17        # Dark blue background
color sidebar_highlight white   color238        # Grey background
color sidebar_spoolfile yellow  default         # Yellow
color sidebar_new       magenta default         # Magenta
color sidebar_ordinary  default default         # Default colors
color sidebar_flagged   red     default         # Red
color sidebar_divider   color8  default         # Dark grey
EOS
			attach_headers_color=<<'EOS'
## +attach_headers_color
# Color GPGME signature checks
color   attach_headers     green     default        "Good signature from.*"
color   attach_headers     red       default        "Bad signature from.*"
EOS

			tag_transforms=<<'EOS'
# Default, we want to change it to have our emojis :)
# set hidden_tags="unread,draft,flagged,passed,replied,attachment,signed,encrypted"
set hidden_tags="all,draft,flagged,passed,attachment,signed,encrypted"
# 📫 📬
tag-transforms   \
  "inbox"   "🖄"  \
  "unread"  "📧" \
  "ml"      "✉"  \
  "replied" "↻"  \
  "sent"    "⮩"  \
  "received" "⮪" \
  "unprocessed" "🗷" \
EOS

			notmuchdir=Pathname.new(ENV['NOTMUCH'] ? ENV['NOTMUCH'] : @maildir)
			notmuch=%Q{set nm_default_uri = "notmuch://#{notmuchdir}"\n}
			load_virtual="<enter-command>source '$HOME/.mutt/config.rb mailboxes virtual |'<enter>"
			notmuch << <<EOS
## +notmuch
#set nm_query_window_duration=2
set nm_query_window_timebase="week" # or "hour", "day", "week", "month", "year"
macro index,pager x  "#{load_virtual}<change-vfolder>" "Change virtual folder"
macro index,pager ,x "#{load_virtual}<vfolder-from-query>" "Virtual folder query"
macro index,pager \\Cx "#{load_virtual}<enter-command>set sidebar_visible<enter><sidebar-toggle-virtual>" "Toggle the sidebar into virtual folders"
macro index,pager X "#{load_virtual}<change-vfolder>?" "List virtual mailboxes"
macro index,pager,browser ,mv "#{load_virtual}" "Add virtual mailboxes"
macro index,pager,browser ,mV "<enter-command>unvirtual-mailboxes *<enter>" "Clear virtual mailboxes"
bind browser X exit
#These change '$nm_query_window_current_position'
macro index ,< "<enter-command>set nm_query_window_duration=2<enter><vfolder-window-backward>" "virtual window backwad"
macro index ,> "<enter-command>set nm_query_window_duration=2<enter><vfolder-window-forward>" "virtual window forward"
macro index ,= "<enter-command>set nm_query_window_duration=0<enter><change-folder>^<enter>" "Reset query window duration"
bind index,pager ,lT entire-thread
# :exec change-vfolder
EOS
			# For now I want to activate the virtual folders only when I need them
			# notmuch+=mailboxes(:virtual)

			o=""
			o+=sidebar if version =~ %r{\+sidebar|\+USE_SIDEBAR|mutt-patched/sidebar}
			o+=attach_headers_color if version =~ /\+attach_headers_color/
			o+=notmuch if version =~ /\+notmuch/
			o+=zhooks if version =~ %r{\+compress|\+USE_COMPRESSED|features/compressed-folders}
			o+=tag_transforms if version =~/\+index_color/
			o
		end

		def mailboxes(type=@computer[:user][:hosttype])
			case type
			when :perso, :imb
				<<'EOS'
mailboxes =inria/Inbox =phare/Inbox =damien.olivier.robert@gmail/Inbox =ploum.plam@gmail/Inbox =ploum.plam@gmail/accounts =ploum.plam@gmail/accounts/Olympe =ploum.plam@gmail/accounts/dr1984 =ploum.plam@gmail/accounts/drd2i =ploum.plam@gmail/accounts/ploumplamplim =ploum.plam@gmail/accounts/robertdami =ploum.plam@gmail/accounts/yahoo =ploum.plam@gmail/accounts/zolienuit =ploum.plam@gmail/robertdamien@yahoo.com =inria/ML/lfant =inria/ML/work =inria/ML/abonnements =phare/ML
EOS
			when :phare
				<<'EOS'
mailboxes  =phare/Inbox =phare/ML  =phare/Ens-Collectif/
EOS
			when :offlineimap
				#"set folder=#{@maildir}\n"+
				(Pathname.new(@maildir)+".muttrc.mailboxes").read
			when :virtual
				notmuchwrapper=Pathname.home+@computer.file(:rel_scriptfiles)+"notmuch_wrapper"
				if notmuchwrapper.file?
					load notmuchwrapper.to_s 
					NotMuch.tag
				end
					<<'EOS'
virtual-mailboxes "All" "notmuch://?query=tag:all"
virtual-mailboxes "Inboxes" "notmuch://?query=tag:inbox"
virtual-mailboxes "ML" "notmuch://?query=tag:ml"
virtual-mailboxes "Received" "notmuch://?query=tag:received"
virtual-mailboxes "Sent" "notmuch://?query=tag:sent"
EOS
			when :imap
				@computer.auth.map do |k,v|
					imap=v[:imap]
					spool=imap.to_public
					"mailboxes \"#{spool}\""
				end.join("\n")+"\n"
			end
		end

		def globalconfig(type=@computer[:user][:hosttype])
			o=""
			o << patched_config
			o << gpg
			#no imap by default
			o << accounts
			o << mailboxes(type)
			case type
			when lambda { |t| t == :perso || t == :sshfs }
				o << default_sendmail
				o << <<EOS
set spoolfile="=inria/Inbox"
EOS
				# o<< "set folder=~/Mail/virtual/sshfs" if type == :sshfs
			when :phare
				o<< <<EOS
set spoolfile="=phare/Inbox"

folder-hook . unmy_hdr Reply-To; unhook send-hook
folder-hook "Ens-Collectif" set from="Damien Robert <Damien.Robert__mailco@normalesup.org>"
folder-hook "Ens-Collectif" send-hook . my_hdr "Reply-To: Damien.Robert__mailco@normalesup.org"
folder-hook "Ens-Collectif" send-hook gourous my_hdr "Reply-To: gourous@clipper.ens.fr"
folder-hook "Ens-Collectif" send-hook tuteurs my_hdr "Reply-To: tuteurs@clipper.ens.fr"
folder-hook "Ens-Collectif" send-hook wintuteurs my_hdr "Reply-To: wintuteurs@clipper.ens.fr"
EOS
			end
			o
		end
	end
end

if __FILE__ == $PROGRAM_NAME
	case ARGV[0]
	when "gpg", "patched_config", "accounts", "imap"
		puts DR::Mutt.public_send(ARGV[0].to_sym)
	when "smtp", "config"
		puts DR::Mutt.public_send(ARGV[0].to_sym, ARGV[1].to_sym)
	when "mailboxes","globalconfig"
		if ARGV.length > 1
			type=ARGV[1]
		else
			comp=DR::Computer.new('current')
			type=comp[:user][:hosttype]
			type=comp.name if type == "ens"
		end
		puts DR::Mutt.public_send(ARGV[0].to_sym, type.to_sym)
	else
		puts "patched_config/gpg/imap/accounts"
		puts "smtp/config / mailboxes/globalconfig account/type"
	end
end
=begin
- gpg: configure gpg

- sendmailssh: use ssh sendmail rather than smtp to send the emails (bound to F5)

- imap: setup imap (bound to ,mi) similarly to `accounts` + add imap mailboxes via `mailboxes`

- accounts: setup folderhooks (via `config`) for each account with a maildir in authinfo

- smtp account: set up smtp

- config account: ex: config ens/inria/gmaildor... Uses `smtp`
  => automatically set up smtp pass and 'from' (from authinfo), signature
     + some custom config for phare/inria/gmail

- mailboxes type: configure mailboxes for hosttype
    special values: :virtual, :offlineimap, :imap

- globalconfig type:
  set up patched_config, gpg, accounts
  mailboxes type
  and extra config based on type
  (sourced by muttrc.perso, use :user/:hosttype for type by default)
=end
