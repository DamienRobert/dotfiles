#!/usr/bin/env ruby
# vim: fdm=marker

require "optparse"
begin #init {{{
	require 'ap'
rescue LoadError
	def ap(item,*args)
		p item
	end
end
require 'config/computers'

class Hash
	def sort_all
		#this sort the keys
		r=Hash[self.sort]
		r.each do |k,v|
			r[k]=v.sort
		end
		return r
	end
end #}}}

class Packages
	PACKAGES={ #{{{
	minimal: %w(base base-devel gptfdisk lz4 openssh zsh),
	base: %w(git ruby tmux vim btrfs-progs rsync ldns),
	core: %w(pacaur encfs mlocate moreutils tree expect inotify-tools),

	ip: %w(bridge-utils sshfs socat whois),
	iw: %w(iw netctl dialog rfkill wpa_supplicant wireless_tools),
	#dialog is needed for wifi-menu from netctl
	ipextra: %w(ethtool net-tools wireless_tools wol ifplugd wpa_actiond dnsutils  bluez bluez-utils corkscrew nmap tsocks ufw),
	#net-tools est obsolete, mais contient ifconfig et route
	#wireless_tool contient iwconfig
	#dnsutils est remplacé par ldns, mais contient `host`
	net: %w(unison lftp w3m wget),
	netextra: %w(offlineimap ntp aria2 gnu-netcat lynx links elinks mosh cclive youtube-dl),

	archive: %w(atool lz4 lzop p7zip unrar zip unzip),
	files: %w(ack ranger vifm par2cmdline rsnapshot wipe), #schroot
	fs: %w(samba gvfs-smb dosfstools ntfs-3g),
	fsextra: %w(exfat-utils fuse-exfat gvfs-mtp mtpfs),
	hardware: %w(powertop htop nmon iotop sysstat atop nethogs iftop smartmontools hddtemp hdparm lm_sensors acpi cpupower fbset hwinfo upower memtest86+
	),
	iso: %w(archiso unetbootin),
	mail: %w(abook mutt procmail esmtp),
	media: %w(mpv mpd mpc ncmpcpp alsa-utils mediainfo),
	mediaextra: %w(mkvtoolnix-cli vorbis-tools mp3info mplayer mencoder
	abcde libdvdcss),
	pacman: %w(abs pacgraph package-query pkgfile reflector),
	text: %w(colordiff ed figlet screen vimpager words),
	textextra: %w(texlive-most pstoedit psutils t1utils
	aspell-en aspell-fr archivemail dictd jshon highlight tidyhtml
	graphviz gnuplot
	arch-wiki-docs
	),
	#sage-mathematics?
	virtual: %w(vagrant virtualbox packer-io), #docker

	devel: %w(ctags devtools elfutils perf strace ocaml pari mercurial subversion),
	develextra: %w(cmake ocaml nodejs ruby-docs yasm bzr linux-headers
	perl-authen-sasl perl-mime-tools perl-net-smtp-ssl perl-libwww perl-term-readkey gtk2-perl
	python-pip python2-pip python2-numpy python-pygit2 python-psutil),
	#yasm is used for supernes simulator (yasm is a rewrite of nasm)
	#perl-* are for git send-email; gtk2-perl is for git my blameview
	#python2-pip,numpy: for hungarian, used in git-tbdiff
	#python-pip is for pip, the python equivalent of rubygems (not used yet)
	#python-pygit2: for ~vardist/git-extra/aspiers_git-config/git-deps
	#python-psutil for vim-automatic_latex_plugin

	xbase: %w(fvwm xorg-server xorg-xinit xterm),
	xdriver: %w(xf86-video-dummy xf86-video-fbdev xf86-video-modesetting xf86-video-vesa),
	xcore: %w(xorg-apps gvim firefox arandr xclip xsel pulseaudio-alsa),
	xextra: %w(xfce4 xfce4-goodies lxde
	clipit conky lilyterm uim mesa-demos
	lightdm-gtk3-greeter transset-df xcompmgr xorg-server-xephyr
	accountsservice), #accountsservice is optional for lightdm

	xartworks: %w(archlinux-wallpaper kdeartwork-emoticons 
		gnome-backgrounds gnome-icon-theme gnome-icon-theme-extras gnome-icon-theme-symbolic gnome-themes-standard),
	xcom: %w(pidgin xchat skype teamspeak3),
	xfile: %w(calibre k3b deluge gparted spacefm),
	xmedia: %w(kdegraphics calligra-krita
	pavucontrol paprefs ponymix-git gstreamer gstreamer0.10-plugins 
	amarok banshee musicbrainz picard gtkpod
	dvdauthor mkvtoolnix-gtk smplayer vlc
	feh qiv geeqie gpicview inkscape
	),
	xphoto: %w(perl-image-exiftool hugin darktable rawtherapee dcraw digikam gphoto2),
	xprint: %w(cups system-config-printer),
	xtextbase: %w(meld pygtksourceview2 mupdf zathura-djvu zathura-pdf-mupdf),
	xtext: %w(djview4 gv kdiff3 impressive tig tk goldendict),
	xtextextra: %w(libreoffice-fresh jre8-openjdk),
	xweb: %w(flashplugin wireshark-gtk),
	gnome: %w(baobab cheese ekiga eog eog-plugins evince file-roller gconf-editor gedit gnome-calculator gnome-disk-utility gnome-font-viewer gnome-search-tool gnome-system-log gucharmap seahorse sound-juicer),
	
	fonts: %w(xorg-fonts font-mathematica terminus-font ttf-dejavu ttf-droid ttf-freefont ttf-junicode ttf-inconsolata ttf-liberation ttf-linux-libertine ),
	#xorg-fonts-100dpi xorg-fonts-75dpi

	custom: [],
	}.sort_all

	#packages that are group packages
	#(gnome and gnome-extra are not used)
	GROUPS=%w(base base-devel
	xorg-apps xorg-fonts xfce4 xfce4-goodies lxde
	gstreamer0.10-plugins kdegraphics texlive-most
	gnome gnome-extra
	)
	#packages that lives in aur
	AUR=%w(pacaur ponymix-git archivemail packer-io package-query)

	#packages that I may have (depending on which computer I am)
	CUSTOM=%w(vim
					 grub gummiboot efibootmgr syslinux
					 xf86-video-ati xf86-video-nv xf86-video-nouveau xf86-video-intel
					 xorg-fonts-75dpi xorg-fonts-100dpi 
					 mail-notification twinkle)
	#packages that can be missing (ex: vim -> gvim)
	EXPECTEDMISSING=%w(vim)
	#}}}

	attr_accessor :allpackages,:toppackages,:topforeign,:unused,:gpkgs,:gmissing,:pmissing,:pckgmissing,:topextra,:foreignextra,:pkgs,:pkgslist
	def initialize(computer)
		@pkgs=target(computer) #@pkgs categories we want, @pkgslist: corresponding packages
		@pkgslist=@pkgs.map {|g| PACKAGES[g]}.flatten

		#getpkgs -> @allpackages,@toppackages,@topforeign
		#getunused -> @unused
		#getgroups -> @@gpkgs
		#getdeps ->@gmissing,@pmissing,@pckgmissing(=flattened(@gmissing)+@pmissing),@topextra,@foreignextra
	end

	def target(computer) #{{{
		keys=PACKAGES.keys
		#x, net, text are NOT USED yet
		x=keys.select {|i| i[0]=="x"} + [:gnome, :fonts]
		#[:xartworks, :xbase, :xcom, :xcore, :xdriver, :xextra, :xfile, :xmedia, :xphoto, :xprint, :xtext, :xtextbase, :xtextextra, :xweb, :gnome, :fonts]
		net=[:ip, :iw, :ipextra, :net, :netextra]
		text=keys-net-x
		#[:archive, :base, :core, :custom, :devel, :develextra, :files, :fs, :fsextra, :hardware, :iso, :mail, :media, :mediaextra, :pacman, :text, :textextra, :virtual]

		minimal=[:minimal]
		init=minimal+[:base, :ip]
		server=init+[:core, :net, :hardware] #virtual
		console=server+[:ipextra, :archive, :files, :fs, :mail, :media, :pacman, :text]
		xlight=[:xbase, :xdriver, :xcore, :xtextbase] #Gondolin, Durin
		light=console+xlight
		standard=keys-[:fsextra, :iso, :xphoto] #Numenor, Valinor
		#full: Feanor
		modes={minimal: minimal, init: init, all: keys, x: x, net: net, text: text, server: server, console: console, xlight: xlight, light: light, standard: standard, full: keys}
		if String === computer
			if modes.key?(computer.to_sym)
				return modes[computer.to_sym]
			else
				computer=DR::Computer.new(computer) if String === computer
			end
		end
		if $opts[:init]
			pckgs=modes[(computer.infos[:syst][:initpackages] || "init").to_sym]
		else
			pckgs=modes[(computer.infos[:syst][:packages] || computer.infos[:syst][:type]).to_sym]
		end
		if computer.infos[:syst][:laptop]
			PACKAGES[:xdriver]+=%w(xf86-input-synaptics networkmanager network-manager-applet)
		end

		case computer.name
		when "Durin"
			PACKAGES[:custom]= %w(
	linux-raspberrypi-headers linux-raspberrypi archlinuxarm-keyring rng-tools
	omxplayer-git xbmc-rbp mkvtoolnix-cli
	python vlc terminus-font ttf-freefont
	)
			#These packages do not exist on alarm
			PACKAGES[:pacman]-=%w(reflector)
			PACKAGES[:hardware]-=%w(hwinfo)
		end
		pckgs << :custom
		
		allpckgs=pckgs.map {|g| PACKAGES[g]}.flatten
		if allpckgs.include?("skype") and computer.infos[:syst][:arch] == "x86_64"
			PACKAGES[:xextra].unshift("lib32-libpulse")
			#skype optionally requires lib32-libpulse
		end
		return pckgs
	end #}}}

	# get* {{{
	def getunused
		@unused ||= "pacman -Qqdt".readlist
	end
	def getgroups
		@@gpkgs||=nil
		if not @@gpkgs
			@@gpkgs={}
			GROUPS.each do |i|
				@@gpkgs[i]="pacman -Sqg #{i.to_s}".readlist
			end
		end
	end
	def getpkgs
		@allpackages||="pacman -Qq".readlist
		@toppackages||="pacman -Qqt".readlist #unrequired packages
		@topforeign||="pacman -Qqmt".readlist #unrequired foreign packages
		@toppackages -= @topforeign
	end

	def getdeps
		getgroups
		getpkgs

		#the packages we want
		targetpackages=@pkgs.map {|g| PACKAGES[g]}.flatten
		#the packages that are not considered extra packages
		expectedpackages=targetpackages + CUSTOM
		expectedpackages+=expectedpackages.select {|i| GROUPS.include?(i)}.map {|i| @@gpkgs[i]}.flatten
		#the packages we "have"
		ourpackages=@allpackages+EXPECTEDMISSING

		@gmissing={}
		@@gpkgs.each_key do |g|
			if targetpackages.include?(g) then
				@@gpkgs[g].each do |i|
					(@gmissing[g]||=[]) << i unless ourpackages.include?(i)
				end
			end
		end
		@pmissing={}
		@pkgs.each do |g|
			PACKAGES[g].each do |i|
				GROUPS.include?(i) or
					((@pmissing[g]||=[]) << i unless ourpackages.include?(i))
			end
		end
		@pckgmissing=(@gmissing.map { |k,v| v } +
			@pmissing.map {|k,v| v }).flatten.uniq

		@topextra=@toppackages.select {|i| !expectedpackages.include?(i) }
		@foreignextra=@topforeign.select {|i| !expectedpackages.include?(i) }
	end
	#}}}

	# show/process {{{
	def show
		getdeps
		puts "== Non complete groups =="
		ap @gmissing, multiline: false
		puts "== Packages missings =="
		ap @pmissing, multiline: false

		puts "\n== Extra top packages =="
		ap @topextra, multiline: false
		puts "== Extra foreign top packages =="
		ap @foreignextra, multiline: false
		puts "\n== Unused packages"
		getunused
		ap @unused, multiline: false
	end

	def process(action)
		case action
		when 'show'
			show
		when 'list'
			l={}; @pkgs.each {|i| l[i]=PACKAGES[i]}
			ap l
		when 'pristine'
			process('get')
			process('rm')
		when 'get-all' #all packages that should be installed
			install (@pkgs.map {|g| PACKAGES[g]}.flatten)
		when 'get'#packages that we want installed but missing
			getdeps
			install @pckgmissing
		when 'rm'
			getdeps
			getunused
			uninstall(@topextra + @foreignextra + @unused)
		when 'rm-extra' #packages that are installed but should not be
			#remove a group: sudo pacman -Ru
			getdeps
			uninstall(@topextra + @foreignextra)
		when 'rm-unused' #unused packages (when I don't want to remove all extra packages like 'rm' does
			getunused
			uninstall(@unused)
		else warn "action #{action} should be "+
			"show/list/pristine/get-all/get/rm/rm-extra/rm-unused"
		end
	end

	def install(pkgs)
		pkgs.uniq!
		if $opts[:list]
			aur=pkgs.select {|i| AUR.include?(i)}
			pkgs-=aur
			puts pkgs.sort.join(" ")
		else
			aur=pkgs.select {|i| AUR.include?(i)}
			pkgs-=aur
			print "sudo pacman -S --needed #{pkgs.join(" ")};" if not pkgs.empty?
			print "pacaur -y #{aur.join(" ")};" if not aur.empty?
		end
	end
	def uninstall(pkgs)
		pkgs.uniq!
		if $opts[:list]
			puts pkgs.join(" ")
		else
			print "sudo pacman -Rcs #{pkgs.join(" ")};" if not pkgs.empty?
		end
	end
	#}}}
end

class String
	def readlist
		return open("| #{self}").read.split("\n")
	end
end

if __FILE__ == $0
	def process_args(action,*args)
		args=[DR::Computer.new("current")] if args.empty?
		args.each do |arg|
			Packages.new(arg).process(action)
		end
	end

	$opts={}
	optparse = OptionParser.new do |opt|
		opt.banner = "Show/Install pacman packages"
		opt.on("-l", "--[no-]list", "List packages but don't generate shell code") do |v| 
			$opts[:list]=v 
		end
		opt.on("-i", "--[no-]init", "Initial package installation") do |v| 
			$opts[:init]=v 
		end
	end
	optparse.parse!

	if ARGV.empty?
		process_args('show')
	else
		args=ARGV; action=args.shift
		process_args(action,*args)
	end
end
