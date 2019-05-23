# vim: fdm=marker

module DR
	module Config
		class Bootloader

			def initialize(process, **opts, &b)
				@process=process
				@computer=@process.computer
				@bootloader=opts[:bootloader] || Array(@computer.dig(:syst, :bootloader))&.first || "systemd-boot"

				@arch=opts[:arch]||@computer[:syst][:arch]||"x86_64"
				@bootfiles_perm=0644 #the permissions of the files created 
				# @bootfiles_perm=0755 if @computer.dig(:syst, :boot)==:uefi
				#On vfat the fmask in 0022 so all files are created with +x and
				#this confuse gitdiff. The solution: either put bootfiles_perm=0755
				#for these computer or modify fstab to use fmask=0133

				@bootdir=Pathname.new("boot/") #where /boot is mounted (relative to /)
				@espdir=@bootdir #where the esp is mounted
				@kerneldir=@bootdir #where the kernel is installed
				@bootloaderdir=@bootdir #from where the bootloader looks for files
				@installdir=@bootdir #where we shall install memtest/efishell

				@default_initrd=[]
				@default_linux_options=@computer.dig(:syst,:bootoptions,:default_linux_options, default: ["rw"])+@computer.dig(:syst,:bootoptions,:linux_options, default: [])
				@default_fallback_linux_options=@computer.dig(:syst,:bootoptions,:default_linux_fallback_options, default: @default_linux_options)+@computer.dig(:syst,:bootoptions,:linux_fallback_options, default: [])
				@default_rootflags=@computer.dig(:syst,:bootoptions,:rootflags, default: [])
				@default_root=@computer.dig(:syst,:bootoptions,:root)
				@entries=[]

				case @bootloader
				when "systemd-boot"
					@default_entry="10-arch"
					@installdir=@espdir+"EFI/"
					@bootloaderdir=@espdir
				when "syslinux"
					@default_entry="arch"
					@bootloaderdir=@bootdir+"syslinux/"
				end

				find_microcode
				find_resume_partition
				self.instance_eval(&b) if b
			end

			private def write_file(*args, **opts)
				@process.write_file(*args, perm:@bootfiles_perm, **opts)
			end
			private def copy_file(*args, **opts)
				@process.copy_file(*args, perm:@bootfiles_perm, **opts)
			end

			protected def rarch(arch=@arch)
				rarch=arch
				rarch="ia32" if arch == "i686"
				rarch="x64" if arch == "x86_64"
				rarch
			end

			private def bootloader_to_file(file)
				if file.absolute?
					file=file.relative_path_from(@process.dir[:target])
				end
				f=@bootloaderdir.rel_path_to(file, inside: true)
				# puts "file: #{file}, relative: #{f}"
				return "/#{f}" if @bootloader=="systemd-boot"
				f
			end

			private def find_microcode
				if @process.present?
					bootkernel=@process.dir[:target]+@kerneldir
					#'/boot' may not be user readable, in this case fallback to see if we find the license folder
					if bootkernel.readable? && (ucode=bootkernel+"intel-ucode.img").file? or
							(!bootkernel.readable? && Pathname.new(@process.dir[:target]+"usr/share/licenses/intel-ucode/").directory?)
						@process.logger.info "! Found intel-ucode: #{ucode}"
						@default_initrd << "intel-ucode.img"
					end
				end
			end

			private def find_resume_partition
				@default_linux_options << 'resume=PARTLABEL=swap' if @computer.current? and system("findfs PARTLABEL=swap >/dev/null")
			end

			# Note: linux and initrd are relative to @kerneldir
			def linux_entry(filename: 'arch', label: nil, title: 'Arch Linux', linux: "vmlinuz-linux", initrd: "initramfs-linux.img", options: "", rootflags: "", machine_id: @computer[:syst][:machine_id], default_initrd: true, default_options: true, default_rootflags: true, root: @default_root)

				label ||=filename[/^[0-9]*-(.*)$/,1]

				initrd=Array(initrd)
				initrd=@default_initrd+initrd if default_initrd
				initrd.map! { |rd| @kerneldir+rd }
				linux=@kerneldir+linux
				rootflags=rootflags.shellsplit if rootflags.is_a?(String)
				options=options.shellsplit if options.is_a?(String)

				linux_default_options=case default_options
				when true
					@default_linux_options
				when :fallback
					@default_linux_fallback_options
				when String
					default_options.shellsplit
				when Array
					default_options
				else
					[]
				end
				root_default_options=case default_rootflags
				when true
					@default_rootflags
				when String
					default_rootflags.shellsplit
				when Array
					default_rootflags
				else
					[]
				end
				rootflags=root_default_options+rootflags
				options=linux_default_options+options
				options << "root=#{root}" unless root.nil? or root.empty?
				options << "rootflags=#{rootflags.join(',')}" unless rootflags.empty?
				#options=options.shelljoin
				options=options.join(" ")

				return {
					filename: filename,
					label: label,
					title: title,
					linux: linux,
					initrd: initrd,
					options: options,
					machine_id: machine_id
				}
			end

			def static_linux_entries
				@entries+=[
					linux_entry(
					filename: "10-arch",
					title: "Arch Linux"),
					linux_entry(
					filename: "11-arch-fallback",
					title: "Arch Linux (fallback)",
					initrd: "initramfs-linux-fallback.img",
					default_options: :fallback)]
			end

			def dynamic_linux_entries(kerneldir)
				snapshots=[]
				if (snapshotdir=kerneldir+"@snapshots").directory?
					snapshots=snapshotdir.glob('*').map {|i| snapshotdir.basename+i}
				end

				([".", "linux-init"]+snapshots).each do |basedir|
					basedir=Pathname.new(basedir)
					order=30; dirlabel=basedir.basename.to_s
					if basedir.to_s=="."
						order=10 ; dirlabel=nil
					end
					dir=kerneldir+basedir
					next unless dir.directory?

					rootflags=[]
					if basedir.dirname==snapshotdir.basename
						subdir=basedir.to_s.sub('archlinux','slash')
						if (@process.dir[:target]+DR::Computer::ROOTLEAF+subdir).directory?
							rootflags << "subvol=#{subdir}"
						end
					end

					dir.glob("*vmlinuz-linux*", expand: true).each do |kernel|
						preextra=""; postextra=""
						kernel.basename.to_s.match(/(.*)vmlinuz-linux(.*)/) do |m|
							preextra=m[1]; postextra=m[2]
						end
						%w(initramfs-linux.img initramfs-linux-fallback.img).each do |initrd|
							initramfs=dir+initrd.sub("initramfs-linux", "#{preextra}initramfs-linux#{postextra}")
							if initramfs.exist?
								labelorder=order
								postlabel=""
								posttitle=""
								if initrd=~/fallback/
									labelorder=order+1
									postlabel="-fallback"
									posttitle=" (fallback)"
									
								end
								linux_entry={filename: "#{labelorder}-#{dirlabel.nil? ? "" : dirlabel+"-"}#{preextra.empty? ? "arch" : preextra}#{postextra}#{postlabel}",
										 title: "#{dirlabel.nil? ? "" : dirlabel+": "}#{preextra.empty? ? "Arch Linux" : preextra}#{posttitle}#{postextra.empty? ? "" : " [#{postextra}]"}",
									linux: kernel,
									initrd: initramfs,
									rootflags: rootflags}
								linux_entry=yield(basedir, linux_entry) if block_given?
								@entries << linux_entry(** linux_entry) if linux_entry
							end
							# initramfs=dir+"#{extra}initramfs-linux-fallback.img"
							# if initramfs.exist?
							# 	@entries << linux_entry(
							# 		filename: "#{order+1}-#{dirlabel.nil? "" : dirlabel+"-"}#{extra}",
							# 		title: "#{dirlabel.nil? "" : dir+": "}Arch Linux (fallback) [#{extra}]",
							# 		linux: kernel,
							# 		initrd: initramfs,
							# 		default_options: :fallback)
							# end
						end
					end
				end
			end

			def linux_entries(&b)
				if @process.present?
					bootkernel=@process.dir[:target]+@kerneldir
					dynamic_linux_entries(bootkernel, &b)
				else
					static_linux_entries
				end
			end

			def efi_shell(version: "v2", name: :auto, arch: @arch)
				return unless arch
				rarch=self.rarch(arch)
				@process.logger.info "! boot: EFI shell (#{arch}-#{version})"
				filename="shell_#{rarch}_#{version}.efi"
				file="boot/efi_shell/"+filename
				case name
				when :auto
					target=@installdir+"shell/shellx64.efi"
				when :version
					target=@installdir+"shell/"+filename
				else
					target=name
				end
				copy_file(file, target)
				@entries << {filename: "80-uefi-shell-#{arch}-#{version}",
					title: "UEFI Shell #{arch}#{version}",
					exec: target} unless name==:auto
			end

			# http://www.memtest.org/ Memtest86+ (RAM test)
			# update: Install memtest86+ to get memtest86+.bin; to get the efi files download the iso
			def memtest(arch=@arch)
				return unless arch
				rarch=self.rarch(arch)
				@process.logger.info "! boot: memtest86+ (#{arch})"
				filename="memtest86_#{rarch}.efi"
				file=Pathname.new("boot/memtest86+/"+filename)
				target=@installdir+"memtest86+/"+filename
				target=@installdir+"memtest86+/memtest.bin" if @bootloader == "syslinux"
				copy_file(file, target)
				copy_file(file.dirname+"MT86.png", target.dirname)
				@entries << {filename: "85-memtest86+",
					label: "memtest",
					title: "Memtest 86+",
					exec: target}
			end

			def misc_entries
				case @bootloader
				when "syslinux"
					hdt_mod=false
					@entries+=syslinux_post(hdt_mod:hdt_mod)
				end
			end

			def all_entries(&b)
				linux_entries(&b)
				efi_shell if @bootloader == "systemd-boot"
				memtest
				misc_entries
			end

			private def get_one_entry(entry)
				data=""
				%i(machine_id title exec linux initrd options).each do |k|
					label=k.to_s
					case @bootloader
					when "systemd-boot"
						label="machine-id" if label=="machine_id"
						label="efi" if label=="exec"
					when "syslinux"
						label"=MENU LABEL" if label=="title"
						label="LINUX" if label=="linux"
						label="INITRD" if label=="initrd"
						label="APPEND" if label=="options"
						label="COM32" if label=="exec"
					end
					ent=entry[k]
					if k==:linux or k==:exec
						ent && ent=bootloader_to_file(ent)
					end
					if k==:initrd
						ent && ent=ent.map {|l| bootloader_to_file(l)}
					end

					case ent
					when Array
						data << ent.map {|l| "#{label} #{l}"}.join("\n")+"\n"
					when nil, false
						#do nothing
					else
						data << "#{label} #{ent}\n"
					end
				end
				data
			end

			def write_entries(entries=@entries)
				case @bootloader
				when "systemd-boot"
					dir=@bootloaderdir+"loader/entries"
					entries.each do |entry|
						filename=Pathname.new(entry[:filename])
						filename="#{filename}.conf" unless filename.extname==".conf"
						write_file(dir+"#{entry[:filename]}.conf",get_one_entry(entry))
					end
					write_file(@espdir+"loader/loader.conf", <<~EOS) if @default_entry
						timeout 1
						default #{@default_entry}
					EOS
				when "syslinux"
					content=syslinux_config_ui
					content+=syslinux_config_menucolor
					content+="DEFAULT #{@default}\n" if @default_entry
					if @computer[:syst][:lang]=="fr"
						content+="KBDMAP fr.ktl\n"
						copy_file("boot/syslinux/fr.ktl",@bootloaderdir)
					end
					content+=entries.map {|entry| get_one_entry(entry)}.join("\n\n")
					write_file(@syslinuxdir+"syslinux.cfg", content)
				when 'grub' #{{{
					content=<<~EOS
						GRUB_DEFAULT=0
						GRUB_TIMEOUT=5
						GRUB_DISTRIBUTOR="Arch Linux"
						GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 console=tty1"
						GRUB_CMDLINE_LINUX="#{@default_linux_options}"
						
						# Preload both GPT and MBR modules so that they are not missed
						GRUB_PRELOAD_MODULES="part_gpt part_msdos"
						
						# Uncomment to enable Hidden Menu, and optionally hide the timeout count
						#GRUB_HIDDEN_TIMEOUT=5
						#GRUB_HIDDEN_TIMEOUT_QUIET=true
						
						# Uncomment to use basic console
						#GRUB_TERMINAL_INPUT=console
						
						# Uncomment to disable graphical terminal
						#GRUB_TERMINAL_OUTPUT=console
						
						# The resolution used on graphical terminal
						# note that you can use only modes which your graphic card supports via VBE
						# you can see them in real GRUB with the command `vbeinfo'
						GRUB_GFXMODE=auto
						
						# Uncomment to allow the kernel use the same resolution used by grub
						GRUB_GFXPAYLOAD_LINUX=keep
						
						# Uncomment if you want GRUB to pass to the Linux kernel the old parameter
						# format "root=/dev/xxx" instead of "root=/dev/disk/by-uuid/xxx"
						#GRUB_DISABLE_LINUX_UUID=true
						
						# Uncomment to disable generation of recovery mode menu entries
						#GRUB_DISABLE_RECOVERY=true
						
						# Uncomment and set to the desired menu colors.  Used by normal and wallpaper
						# modes only.  Entries specified as foreground/background.
						GRUB_COLOR_NORMAL="light-blue/black"
						GRUB_COLOR_HIGHLIGHT="light-cyan/blue"
						
						# Uncomment one of them for the gfx desired, a image background or a gfxtheme
						#GRUB_BACKGROUND="/path/to/wallpaper"
						#GRUB_THEME="/path/to/gfxtheme"
						
						# Uncomment to get a beep at GRUB start
						#GRUB_INIT_TUNE="480 440 1"
					EOS
					@process.write_file("etc/default/grub",content)
					#}}}
				end
			end

			private def syslinux_entries(entries)
				r=""
				entries.each do |entry|
					(title=entry[:title]) && r << "MENU LABEL #{title}\n"
					(linux=entry[:linux]) && r << "LINUX #{syslinux_kernel+linux}\n"
					(options=entry[:options]) && r << "APPEND #{options}\n"
					(initrds=Array(entry[:initrd]).map {|initrd| syslinux_kernel+initrd}.join(',')) &&
						r << "INITRD #{initrds}\n"
					(com32=entry[:com32]) && r << "COM32 #{com32}\n"
				end
			end

			def syslinux_config_menucolor #{{{
			# Refer to http://syslinux.zytor.com/wiki/index.php/Doc/menu
				return <<~EOS
					MENU TITLE Arch Linux
					MENU COLOR border       30;44    #40ffffff #a0000000 std
					MENU COLOR title        1;36;44  #9033ccff #a0000000 std
					MENU COLOR sel          7;37;40  #e0ffffff #20ffffff all
					MENU COLOR unsel        37;44    #50ffffff #a0000000 std
					MENU COLOR help         37;40    #c0ffffff #a0000000 std
					MENU COLOR timeout_msg  37;40    #80ffffff #00000000 std
					MENU COLOR timeout      1;37;40  #c0ffffff #00000000 std
					MENU COLOR msg07        37;40    #90ffffff #a0000000 std
					MENU COLOR tabmsg       31;40    #30ffffff #00000000 std
				EOS
			end #}}}

			private def syslinux_config_vesa_ui #{{{
				copy_file("boot/syslinux/splash.png",@bootloaderdir)
				return <<~EOS
					SERIAL 0 38400
					UI vesamenu.c32
					MENU TITLE Arch Linux
					MENU BACKGROUND splash.png

					MENU WIDTH 78
					MENU MARGIN 4
					MENU ROWS 7
					MENU VSHIFT 10
					MENU TABMSGROW 14
					MENU CMDLINEROW 14
					MENU HELPMSGROW 16
					MENU HELPMSGENDROW 29
				EOS
			end #}}}

			private def syslinux_config_ui #{{{
				return <<~EOS
					PROMPT 0
					TIMEOUT 50
					UI menu.c32
					MENU SHIFTKEY #show menu only if ALT is on
				EOS
			end #}}}

			private def syslinux_post(hdt_mod: false) #{{{1
  			#hdt: http://hdt-project.org/
  			r=[]
  			entry={label: hdt,
		 			title: "HDT (Hardware Detection Tool)",
					exec: "hdt.c32"}
				if hdt_mod
					entry[:options]="modules_alias=hdt/modalias.gz pciids=hdt/pciids.gz"
					copy_file("boot/syslinux/hdt",@bootloaderdir)
				end
  			r << entry
  			r << {label: "reboot", title: "Reboot", exec: "reboot.c32"}
  			r << {label: "poweroff", title: "Poweroff", exec: "poweroff.c32"}
			end #}}}
		end
	end
end
