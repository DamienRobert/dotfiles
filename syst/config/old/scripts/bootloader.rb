# vim: ft=ruby fdm=syntax
bootloaders=@computer[:syst][:bootloader]
bootloaders=[bootloaders] if String === bootloaders
bootloaders=[] unless bootloaders

arch=@computer[:syst][:arch]||"x86_64"
rarch="ia32" if arch == "i686"
rarch="x64" if arch == "x86_64"
boot=Pathname.new("boot") #where /boot is mounted (relative to /)
esp=boot #where the esp is mounted
syslinuxdir=boot+"syslinux" #syslinux install dir
boot_kernel=Pathname.new("/") #where the kernel is installed relative to boot
esp_kernel=boot_kernel #where the kernel/initrd is installed relative to the esp
syslinux_kernel=Pathname.new("../") #where the kernel is installed relative to syslinux
@bootfiles_perm=0644 #the permissions of the files created
#On vfat the fmask in 0022 so all files are created with +x and this confuse
#gitdiff. The solution: either put bootfiles_perm=0755 for these computer
#or modify fstab to use fmask=0133

linux_options = 'root=PARTLABEL=slash'
linux_init_options = nil
default_systemd_boot="10-arch"
default_syslinux="arch"
case @computer.name
when "Feanor" #systemd-boot
	fsoptions="rw,compress=lzo,noatime,autodefrag"
	linux_options = %{root=PARTUUID="986178da-85b0-4a7c-a0ec-600adfa32be7" rootflags=#{fsoptions} libahci.ignore_sss=1}
	linux_init_options = %{root=PARTUUID="986178da-85b0-4a7c-a0ec-600adfa32be7" rootflags=subvol=/slash-init,#{fsoptions}}
when "Mithrim" #systemd-boot
	fsoptions="rw,compress=lzo,noatime,autodefrag"
	linux_options = %{root=UUID="1db5b600-df3e-4d1e-9eef-6a0a7fda491d" rootflags=subvol=/slash,#{fsoptions} resume=UUID=82af0d2f-5ef6-418a-8656-bdfe843f19e1}
	linux_init_options = %{root=UUID="1db5b600-df3e-4d1e-9eef-6a0a7fda491d" rootflags=subvol=/slash-init,#{fsoptions}}
when "Valinor" #grub, so the root is autodetected by grub-mkconfig
	linux_options = 'resume=/dev/sda5 rw'
when "Numenor" #grub
	linux_options = 'resume=/dev/mapper/MainGroup-swap lvmwait=/dev/sda1 rw'
when "Gondolin" #grub
	linux_options = 'resume=/dev/mapper/MainGroup-swap lvmwait=/dev/sda1 nomodeset rw'
when "FleurBleue" #syslinux
	linux_options = 'root=LABEL=slash resume=LABEL=swap rw'
when /^Baggins/ #systemd-boot+syslinux
	#syslinuxdir=boot+"arch/syslinux"
	#boot_kernel=Pathname.new("/arch")
	#esp_kernel=boot_kernel
	linux_options="root=PARTLABEL=slash rw"
	#default_systemd_boot="10-arch64"
	#default_syslinux="arch64"
when "virtual"
	linux_options = 'root=/dev/sda2 rw vga=792'
	linux_init_options = 'root=/dev/sda2 ro'
when "packer"
	linux_options = 'root=/dev/sda1 rw vga=792'
	linux_init_options = 'root=/dev/sda1 ro'
else #try to find the settings automatically
	if @computer.local?
		linux_options=""
		linux_options += 'root=PARTLABEL=slash' if system("findfs PARTLABEL=slash")
		linux_options += ' resume=PARTLABEL=swap' if system("findfs PARTLABEL=swap")
		fsoptions=""
		if @computer[:syst][:fs] && @computer[:syst][:fs]["/"]
			fsoptions=@computer[:syst][:fs]["/"][:options]
			#Note: btrfs has default options, so these are the same
			#rootflags=rw,subvol=/slash,autodefrag
			#rootflags=rw,relatime,ssd,space_cache,autodefrag,subvolid=257,subvol=/slash
			fsoptions.reject!{|k| k.match(/^(relatime|ssd|space_cache|subvolid=)/)} if @computer[:syst][:fs]["/"][:fstype]=="btrfs"
			fsoptions=fsoptions.join(",")
		end
		linux_options+=" rootflags=#{fsoptions}" unless fsoptions.empty?
		if Pathname.new("/rootleaf/slash-init").directory?
			linux_init_options=linux_options.sub('subvol=/slash','subvol=/slash-init')
		end
	end
end
linux_fallback_options||=linux_options
linux_init_fallback_options||=linux_init_options
infos={
	arch: arch, rarch: rarch,
	boot: boot, esp: esp, syslinuxdir: syslinuxdir,
	boot_kernel: boot_kernel, esp_kernel: esp_kernel, syslinux_kernel: syslinux_kernel
	}

def linux_entry(filename: 'arch', title: 'Arch Linux', linux: "vmlinuz-linux", initrd: "initramfs-linux.img", options:"", **infos)
	label=filename[/^[0-9]*-(.*)$/,1]
	return {
		filename: filename,
		label: label,
		title: title,
		linux: linux,
		initrd: initrd,
		options: options,
	}
end
linux_entries=[
	linux_entry(
		filename: "10-arch",
		title: "Arch Linux",
		kernel: "vmlinuz-linux",
		initrd: "initramfs-linux.img",
		options: linux_options,
		**infos),
	linux_entry(
		filename: "11-arch-fallback",
		title: "Arch Linux (fallback)",
		kernel: "vmlinuz-linux",
		initrd: "initramfs-linux-fallback.img",
		options: linux_fallback_options,
		**infos),
	]
case @computer.name
when "Mithrim"
	linux_entries+=[
	linux_entry(
		filename: "20-arch-ck",
		title: "Arch Linux CK",
		kernel: "vmlinuz-linux-ck",
		initrd: "initramfs-linux-ck.img",
		options: linux_options,
		**infos),
	linux_entry(
		filename: "21-arch-ck-fallback",
		title: "Arch Linux CK (fallback)",
		kernel: "vmlinuz-linux-ck",
		initrd: "initramfs-linux-ck-fallback.img",
		options: linux_fallback_options,
		**infos),
	]
end
if linux_init_options
	linux_entries+=[
		linux_entry(
			filename: "30-arch-init",
			title: "Arch Linux (init)",
			kernel: "linux-init/vmlinuz-linux",
			initrd: "linux-init/initramfs-linux.img",
			options: linux_init_options,
			**infos),
		linux_entry(
			filename: "31-arch-init-fallback",
			title: "Arch Linux (init fallback)",
			kernel: "linux-init/vmlinuz-linux",
			initrd: "linux-init/initramfs-linux-fallback.img",
			options: linux_init_fallback_options,
			**infos),
		]
end
# if @computer.name=~/^Baggins/
# linux_entries=[
# 	linux_entry(
# 		filename: "10-arch64",
# 		title: "Arch Linux (64 bits)",
# 		kernel: "/x86_64/vmlinuz-linux",
# 		initrd: "/x86_64/initramfs-linux.img",
# 		options: "#{linux_options} rootflagls=subvol=slash",
# 		help: "Boot the Arch Linux (x86_64) usb key.",
# 		**infos),
# 	linux_entry(
# 		filename: "11-arch64-fallback",
# 		title: "Arch Linux (64 bits fallback)",
# 		kernel: "/x86_64/vmlinuz-linux",
# 		initrd: "/x86_64/initramfs-linux-fallback.img",
# 		options: "#{linux_fallback_options} rootflagls=subvol=slash",
# 		help: "Boot the Arch Linux (x86_64) usb key (fallback).",
# 		**infos),
# 	linux_entry(
# 		filename: "15-arch32",
# 		title: "Arch Linux (32 bits)",
# 		kernel: "/i686/vmlinuz-linux",
# 		initrd: "/i686/initramfs-linux.img",
# 		options: "#{linux_options} rootflagls=subvol=slash32",
# 		help: "Boot the Arch Linux (i686) usb key.",
# 		**infos),
# 	linux_entry(
# 		filename: "16-arch32-fallback",
# 		title: "Arch Linux (32 bits fallback)",
# 		kernel: "/i686/vmlinuz-linux",
# 		initrd: "/i686/initramfs-linux-fallback.img",
# 		options: "#{linux_fallback_options} rootflagls=subvol=slash32",
# 		help: "Boot the Arch Linux (i686) usb key (fallback).",
# 		**infos),
# 	]
# end

#TODO: handle non local case
if @processor.local?
	bootkernel=Pathname.slash+infos[:boot]+"./#{infos[:boot_kernel]}"

	#'/boot' may not be user readable, in this case fallback to see if we find the license folder
	if bootkernel.readable? && (bootkernel+"intel-ucode.img").file? or
			(!bootkernel.readable? && Pathname.new("/usr/share/licenses/intel-ucode/").directory?)
		puts "Found intel-ucode: #{Pathname.slash+infos[:boot]+"./#{infos[:boot_kernel]}"+"intel-ucode.img"}"
		linux_entries.each do |entry|
			entry[:initrd]=["intel-ucode.img"]+Array(entry[:initrd])
		end
	end
end

def cp(input,output)
	puts "- #{input} -> #{output}"
	FileUtils.cp(input,output)
end
def cp_r(input,output)
	puts "- #{input} -> #{output}"
	FileUtils.cp_r(input,output)
end

def systemdboot_entries(entries,**infos)
	dir=infos[:esp]+"loader/entries"
	entries.each do |entry|
		data=""
		machine_id=@computer[:syst][:machine_id]
		data<<"machine-id #{machine_id}\n" if machine_id
		data+=<<EOS
title #{entry[:title]}
linux #{infos[:esp_kernel]+entry[:linux]}
EOS
		Array(entry[:initrd]).each do |initrd|
			data+="initrd #{infos[:esp_kernel]+initrd}\n"
		end
		data+=<<EOS
options #{entry[:options]}
EOS
		write_file(dir+"#{entry[:filename]}.conf",data,perm:@bootfiles_perm)
	end
end
def syslinux_entries(entries,**infos)
	content="\n"
	dir=infos[:syslinux_kernel]
	entries.each do |entry|
		content+="LABEL #{entry[:label]}\n"
		content+="TEXT HELP\n#{entry[:help]}\nENDTEXT\n" if entry[:help]
		initrds=Array(entry[:initrd]).map {|initrd| dir+initrd}.join(',')
		content+=<<EOS
MENU LABEL #{entry[:title]}
LINUX #{dir+entry[:linux]}
APPEND #{entry[:options]}
INITRD #{initrds}
EOS
	end
	return content
end

# http://www.memtest.org/ Memtest86+ (RAM test)
# update: Install memtest86+ to get memtest86+.bin
# to get the efi files download the iso
def memtest(mode: "systemd_boot",**infos)
	return unless infos[:arch]
	arch=infos[:arch]; rarch=infos[:rarch]
	puts "! boot: memtest86+ (#{arch} #{mode})"
	filename="memtest86_#{rarch}.efi"
	file=Pathname.new("boot/memtest86+/"+filename)
	case mode
	when "systemd_boot"
		target="EFI/memtest86+/"+filename
		output=Pathname.new(infos[:esp]+target)
	when "syslinux"
		target="memtest86+/memtest.bin"
		output=Pathname.new(infos[:boot]+"./#{infos[:boot_kernel]}"+target)
	end
	copy_file(file,output,perm: @bootfiles_perm)
	copy_file(file.dirname+"MT86.png",output.dirname,perm: @bootfiles_perm)
	case mode
	when "systemd_boot"
		write_file(infos[:esp]+"loader/entries/85-memtest86+.conf",<<EOS,perm:@bootfiles_perm)
title	Memtest 86+
efi	/#{target}
EOS
	when "syslinux"
		return <<EOS
LABEL memtest
	MENU LABEL Memtest 86+
	COM32 #{infos[:syslinux_kernel]+target}

EOS
	end
end
#https://wiki.archlinux.org/index.php/systemd_boot
#systemd_boot will automatically check for "Windows Boot Manager" (\EFI\Microsoft\Boot\Bootmgfw.efi), "EFI Shell" (\shellx64.efi) and "EFI Default Loader" (\EFI\Boot\bootx64.efi)
def efi_shell(version: "v2", mode: "auto", **infos)
	return unless infos[:arch]
	arch=infos[:arch]; rarch=infos[:rarch]
	puts "! boot: EFI shell (#{arch}-#{version})"
	filename="shell_#{rarch}_#{version}.efi"
	file="boot/efi_shell/"+filename
	if mode=="auto"
		target="EFI/shell/shellx64.efi"
	else
		target="EFI/shell/"+filename
	end
	copy_file(file,infos[:esp]+target,perm: @bootfiles_perm)
	case mode
	when "systemd_boot"
		write_file(infos[:esp]+"loader/entries/80-uefi-shell-#{arch}-#{version}.conf",<<EOS,perm:@bootfiles_perm)
title UEFI Shell #{arch}#{version}
efi /#{target}
EOS
	end
end

def syslinux_menucolor(**infos)
# Refer to http://syslinux.zytor.com/wiki/index.php/Doc/menu
	return <<EOS
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
end
def syslinux_vesa_ui(**infos)
	copy_file("boot/syslinux/splash.png",infos[:syslinuxdir],perm: @bootfiles_perm)
	return <<EOS
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
end
def syslinux_ui(**infos)
	return <<EOS
PROMPT 0
TIMEOUT 50
UI menu.c32
MENU SHIFTKEY #show menu only if ALT is on
EOS
end
def syslinux_post(hdt_mod: false, **infos)
  #hdt: http://hdt-project.org/
  r=<<EOS
LABEL hdt
	MENU LABEL HDT (Hardware Detection Tool)
	COM32 hdt.c32
EOS
	if hdt_mod
		r+="	APPEND modules_alias=hdt/modalias.gz pciids=hdt/pciids.gz\n"
		copy_file("boot/syslinux/hdt",infos[:syslinuxdir],perm: @bootfiles_perm)
	end
	r+=<<EOS

LABEL reboot
	MENU LABEL Reboot
	COM32 reboot.c32

LABEL poweroff
	MENU LABEL Poweroff
	COM32 poweroff.c32

EOS
	return r
end

bootloaders.each do |bootloader|
	case bootloader
	when "systemd-boot", "gummiboot"
		systemdboot_entries(linux_entries,**infos)
		#if @computer.name=~/^Baggins/
		#	rarch="ia32"; arch = "i686"
		#	efi_shell(mode: "systemd_boot", **infos, arch: arch, rarch: rarch)
		#	efi_shell(version: "v1", mode: "systemd_boot", **infos, arch: arch, rarch: rarch)
		#	memtest(mode: "systemd_boot", **infos, arch: arch, rarch: rarch)
		#	rarch="x64"; arch = "x86_64"
		#	efi_shell(mode: "systemd_boot", **infos, arch: arch, rarch: rarch)
		#	efi_shell(version: "v1", mode: "systemd_boot", **infos, arch: arch, rarch: rarch)
		#	memtest(mode: "systemd_boot", **infos, arch: arch, rarch: rarch)
		#else
			efi_shell(mode: "auto", **infos)
			memtest(mode: "systemd_boot", **infos)
		#end
		write_file(infos[:esp]+"loader/loader.conf", <<EOS,perm:@bootfiles_perm)
timeout 1
default #{default_systemd_boot}
EOS

	when "syslinux"
		mkdir infos[:syslinuxdir]
		if @computer.name=~/^Baggins/
			content=syslinux_vesa_ui(**infos)
		else
			content=syslinux_ui(**infos)
		end
		content+=syslinux_menucolor(**infos)
		content+="DEFAULT #{default_syslinux}\n"
		if @computer[:syst][:lang]=="fr"
			content+="KBDMAP fr.ktl\n"
			copy_file("boot/syslinux/fr.ktl",infos[:syslinuxdir]+"fr.ktl",perm: @bootfiles_perm)
		end
		content+=syslinux_entries(linux_entries, **infos)
		content+=memtest(mode: "syslinux", **infos)
		hdt_mod=false
		if @computer.name=~/^Baggins/
			hdt_mod=true
			content+=<<EOS
LABEL existing
	TEXT HELP
	Boot an existing operating system.
	Press TAB to edit the disk and partition number to boot.
	ENDTEXT
	MENU LABEL Boot existing OS
	COM32 chain.c32
	APPEND hd0 0

EOS
		end
		content+=syslinux_post(hdt_mod:hdt_mod,**infos)
		write_file(infos[:syslinuxdir]+"syslinux.cfg",content,perm:@bootfiles_perm)

	when 'grub'
		content=<<EOS
GRUB_DEFAULT=0
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="Arch Linux"
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 console=tty1"
GRUB_CMDLINE_LINUX="#{linux_options}"

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
		write_file("etc/default/grub",content)
	end
end
