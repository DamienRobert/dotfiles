#!/usr/bin/env ruby
require 'dr/sh'

module DR
	module Config
	end
	module Config::Infos
		extend self

		module Helpers
			def root
				begin super rescue Pathname.slash end
			end
			def machine
				begin super rescue nil end
			end
		end

		module Syst
			include Helpers
			extend self

			def cmdline_infos
				syst={}
				cmdline=Pathname.new("/proc/cmdline")
				syst[:cmdline]=cmdline.read.chomp if cmdline.readable?
				syst
			end

			def disks_infos
				syst={}
				rdisks=[]
				disks=Pathname.glob("/dev/disk/by-id/*")
				disks=disks.select {|disk| not disk.to_s =~/-part/}.map {|disk|
					File.expand_path(disk.readlink, disk.dirname)}.uniq.sort
				disks.each do |disk|
					info=SH::Run.run_simple("udevadm info -q all -n #{disk}", fail_mode: :empty, quiet: true)
					rdisks << disk if info=~/^E: ID_BUS=(ata|scsi|ide)$/
				end
				syst[:disks]=rdisks
				syst
			end

			def netdevs_infos
				syst={}
				netdevs_sys=Pathname.glob("/sys/class/net/*")
				net_eth=[]; net_wlan=[]; net_lo=[]; net=[]; net_others=[]
				netdevs_sys.each do |dev|
					devname=dev.basename.to_s
					net << devname
					if (dev+"device").exist?
						if (dev+"wireless").exist?
							net_wlan << devname
						else
							net_eth << devname
						end
					else
						devname =~ /^lo/ ? net_lo << devname : net_others << devname
					end
				end
				syst[:net]=net; syst[:net_wlan]=net_wlan;
				syst[:net_lo]=net_lo; syst[:net_eth]=net_eth;
				syst[:net_others]=net_others;
				syst
			end

			def battery_infos
				syst={}
				bat_sys=Pathname.glob("/sys/class/power_supply/*/capacity")
				syst[:batteries]=bat_sys.map {|bat| bat.dirname.basename.to_s}
				syst
			end

			def cpu_infos
				syst={}
				arch=SH::Run.run_simple("uname -m", fail_mode: :empty)
				syst[:arch]=arch.chomp
				if File.exist?("/proc/cpuinfo")
					cpu=File.read("/proc/cpuinfo")
					cpu=cpu.each_line.to_a.reverse.join("\n") #get last proc
					cpu_model=nil; cpu_nb=0;
					cpu_model=$1 if cpu =~ /^model name\s*: (.*)/
					cpu_nb=$1.to_i+1 if cpu =~ /^processor\s*: (.*)/
					syst[:cpu]="#{cpu_model} (#{cpu_nb})"
				end
				syst
			end

			def video_infos
				syst={}
				video=nil; audio=nil
				lspci=SH::Run.run_simple("lspci", fail_mode: :empty, quiet: true)
				lspci.each_line do |l|
					l.match(/VGA compatible controller: (.*)$/) do |m|
						video.nil? ? video=m[1] : video+="| #{m[1]}"
					end
					l.match(/Audio device: (.*)$/) do |m|
						audio.nil? ? audio=m[1] : audio+="| #{m[1]}"
					end
				end
				syst[:video]=video; syst[:audio]=audio
				syst
			end

			def modules_infos
				syst={}
				modules=[]
				modules_file=Pathname.new("/proc/modules")
				modules_file.readable? && modules_file.read.each_line do |l|
					modules<<l.split.first
				end
				syst[:modules]=modules
				syst
			end

			def fs_infos
				#return a hash of {mountpoint => {fsinfos}}
				syst={}
				fsoptions=SH::Run.run_simple("findmnt --raw -o SOURCE,TARGET,FSTYPE,OPTIONS,LABEL,UUID,PARTLABEL,PARTUUID,FSROOT", fail_mode: :empty, chomp: true)
				fs={}
				fsoptions.each_line.to_a[1..-1]&.each do |l|
					#two '	' means a missing option, so we want to split on / /, not on ' '
					source,target,fstype,options,label,uuid,partlabel,partuuid,fsroot=l.chomp.split(/ /)
					next unless source=~%r(^/dev/) #skip non dev mountpoints
					options=options.split(',')
					fs[target]={source: source, fstype: fstype, options: options, label: label, uuid: uuid, partlabel: partlabel, partuuid: partuuid, fsroot: fsroot}
				end
				syst[:fs]=fs
				syst
			end

			def machine_infos
				syst={}
				files={machine_id: root+"etc/machine-id", hostname: root+"etc/hostname"}
				files.each do |key,file|
					file=Pathname.new(file)
					syst[key]=file.read.chomp if file.readable?
				end
				syst[:hostname]=SH::Run.run_simple("hostname", fail_mode: :empty, chomp: true) unless syst[:hostname]

				files={machine_info: root+"etc/machine-info", locale_info: root+"etc/locale.conf",
						vconsole: root+"etc/vconsole.conf", os_release: root+"etc/os-release"}
				files.each do |key,file|
					file=Pathname.new(file)
					syst[key]=SH::Export.import_parse(file.read) if file.readable?
				end
				syst[:os_release] && (id=syst[:os_release][:id]) && syst[:distribution]=id

				progs={hostnamectl: 'hostnamectl', localectl: 'localectl', timedatectl: 'timedatectl'}
				opts=[]
				opts=["-M", machine] if machine
				#hostnamectl: a lot of the fields are redundant with uname, os-release and machine-info but the Chassis is interesting
				progs.each do |key,prog|
					if SH.find_executable(prog)
						syst[key]||={}
						output=SH::Run.run_simple(prog, *opts, fail_mode: :empty, chomp: true)
						output.each_line do |l|
							next if l.empty?
							#we want a non greedy match before the first ':'
							field,value=l.match(/\s*(.*?):\s*(.*)/)&.captures
							syst[key][field]=value
						end
					end
				end
				syst
			end

			def passwd_infos
				syst={}
				users={}
				groups={}
				group=Pathname.new(root+"etc/group")
				if group.readable? 
					group.readlines.each do |l|
						name,_pass,gid,members=l.chomp.split(':')
						groups[name]={gid: gid.to_i, members: (members && members.split(',')) || []}
					end
				end
				passwd=Pathname.new(root+"etc/passwd")
				if passwd.readable? 
					passwd.readlines.each do |l|
						name,_pass,uid,gid,info,home,shell=l.chomp.split(':')
						if uid.to_i >= 1000
							users[name]={uid: uid.to_i, gid: gid.to_i, info: info, home: home, shell: shell}
							# groups=SH::Run.run_simple("groups #{name}", fail_mode: :nil, chomp: true)
							# users[name][:groups]=groups.split if groups
							grp=groups.keys.select {|g| groups[g][:members].include?(name)}
							users[name][:groups]=grp
							users[name][:group]=groups.keys.find {|g| groups[g][:gid]==gid.to_i}
						end
					end
				end
				syst[:users]=users
				syst[:groups]=groups
				syst
			end

			def tz_infos
				syst={}
				tz_f=Pathname.new(root+"etc/localtime")
				if tz_f.symlink?
					tz=tz_f.readlink.to_s[(%r!/zoneinfo/(.*)$!),1]
					syst[:timezone]=tz if tz
				end
				syst
			end

			def uname
				syst={}
				syst[:uname]=Etc.uname
				syst
			end
		end

		module Xorg
			extend self
			def xorg_infos
				xorg={}
				xdpy=SH::Run.run_simple("xdpyinfo", fail_mode: :empty, quiet: true)
				screen=nil
				xdpy.each_line do |l|
					l.match(/^screen\s+#(\d+):/) do |m|
						screen=:"screen#{m[1]}"
						xorg[screen]={}
					end
					l.match(/dimensions:\s+(\d+x\d+)\s+pixels\s+\((\d+x\d+)\s+millimeters\)/) do |m|
						width,height=m[1].split('x')
						swidth,sheight=m[2].split('x')
						xorg[screen].merge!({
							:resolution => {:width => width.to_i, :height => height.to_i},
							:size => {:width => swidth.to_i, :height => sheight.to_i}
						})
					end
					l.match(/resolution:\s*(.*x.*) dots per inch/) do |m|
						width,height=m[1].split('x')
						xorg[screen][:dpi]={:width => width.to_i, :height => height.to_i}
					end
				end
				{screens: xorg}
			end

			def xrandr_infos
				xorg={}
				xrandr=SH::Run.run_simple("xrandr", fail_mode: :empty, quiet: true)
				screen=nil
				xrandr.each_line do |l|
					l.match(/^Screen\s*(\d*):.*current\s*(\d*)\s*x\s*(\d*)/) do |m|
						screen=:"screen#{m[1]}"
						xorg[screen]={resolution: {width: m[2].to_i, height: m[3].to_i},
							monitors: {}}
					end
					l.match(/^([\w-]*)\s+disconnected/) do |m|
						xorg[screen][:monitors][m[1]]={connected: false}
					end
					l.match(/^([\w-]*)\s+connected\s+(?:primary\s+)?(\d+)x(\d+)([+-]\d*)([+-]\d*).*\s+(\d+)mm\s+x\s+(\d+)mm/) do |m|
						xorg[screen][:monitors][m[1]]={connected: true,
							primary: !!l.match(/\s+primary\s+/),
							resolution: {width: m[2].to_i, height: m[3].to_i},
							position: {x: m[4].to_i, y: m[5].to_i},
							size: {width: m[6].to_i, height: m[7].to_i},
							dpi: {width: (25.4*m[2].to_f/m[6].to_f).round, height: (25.4*m[3].to_f/m[7].to_f).round}
						}
					end
				end
				{xrandr: xorg}
			end

			def xkbmap_infos
				xorg={}
				if ENV['DISPLAY'] and SH.find_executable('setxkbmap')
					setxkb=SH::Run.run_simple('setxkbmap -print', fail_mode: :empty)
					setxkb.match(/xkb_symbols\s*{ include "(.*)"\s*};/) do |m|
						xorg[:xkb_options]=m[1]
					end
				end
				xorg
			end
		end

		module User
			extend self
			def id_infos
				user={}
				user[:uid]=ENV['UID']||SH::Run.run_simple('id -u', fail_mode: :nil, chomp: true)
				user[:gid]=ENV['GID']||SH::Run.run_simple('id -g', fail_mode: :nil, chomp: true)
				user[:username]=ENV['USER']||SH::Run.run_simple('id -un', fail_mode: :nil, chomp: true)
				user[:group]=SH::Run.run_simple('id -gn', fail_mode: :nil, chomp: true)
				user[:groups]=SH::Run.run_simple('id -Gn', fail_mode: :nil, chomp: true)&.split
				user
			end
		end

		module Files
			extend self

			def dir_infos
				files={}
				home=Pathname.new(Dir.home)
				files[:homepath]=home
				files[:tmpfiles]=[home+"tmp", Pathname.new("/var/tmp"), Pathname.new("/tmp")].select {|d| d.directory?}
				files[:xdg_config_home]=Pathname.new(ENV['XDG_CONFIG_HOME'] || (home+".config"))
				files[:xdg_data_home]=Pathname.new(ENV['XDG_DATA_HOME'] || (home+".local/share"))
				xdg_data_dirs=ENV['XDG_DATA_DIRS'] || "/usr/local/share/:/usr/share/"
				files[:xdg_data_dirs]=xdg_data_dirs.split(':').map {|x| Pathname.new(x)}
				xdg_config_dirs=ENV['XDG_CONFIG_DIRS'] || "/etc/xdg/"
				files[:xdg_config_dirs]=xdg_config_dirs.split(':').map {|x| Pathname.new(x)}
				files[:xdg_cache_home]=Pathname.new(ENV['XDG_CACHE_HOME'] || (home+".cache"))
				files[:xdg_runtime_dir]=Pathname.new(ENV['XDG_RUNTIME_DIR']||home+"tmp")
				#files[:runtime_dir]=[files[:xdg_runtime_dir], Pathname.new("/run/user/#{user[:uid]}"), home+"tmp"].select {|d| d.directory?}
				files
			end

		end

		def modules
			(self.constants - [:All]).select{|c| !c.to_s.end_with?("Helpers")}.select {|c| const_get(c).is_a?(Module)}
		end
		def methods(mod)
			mod=const_get(mod.to_s.to_sym) unless mod.is_a?(Module)
			mod.public_methods(false).select {|m| m.to_s =~ /_infos$/}
		end

		# From https://stackoverflow.com/questions/1509915/converting-camel-case-to-underscore-case-in-ruby
		def underscore(str)
			str.gsub(/::/, '/').
			gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
			gsub(/([a-z\d])([A-Z])/,'\1_\2').
			tr("-", "_").
			downcase
		end

		def infos_from_module(mod, methods: true, context: self)
			r={}
			mod=const_get(mod.to_s.to_sym) unless mod.is_a?(Module)
			context=context.clone
			context.singleton_class.instance_eval do
				include mod
			end
			methods=self.methods(mod) if methods==true
			methods.each do |m|
				begin
					r.merge!(context.send(m))
				rescue => e
					warn "ERROR in infos #{mod}.#{m}: #{e} #{e.backtrace.first}"
				end
			end
			r
		end

		def infos(modules=self.modules, context: self, whitelist: nil, blacklist: nil)
			r={}
			unless whitelist
				whitelist={}
				modules.each { |mod| whitelist[mod]=true }
			end
			whitelist.each do |mod, meths|
				next unless modules.include?(mod)
				meths=methods(mod) if meths==true
				blacklist_mod=blacklist&.fetch(mod, [])||[]
				meths -= blacklist_mod
				r[underscore(mod.to_s).to_sym]=infos_from_module(mod, methods: meths, context: context)
			end
			r
		end

		# only gather infos from files (for chroot systems)
		def file_infos(modules=self.modules, context: self)
			methods={:Syst => %i(machine_infos passwd_infos tz_infos)}
			infos(modules, context: context, whitelist: methods)
		end

		def user_infos(modules=self.modules, context: self)
			blacklist={:Syst => %i(passwd_infos modules_infos)}
			infos(modules, context: context, blacklist: blacklist)
		end
	end
end

if __FILE__ == $0
	require 'optparse'
	require 'dr/base/utils' #pretty_print
	opts={}
	optparse = OptionParser.new do |opt|
		opt.on("--pretty","=[color]", "Pretty Print") do |v|
			opts[:pretty]=v
		end
	end
	optparse.parse!
	infos = ARGV.empty? ? DR::Config::Infos.infos : DR::Config::Infos.infos(ARGV)
	DR::Utils.pretty_print(infos, pretty: opts[:pretty])
end
