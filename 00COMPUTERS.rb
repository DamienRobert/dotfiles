#!/usr/bin/env ruby
# vim: fdm=marker
require 'optparse'
require 'forwardable'
require 'shellwords'
require 'pathname'

$LOAD_PATH << "#{ENV['HOME']}/mine/ruby/lib"
require 'dr/core_ext'

module DR
	module Computers #{{{
		MYFILES=Pathname.new(ENV['HOME'])+"mine"
		CFGFILES=MYFILES+"config"
		extend self

		#used for syst/etc/generate.sh to generate all config files
		List= {
			:archclient => %w(Gondolin Feanor Numenor Valinor Durin),
			:archserver => %w(virtual packer),
			:own => %w(FooBar),
			:sync => %w(phare imb 4a),
			:devel => %w(bbq plafrim),
			:extra => %w(oimb bimb),
		}
		List[:all]=List.values.flatten.uniq

		#My computers running archlinux
		List[:Arch]=List[:archclient]+List[:archserver]
		#My computers
		List[:Perso]=List[:Arch]+List[:own]
		#Servers I want to synchronise via unison
		List[:ToUnison]=List[:sync] + List[:devel]
		#Computers I synchronise through unison rather than rsync
		#=> :unisontype=minimal
		List[:Unison]=(List[:ToUnison] + List[:Perso]).uniq
		#Where I will run X
		List[:Xorg]=List[:archclient]+List[:own]+%w(imb)
		#Where I will need some gems,etc installed
		List[:Interactive]=List[:Xorg]+%w(phare)
		#=> cfgtype: minimal, unisontype: standard
		Alias={"ens" => "phare", "mygale" => "plafrim"}

		#check if it is in the Computers list
		def check
			return List[:all].include?(@name)
		end

		#find the canonical name of the computer
		def normalize(param)
			return nil unless param
			name=List[:all].find {|v| v.downcase == param.downcase }
			name=((al=Alias.find {|k,v| k.downcase == param.downcase }) && al[1]) unless name
			return name
		end

		def infos(*args)
			args = ['current'] if args.empty?
			return Computer.new(*args).infos
		end
	end #}}}

	class Computer #{{{
		#methods for Computer class {{{
		attr_reader :name,:origname,:infos
		include Computers
		extend Forwardable
		def_delegators :@infos, :[], :[]=

		def initialize(name, opts={})
			name=name.name if DR::Computer === name
			if name == "current"
				name = ENV['MYHOSTNAME']
				@origtype = ENV['MYHOSTTYPE']
				unless name
					f=Pathname.new("#{ENV['HOME']}/mine/config/hosttype.local")
					infos=f.read if f.exist?
					if infos =~ /^MYHOSTNAME=(.*)$/
						name=$1
					end
					if infos =~ /^MYHOSTTYPE=(.*)$/
						@origtype||=$1
					end
				end
				name = ENV['HOST'] unless name
			end
			@origname=name
			@name=normalize(name) || name
			abort "#{name} not found in Computers list" unless check() if opts[:check]
			@infos = get_infos
		end
		def to_s
			@name
		end
		def ===(item)
			case item
			when String
				@name==DR::Computer.new(item).name
			when DR::Computer
				@name==item.name
			end
		end

		#find if name or alias is in list (or alias)
		def in?(list)
			list.any? do |i|
				self.===(i)
			end
		end
		#}}}

		#informations on computers #{{{
		def get_infos
			infos={
				:hostname => @name, :hosttype => 'none',
				:homepath => "/home/robert",
				:ssh => @name,
				:xorg=>{},:syst => {}, :config => [], :install => [],
			}

			#config based on type {{{
			if List[:Unison].include?(@name)
				infos.deep_merge!({
					:unisontype => "minimal"
				})
			end
			if (List[:Interactive]).include?(@name)
				infos.deep_merge!({
					:cfgtype => "minimal",
					:unisontype => "standard",
					:runtimedir => "/tmp",
				})
			end
			if List[:devel].include?(@name)
				infos.deep_merge!({
					:hosttype => 'devel',
					:unisontype => "devel"
				})
			end

			if List[:Xorg].include?(@name)
				infos.deep_merge!({
					:xorg => {
						:horiz => 80, :fonttype => 'Monospace',
						:vert => 30, :gvert => 30, :svert => 20, #gvert is for xfce-terminal
						:fontsize => 13, :sfontsize => 9, #this+dm is used to generate ~/.xprops
						:dm => 'xfce', :xaudio => 'pulse', :xvideo => 'xv', #xaudio is for mpd, xvideo is not used
						:whoriz => 800, :wvert => 600, #workspace pixels dimension, used for zathura
						:Xft_rgba => 'rgb', :Xft_hinting => 'true', :Xft_autohint => 'false', :Xft_hintstyle => 'hintfull', :Xft_antialias => 'true', :Xft_lcdfilter => 'lcddefault' #used for fontconfig
				}})
			end

			if List[:Perso].include?(@name)
				infos.deep_merge!({
					:ssh => name.downcase,
				})
			end

			mkinitcpio_std=%w(base udev autodetect modconf block resume filesystems keyboard keymap fsck) #consolefont
			mkinitcpio_systemd=%w(systemd autodetect modconf block filesystems fsck) #Rem: resume hook does not work with systemd. This is for virtual servers, so I don't add base or keyboard+sd-vconsole

			if List[:Arch].include?(@name)
				infos.deep_merge!({
					:runtimedir => "/run/user/1000",
					:syst => {
						:laptop => false,
						:arch => "x86_64", :cputype => nil,
						:ethname => "eth0", :wlanname => "wlan0", :batname => nil,
						:mkinitcpio_modules => [],
						:mkinitcpio_hooks => mkinitcpio_std,
						:boot => 'uefi', :bootloader => 'gummiboot',
						:linuxoptions => 'root=PARTLABEL=slash', :linuxinitoptions => nil,
						:partition => 'gpt', :bootdisk => '/dev/sda', :disks => ['/dev/sda'],
						:fs => 'ext4',
					}})
				#:type pour packages.rb, :laptop pour 02commitetc et packages.rb
				# arch pour makepkg.conf, pacman.conf, mirrorlist
				# cputype pas utilisés (cputype était utilisé pour charger le bon acpifreq module, mais c'est fait automatiquement maintenant)
				# ethname, wlanname, batname: pour conky
				# mkinitcpio* pour mkinitcpio
				# bootloader,linux*options: pour ~etc/default/grub and bootloader.rb
				# partition,bootdisk,disks: pour ~syst/MBR/00save,
				# lang, bootdisk, fs, initpackages, packages: pour ~syst/new/generate
			end
			if List[:archclient].include?(@name)
				infos.deep_merge!({
					:cfgtype => "standard",
					:hosttype => 'perso',
					:syst => { :type => 'standard', :lang => "fr" }
					})
			end
			if List[:archserver].include?(@name)
				infos.deep_merge!({
					:syst => {
						:type => 'server',
						:mkinitcpio_hooks => [nil]+mkinitcpio_systemd,
					}})
			end
			#}}}

			case @name #{{{ Custom configs
			when "imb"
				infos.deep_merge!({
					:cfgtype => 'full',
					:unisontype => 'full',
					:hosttype => 'imb',
					:sshu => 'imbu',
					:xorg => {
						:vert => 52, :gvert => 50, :fontsize => 14,
						:dm => 'mate', :Xresources => "*customization:"
					},
				})
			when "oimb"
				infos=DR::Computers.infos("imb").deep_merge!({ :sshu => 'oimbu' })
			when "bimb"
				infos=DR::Computers.infos("imb").deep_merge!({ :sshu => 'bimb' })
			when "phare"
				infos.deep_merge!({ :sshu => "phare2", :hosttype => 'phare' })
			when "4a"
				infos.deep_merge!({ :sshu => "4a2" })

			when "Feanor"
				infos.deep_merge!({
					:cfgtype => 'full',
					:unisontype => 'full',
					:syst => {
						:type => 'full',
						:arch => "x86_64", :cputype => "acpi-cpufreq",
						:mkinitcpio_modules => ["intel_agp", "i915"],
						:disks => ["sdb", "sdc"],
						:fs => 'btrfs',
						:linuxoptions => 'root=PARTUUID="986178da-85b0-4a7c-a0ec-600adfa32be7" libahci.ignore_sss=1',
						:linuxinitoptions => 'root=PARTUUID="986178da-85b0-4a7c-a0ec-600adfa32be7" rootflags=subvol=/slash-init ro',
					},
					:xorg => {
						:vert => 50, :gvert => 49, :fontsize => 15,
						:whoriz => 1000, :wvert => 1020,
					},
				})
			when "Valinor"
				infos.deep_merge!({
					:syst => {
						:laptop => true, :cputype => "acpi-cpufreq", :arch => "x86_64",
						:batname => 'BAT0',
						:mkinitcpio_modules => ["nouveau"],
						:partition => 'mbr', :boot => 'bios', :bootloader => 'grub',
						:linuxoptions => 'resume=/dev/sda5',
					},
					:xorg => {
						:vert => 44, :gvert => 42, :fontsize => 14,
						:whoriz => 900, :wvert => 1600,
						:Xresources => "Xft.dpi: 96"
					},
				})
			when "Numenor"
				infos.deep_merge!({
					:syst => {
						:laptop => true, :cputype => "AMD_C-50", :arch => 'i686',
						:batname => 'BAT1',
						:mkinitcpio_modules => ["intel_agp", "i915"],
						:partition => 'mbr', :boot => 'bios', :bootloader => 'grub',
						:linuxoptions => 'resume=/dev/mapper/MainGroup-swap lvmwait=/dev/sda1',
					},
					:xorg => {
						:vert => 31, :gvert => 30, :fontsize => 13,
						:whoriz => 1016, :wvert => 544,
						:Xresources => "Xft.dpi:"
					},
				})
			when "Gondolin"
				infos.deep_merge!({
					:cfgtype => 'light',
					:syst => {
						:type => "light",
						:laptop => true, :arch => 'i686',
						:batname => 'BAT0',
						:boot => 'bios', :bootloader => 'grub',
						:linuxoptions => 'resume=/dev/mapper/MainGroup-swap lvmwait=/dev/sda1 nomodeset',
					},
					:xorg => {
						:vert => 38, :fontsize => 13, :xaudio => 'alsa'
					},
				})
			when "Durin"
				infos.deep_merge!({
					:cfgtype => 'minimal',
					:syst => {
						:type => "light",
						:wlanname => nil, :arch => "armv6l",
						:partition => 'mbr', :boot => 'bios', :bootloader => 'custom',
					},
					:unison => { :path => "/usr/local/bin/unison" },
					:xorg => {
						:vert => 34, :fontsize => 18, :xaudio => 'alsa'
					},
				})
			when "virtual"
				infos.deep_merge!({
					:syst => {
						:bootloader => 'syslinux',
						:linuxoptions => 'root=/dev/sda2 rw vga=792',
						:linuxinitoptions => 'root=/dev/sda2 ro',
					},
				})
			when "packer"
				infos.deep_merge!({
					:syst => {
						:bootloader => 'syslinux',
						:linuxoptions => 'root=/dev/sda1 rw vga=792',
						:linuxinitoptions => 'root=/dev/sda1 ro',
						:packages => :minimal,
						:initpackages => :minimal,
					},
				})
			end
			#}}}

			# Extra config based on the info we have now {{{
			infos[:sshu]||=infos[:ssh]
			if Hash === infos[:unison]
				if (List[:sync]+List[:devel]).include?(@name) and @name != "imb"
							infos.deep_merge!({
								:unison => {:path => "#{infos[:homepath]}/bin/unison" }
							})
				end
			end
			if Hash === infos[:xorg] and !infos[:xorg].empty?
				#usually gfontsize is equal to fontsize
				infos[:xorg][:gfontsize]||=infos[:xorg][:fontsize]
				infos[:xorg][:gvimfontsize]||=infos[:xorg][:gfontsize]
			end

			#Computers where I install stuff (-> infos[:install,config])
			install=[]
			config=[]
			case infos[:cfgtype]
			when 'minimal'
				install=%w(gems-minimal)
			when 'light'
				install=%w(gems-light optdist-light)
			when 'standard'
				install=%w(gems-full optdist-light)
			when 'full'
				install=%w(gems-full optdist-full)
			end
			if List[:Xorg].include?(@name)
				config+=%w(Xorg conky)
			end
			#Offlineimap
			if @name == "Feanor" or @name == "Numenor" or @name == "imb"
				config+=%w(offlineimap)
			end
			infos.deep_merge!({
				:install => install,
				:config => config
			})

			case infos[:unisontype]
			when 'sh'
				infos.deep_merge!({
					:unison => {:type => [ "sh" ], :init => "sh"},
				})
			when 'devel'
				infos.deep_merge!({
					:unison => {:type => [ "devel", "sh" ], :init => "sh"},
				})
			when 'minimal'
				infos.deep_merge!({
					:unison => {:type => [ "minimal" ], :init => "minimal"},
				})
			when 'light'
				infos.deep_merge!({
					:unison => {:type => [ "common" ], :init => "common"},
				})
			when 'standard'
				infos.deep_merge!({
					:unison => {:type => [ "common", "data" ], :init => "common"},
				})
			when 'full'
				infos.deep_merge!({
					:unison => {:type => [ "common", "data", "booklight" ], :init => "common"},
				})
			end

			#mkinitcpio hooks
			case @name
			when "Numenor","Gondolin"
				infos[:syst][:mkinitcpio_hooks].insert(infos[:syst][:mkinitcpio_hooks].index("filesystems"),"lvm2")
			end
			case @name
			when "Numenor","Feanor"
				#On Numenor systemd will run fsck because / is mounted ro
				#On Feanor the fs is on btrfs
				infos[:syst][:mkinitcpio_hooks].delete("fsck")
			when "Durin"
				infos[:syst][:mkinitcpio_hooks].delete("resume")
			end

			if List[:Arch].include?(@name)
				services=["sshd.socket"]
				if infos[:syst][:type] =~ /standard|full/
					services.push("lightdm.service")
				end
				case @name
				when "Feanor"
					services.push("wpa_supplicant@wlan0.service")
				end
				infos.deep_merge!({:syst => {:services => services }})
			end
			#}}}

		#}}}
			return infos
		end #}}}
	end #}}}
