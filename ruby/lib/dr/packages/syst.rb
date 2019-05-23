#!/usr/bin/env ruby
# vim: fdm=marker

$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/resolver'

module DR
	module Packages
		class Syst < Resolver

			def self.all_types
				[:arch_abs,:arch_aur]
			end

			PACKAGES={ #{{{
			systemd: %w(systemd),
			minimal: %w(base base-devel gptfdisk lz4 openssh zsh),
			base: %w(git ruby tmux vim-minimal btrfs-progs rsync ldns),
			core: %w(encfs mlocate moreutils tree expect inotify-tools),
			doc: %w(tldr),

			ip: %w(bridge-utils sshfs socat whois),
			iw: %w(iw wpa_supplicant wireless_tools),
			ipextra: %w(ethtool net-tools wireless_tools wol ifplugd bind-tools bluez bluez-utils corkscrew nmap dante ufw nftables iperf3 aircrack-ng),
			#net-tools est obsolete, mais contient ifconfig, route et netstat
			#wireless_tool contient iwconfig
			#bind-tools est remplacé par ldns, mais contient `host`
			#Add bluez-firmware? I don't seem to need it for my bluetooth objects yet
			net: %w(unison lftp w3m wget),
			netextra: %w(offlineimap ntp aria2 gnu-netcat lynx links elinks mosh cclive youtube-dl sshuttle openvpn openconnect httpie electrum lastpass-cli), #openconnect: for inria vpn

			archive: %w(atool lrzip lz4 lzop p7zip cpio unrar zip unzip sharutils),
			#sharutils contains uuencode
			files: %w(ack ranger vifm par2cmdline rsnapshot bup wipe
				ripgrep the_silver_searcher ddrescue perl-file-mimeinfo fzf
				testdisk foremost bat fd ncdu exa lsd tokei),
				#schroot; scalpel-git (in aur): fork of foremost
				#`fzy`, `percol`: other fzf finders
			fs: %w(samba gvfs-smb dosfstools ntfs-3g efibootmgr),
			#efibootmgr is not really a fs but it modifies /sys/firmware/efi/efi* so I put it there anyway
			fsextra: %w(rmlint exfat-utils gvfs-mtp gmtp android-file-transfer unionfs-fuse), #mtpfs
			hardware: %w(powertop htop nmon iotop sysstat atop nethogs iftop smartmontools hddtemp hdparm lm_sensors acpi linux-tools fbset hwinfo upower memtest86+
			dmidecode tlp glances mtr mtr-gtk
			),
			devops: %w(), # In CUSTOM: chef-workstation
			iso: %w(archiso),
			mail: %w(abook neomutt mutt urlscan),
			mailextra: %w(procmail esmtp getmail),
			media: %w(mpv mpd mpc ncmpcpp alsa-utils mediainfo glyr),
			mediaextra: %w(mkvtoolnix-cli vorbis-tools opus-tools mp3info mplayer mencoder
			abcde python-eyed3 whipper libdvdcss miniupnpc lsdvd dvdbackup id3lib
			antiword catdoc docx2txt odt2txt unoconv
			subdl subdownloader
			), #mpdscribble [I use mpdas instead]
			#id3lib: for id3info
			#python-eyed3 is an optdep of abcde: ID3 tag support
			pacman: %w(expac pacgraph package-query pkgfile reflector asp pacman-contrib pacutils aurpublish),
				# aurman pacaur repoctl
			text: %w(neovim colordiff ed figlet screen vimpager words),
			textextra: %w(python-neovim texlive-most biber pstoedit psutils t1utils dialog rlwrap
			aspell-en aspell-fr hunspell-fr hunspell-en hunspell-en_US mythes-fr
			dictd jshon highlight tidy unrtf
			graphviz gnuplot gaupol tidy pandoc qpdf
			arch-wiki-docs arch-wiki-lite
			cowsay ponysay pdftk-bin dos2unix units
			unicode-character-database
			),
			virtual: %w(vagrant virtualbox qemu ovmf)+ #docker packer-io
				%w(lib32-mpg123 lib32-gnutls lib32-libldap wine-mono wine_gecko winetricks lib32-libpulse),
				#wine for battle.net: wine, winetricks, lib32-gnutls, and lib32-libldap
				#+ wine_gecko wine-mono lib32-mpg123
				#+ wine audio: lib32-libpulse
		
			devel: %w(ctags devtools elfutils strace),
			develextra: %w(subversion gdb cmake ruby-docs bzr linux-headers mercurial
			bpython ipython clojure coffeescript scala ocaml nodejs npm yarn yasm
			patchelf pax-utils libfaketime hub android-tools signify
			bower gulp uglify-js grunt-cli
			clang llvm lldb scons meson go rust
			rbspy python-pip python2-pip), #cython, cython2?
			#yasm is used for supernes simulator (yasm is a rewrite of nasm)
			#bower,gulp,uglify-js,grunt: for nodejs packages like popcorntime
			#libfaketime is to launch old magma bin
			#`jruby` ruby+jvm
			devellint: %w(eslint babel-cli flake8 python-pytest), #flake8: python linter
			libextra: %w( perl-authen-sasl perl-mime-tools perl-net-smtp-ssl perl-libwww perl-term-readkey
			python2-numpy python-psutil
			python-service-identity python2-service-identity
			python-urwid python-wxpython python-praw
			),
			#perl-* are for git (authen-sasl+net-smtp-ssl+mime-tools->git send-email, libwww+term-readkey->git svn), cf pacman -Qi git
			#python2-numpy: for hungarian, used in git-tbdiff
			#python2-service-identity for deluge which uses pyOpenSSL, cf https://pypi.python.org/pypi/service_identity
			#python-psutil for vim-automatic_latex_plugin and nvim-completion-manager
			#python-urwid,python-wxpython for hachoir3, python-praw for ~usr/dist/export-saved-reddit

			science: %w(pari),
			sciencesage: %w(sagemath-jupyter sagemath-doc), #sage+some optional dependencies. Note that `sage-notebook` is deprecated in favor of `sagemath-jupyter`. Use `sage-notebook-exporter` to convert

			xbase: %w(fvwm xorg-server xorg-xinit xterm),
			xdriver: %w(xf86-video-dummy xf86-video-fbdev xf86-video-vesa),
			xcore: %w(xorg-apps gvim firefox arandr xclip xsel pulseaudio-alsa),
			xextra: %w(xfce4 xfce4-goodies xorg-fonts-misc
			conky terminology uim mesa-demos zenity
			lightdm-gtk-greeter light-locker transset-df xcompmgr xorg-server-xephyr
			accountsservice pulseaudio-bluetooth pulseaudio-equalizer
			xdotool wmctrl xdg-user-dirs
			redshift
			xss-lock i3lock
			x2goclient xpra
			), #accountsservice is optional for lightdm
			#if needed: lxde, lxqt?
			#xorg-fonts-misc (I think its dependences xorg-fonts-{encodings,alias} is needed for X programs to use X fonts; otherwise I get:
			#    $ xmessage "ploum"
			#    Warning: Unable to load any usable ISO8859 font
			# To add? 'tabbed' (tabbed frontend to xembed aware apps)

			xfonttools: %w(freetype2-demos),
			#Misc xorg fonts apps: xorg-xfd, xorg-xlsfonts, xorg-xfontsel

			xartworks: %w(archlinux-wallpaper
				gnome-backgrounds gnome-icon-theme gnome-icon-theme-extras gnome-icon-theme-symbolic gnome-themes-extra gtk-engines),
			xcom: %w(pidgin hexchat teamspeak3
				purple-facebook purple-skypeweb),
			xfile: %w(calibre k3b deluge gparted usbview rmlint-shredder),
			xgames: %w(arenatracker-bin),
			xmedia: %w(kdegraphics krita
			pavucontrol paprefs gstreamer
			gst-plugins-base gst-plugins-good gst-plugins-bad
			picard dvdauthor mkvtoolnix-gui smplayer vlc ogmtools
			feh qiv geeqie gpicview inkscape mcomix fbreader
			gimp krita gst-libav audacity
			gifsicle streamlink
			),
			#if needed: ffmpeg-full,ffmpeg-full-git in aur
			#gst-libav: Gstreamer libav plugin
			xphoto: %w(perl-image-exiftool hugin darktable rawtherapee dcraw digikam gphoto2),
			xprint: %w(cups system-config-printer),
			xtextbase: %w(meld pygtksourceview2 mupdf zathura-djvu zathura-pdf-mupdf zathura-ps),
			xtext: %w(djview gv kdiff3 tig tk goldendict pdf2djvu),
			# atom, code (=vscode)
			xtextextra: %w(libreoffice-fresh jre8-openjdk code pdfpc qpdfview),
			xtypography: %w(fontforge),
			xweb: %w(flashplugin wireshark-qt),
			gnome: %w(baobab cheese ekiga eog eog-plugins evince
			dconf-editor gedit gconf-editor gnome-tweaks
			gnome-calculator gnome-disk-utility gnome-search-tool gnome-system-log
			gnome-font-viewer gucharmap gnome-characters
			file-roller seahorse gnome-terminal
			sound-juicer gnome-sound-recorder),
			#grip (not in abs anymore)

			# Only use the minimum here, 'dams' has more fonts
			fonts: %w(xorg-fonts xorg-fonts-100dpi xorg-fonts-75dpi terminus-font
				adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts tex-gyre-fonts
				ttf-dejavu ttf-freefont ttf-inconsolata ttf-liberation ttf-linux-libertine
			),
			}.sort_all

			#packages that are group packages
			#(gnome and gnome-extra are not used)
			# GROUPS=%w(base base-devel
			# xorg-apps xorg-fonts xfce4 xfce4-goodies lxde lxqt
			# gstreamer0.10-plugins kdegraphics texlive-most
			# gnome gnome-extra linux-tools
			# )
			GROUPS=[:all] #:all means obtain the groups automatically

			# static list of 'dams' local repo
			AUR_LOCAL_PKGS={
				aurhelpers: %w(auracle-git aurman aurutils-git cower repoctl pacaur package-query yay pkgbuild-introspection powerpill),
				devops: %w(chef-workstation),
				files: %w(dropbox scalpel-git),
				hardware: %w(modtree heimdall), #heimdall: flash Samsung phone firmware
				coreextra: %w(broot path-extractor fpp-git),
				develextra: %w(universal-ctags-git hyperfine rbspy),
				fsextra: %w(jmtpfs bcache-tools simple-mtpfs),
				mailextra: %w(archivemail),
				mediaextra: %w(google-musicmanager gtkpod ponymix-git mp3gain mpdas mpdscribble pulseaudio-dlna),
				netextra: %w(windscribe-cli tor-browser-en weboob),
				textextra: %w(fast-p pdftk-bin),

				xcom: %w(purple-battlenet-hg purple-hangouts-hg),
				xfonttools: %w(font-manager),
				xgames: %w(arenatracker-bin),
				xmedia: %w(penguin-subtitle-player-git popcorntime),
				xtext: %w(neovim-gtk),
				xextra: %w(winswitch yad),
				xtextextra: %w(impressive masterpdfeditor),
			}

			#packages that I may have (depending on which computer I am), aka
			#extra_ok
			CUSTOM={
				aurhelpers: AUR_LOCAL_PKGS[:aurhelpers],
				develextra: %w(universal-ctags-git unetbootin),
				hardware: %w(heimdall),
				fonts: %w(awesome-terminal-fonts ttf-gentium ttf-hack ttf-junicode),
				devops: %w(chef-workstation),
				fsextra: %w(mtpfs git-annex-bin),
				files: %w(dropbox scalpel-git),
				xextra: %w(xorg-xfd xorg-xlsfonts xorg-xfontsel),
				xtextextra: %w(pdfpc),
				xmedia: %w(gtkpod linphone popcorntime),
				xweb: %w(tor-browser-en chromium pepper-flash),
			}

			AUR_LOCAL_REPO=AUR_LOCAL_PKGS.values.flatten.sort
			# try a dynamic list if possible
			if (db=Pathname.new("/var/lib/pacman/sync/dams.db")).exist?
				require 'aur/no_load_config'
				require 'aur'
				db=Archlinux::DB.new(db)
				LOCAL_REPO=db.list.map {|i| i[:name]}
			else
				LOCAL_REPO=AUR_LOCAL_REPO
			end
			#packages that lives in aur and not available in the local repo
			AUR=AUR_LOCAL_REPO +
				%w(linphone unetbootin) -
				LOCAL_REPO
			#Not in aur anymore: git-annex-bin
			#Not used anymore: arenatracker asp-git roxterm skype-electron skypeforlinux-stable-bin

			PACKAGES.deep_merge!(AUR_LOCAL_PKGS,append: true).each do |k,v|
				PACKAGES[k]=v-(CUSTOM[k]||[])
			end

			#packages that we allow to be missing
			EXPECTEDMISSING=%w()
			#how to solve conflicts, here gvim has precedence over vim or vim-minimal
			CONFLICT={}
			CONFLICT["gvim"]=%w(vim vim-minimal)
			# CONFLICT["pari-sage"]=%w(pari)
			# CONFLICT["neomutt"]=%w(mutt) #these don't conflict anymore
			CONFLICT["universal-ctags-git"]=%w(ctags)
			#}}}

			def initialize(*args)
				@pkg_helper=Proc.new do |*args|
					base=[]
					busutils=%w(pcmciautils pciutils usbutils)
					netutils=%w(inetutils dhcpcd netctl s-nail)
					docutils=%w(man-pages man-db texinfo licenses)
					miscutils=%w(bzip2 psmisc nano)
					fsutils=%w(cryptsetup device-mapper e2fsprogs jfsutils lvm2 mdadm reiserfsprogs xfsprogs)
					args.each do |arg|
						case arg
						when :bare
							require 'dr/packages/handlers/arch_abs'
							# note: systemd -> cryptsetup -> device-mapper
							notneeded=busutils+netutils+docutils+miscutils+fsutils+%w(linux pacman)
							basegroup=Handler::ArchAbs.new(computer: @computer).list_groups("base")
							base+=basegroup["base"]-notneeded
						when :boot
							base+=fsutils+%w(linux) #do we really need all fsutils?
						when :pacman
							base+=%w(pacman)
						when :ssh
							base+=%w(openssh rsync) if @computer.attribute?(:syst_types, :ssh)
						when :shell
							base+=%w(zsh vim-minimal) if @computer.attribute?(:syst_types, :shell)
						else
							base+=arg
						end
					end
					base
				end
				super
			end

			def packages_setup
				@packages={ arch: { pkgs: PACKAGES, groups: GROUPS, conflict: CONFLICT, extra_ok: CUSTOM, missing_ok: EXPECTEDMISSING }}
				@packages_filter={:arch => {default: :arch_abs,
					arch_aur: AUR
				}}
		
				keys=PACKAGES.keys
				#x, net, text are NOT USED yet
				x=keys.select {|i| i[0]=="x"} + [:gnome, :fonts]
				#[:xartworks, :xbase, :xcom, :xcore, :xdriver, :xextra, :xfile, :xmedia, :xphoto, :xprint, :xtext, :xtextbase, :xtextextra, :xweb, :gnome, :fonts]
				net=[:ip, :iw, :ipextra, :net, :netextra]
				text=keys-net-x
				#[:archive, :base, :core, :devel, :develextra, :libextra, :files, :fs, :fsextra, :hardware, :iso, :mail, :media, :mediaextra, :pacman, :text, :textextra, :virtual]
		
				systemd=[:systemd]; minimal=[:minimal]
				init=minimal+[:base, :ip]
				server=init+[:core, :net, :hardware] #virtual
				console=server+[:ipextra, :archive, :files, :fs, :mail, :media, :pacman, :text]
				xlight=[:xbase, :xdriver, :xcore, :xtextbase] #Gondolin, Durin
				light=console+xlight
				standard=keys-[:fsextra, :iso, :xphoto, :sciencesage] #Numenor, Valinor
				#full: Feanor, Mithrim, Doriath
				packages_mode={systemd: systemd, minimal: minimal, init: init, all: keys, x: x, net: net, text: text, server: server, console: console, xlight: xlight, light: light, standard: standard, full: keys}
				packages_mode[:bare]=Proc.new do
					base=@pkg_helper.call(:bare)
					base+=@pkg_helper.call(:boot) if @computer[:syst][:boot]
					%i(pacman ssh shell).each do |type|
						base+=@pkg_helper.call(type) if @computer.attribute?(:syst_types, type)
					end
					base
				end
				@packages_mode={}
				packages_mode.each { |k,v| @packages_mode[k]={arch: v} }
				super
			end

			#we look into :packages,:type,@computer.name
			#but only :packages can be a hash of packages/packages_mode
			def get_mode(*args)
				@computer.dig(:syst, :packages) || super(@computer.dig(:syst,:type)) || super #@computer.name
			end

			def populate_pkgs_from_mode #{{{
				super
		
				#Custom packages
				add_packages(:arch,:xdriver,%w(xf86-input-synaptics networkmanager network-manager-applet)) if @computer.dig(:syst,:laptop)
				add_packages(:arch, :bootloader, Array(@computer.dig(:syst,:bootloader, default: []))-["custom", "systemd-boot"])
				add_packages(:arch, :bootloader, "efibootmgr") if @computer.dig(:syst, :boot)=="uefi"
				add_packages(:arch, :base, %w(intel-ucode)) if @computer.dig(:syst,:cpu)=~ /^Intel/
				drivers={Intel: %w(xf86-video-intel libva-intel-driver),
						Radeon: %w(xf86-video-ati),
						Nvidia: %w(xf86-video-nouveau)}
				drivers.default=[]
				@computer[:syst][:videos].each do |vid|
					add_packages(:arch, :xdriver, drivers[vid])
				end
				case @computer.name
				when "Durin"
					add_packages(:arch, :custom, %w(
			linux-raspberrypi-headers linux-raspberrypi raspberry-firmware
			archlinuxarm-keyring rng-tools
			omxplayer-git xbmc-rbp mkvtoolnix-cli
			python vlc terminus-font ttf-freefont
			))
					#These packages do not exist on alarm
					remove_packages(:arch,:pacman,"reflector")
					remove_packages(:arch,:hardware,"hwinfo")
				when "Mithrim"
					add_packages(:arch,:custom,%w(bcache-tools))
				when "imb"
					return set_all_packages(:arch, {
						sound: %w(mpc mpd ncmpcpp),
						misc: %w(lynx the_silver_searcher)
					}
					)
				end
				#skype optionally requires lib32-libpulse
				add_packages(:arch,:xextra,"lib32-libpulse") if check_package(:arch,"skype") and @computer.infos[:syst][:arch] == "x86_64"
			end #}}}

		end
	end