end

if __FILE__ == $0 #{{{
	$opts={:local => false, :check => false, :export => false, :list => false,
				:value => :all }
	optparse = OptionParser.new do |opt|
		opt.banner= "#{File.basename($0)} [options] computers"
		opt.on("-l", "--[no-]list", "List computers") do |v|
			$opts[:list]=v
		end
		opt.on("-c", "--[no-]check", "Check", "Check if computers is in List") do |v|
			$opts[:check]=v
		end
		opt.on("--export=[value]", "Export") do |v|
			if v
				$opts[:export]=v
			else
				if $opts[:list]
					$opts[:export]="all"
				else
					$opts[:export]="computer:all"
				end
			end
		end
	end
	optparse.parse!

	if $opts[:list]
		computers=DR::Computers::List
		if $opts[:export]
				require 'dr/shextra'
				puts DR::Shell.export_parse(computers,$opts[:export])
		else
			puts computers
		end
	else
		computers= ARGV.length>0 ? ARGV : ['current']
		computers.each do |comp|
			comp=DR::Computer.new(comp, :check => $opts[:check])
			infos=comp.infos
			if $opts[:export]
				require 'dr/shextra'
				puts DR::Shell.export_parse(infos,$opts[:export])
			else
				puts infos
			end
		end
	end
end
#}}}