end

if __FILE__ == $0
	DR::Packages::Syst.process_args(*ARGV)
end

=begin
require 'dr/packages/syst'
computer=DR::Computer.new("foo")

computer[:syst][:packages]=:minimal #looks for @packages_mode[:minimal][:arch]
DR::Packages::Syst.new(computer).pkgs
=> {:arch_abs=> {:minimal=>...}}

computer[:syst][:packages]={arch: %i(base core)} #@packages[:arch][:pkg][:base,:core]
=> {:arch_abs=> {:base=>..., :core=> ...}}

computer[:syst][:packages]={arch: %w(pacman systemd)}
=> {:arch_abs=>{"custom"=>#<Set: {"pacman", "systemd"}>}}

computer[:syst][:packages]={arch: ["pacman", "ssh", :core]}
computer[:syst][:packages]={arch: [["pacman", "ssh"], :core]}
=> {:arch_abs=> {"custom"=>#<Set: {"pacman", "ssh"}>, :core=>...}

computer[:syst][:packages]={arch: {core: %w(pacman systemd), extra: %w(openssh rsync)}} #this also set up :classify
=> {:arch_abs=> {:core=>#<Set: {"pacman", "systemd"}>, :extra=>#<Set: {"openssh", "rsync"}>}}

computer[:syst][:packages]=lambda do |ptype|
  %w(pacman systemd) if ptype==:arch # like {arch: %w(pacman systemd)}
end

computer[:syst][:packages]={arch: [Proc.new {%w(pacman)}, :core]}
# like {arch: [["pacman"], :core]}

computer[:syst][:packages]={arch: [Proc.new {:core}, :ip]}
# like {arch: %i(core ip)}
=end
