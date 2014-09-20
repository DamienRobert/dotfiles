case @computer[:syst][:bootloader]
when "gummiboot"
	write_file("boot/loader/entries/arch.conf",<<EOS)
title	Arch Linux
linux	/vmlinuz-linux
initrd	/initramfs-linux.img
options #{@computer[:syst][:linuxoptions]}
EOS
	write_file("boot/loader/entries/arch-fallback.conf",<<EOS)
title	Arch Linux (fallback)
linux	/vmlinuz-linux
initrd	/initramfs-linux-fallback.img
options #{@computer[:syst][:linuxoptions]}
EOS
	if @computer[:syst][:linuxinitoptions]
		write_file("boot/loader/entries/arch-init.conf",<<EOS)
title	Arch Linux (init)
linux	/linux-init/vmlinuz-linux
initrd	/linux-init/initramfs-linux.img
options #{@computer[:syst][:linuxinitoptions]}
EOS
		write_file("boot/loader/entries/arch-init-fallback.conf",<<EOS)
title	Arch Linux (init fallback)
linux	/linux-init/vmlinuz-linux
initrd	/linux-init/initramfs-linux-fallback.img
options #{@computer[:syst][:linuxinitoptions]}
EOS
	end
	write_file("boot/loader/loader.conf", <<EOS)
timeout 2
default arch
EOS

when "syslinux"
	content=<<EOS
DEFAULT arch
PROMPT 0
TIMEOUT 50
UI menu.c32
MENU SHIFTKEY #show menu only if ALT is on

MENU TITLE Arch Linux
MENU COLOR border       30;44   #40ffffff #a0000000 std
MENU COLOR title        1;36;44 #9033ccff #a0000000 std
MENU COLOR sel          7;37;40 #e0ffffff #20ffffff all
MENU COLOR unsel        37;44   #50ffffff #a0000000 std
MENU COLOR help         37;40   #c0ffffff #a0000000 std
MENU COLOR timeout_msg  37;40   #80ffffff #00000000 std
MENU COLOR timeout      1;37;40 #c0ffffff #00000000 std
MENU COLOR msg07        37;40   #90ffffff #a0000000 std
MENU COLOR tabmsg       31;40   #30ffffff #00000000 std

EOS
	content+="KBDMAP fr.ktl\n\n" if @computer[:syst][:lang]=="fr"
	content+=<<EOS
# boot sections follow
LABEL arch
    MENU LABEL Arch Linux
    LINUX ../vmlinuz-linux
    APPEND #{@computer[:syst][:linuxoptions]}
    INITRD ../initramfs-linux.img

LABEL arch-fallback
    MENU LABEL Arch Linux Fallback
    LINUX ../vmlinuz-linux
    APPEND #{@computer[:syst][:linuxoptions]}
    INITRD ../initramfs-linux-fallback.img

EOS

	content+=<<EOS if @computer[:syst][:linuxinitoptions]
LABEL arch-init
    MENU LABEL Arch Linux Init
    LINUX ../linux-init/vmlinuz-linux
    APPEND #{@computer[:syst][:linuxinitoptions]}
    INITRD ../linux-init/initramfs-linux.img

LABEL arch-init-fallback
    MENU LABEL Arch Linux Init Fallback
    LINUX ../linux-init/vmlinuz-linux
    APPEND #{@computer[:syst][:linuxinitoptions]}
    INITRD ../linux-init/initramfs-linux-fallback.img

EOS

	content+=<<EOS
LABEL hdt
        MENU LABEL HDT (Hardware Detection Tool)
        COM32 hdt.c32

LABEL reboot
        MENU LABEL Reboot
        COM32 reboot.c32

LABEL poweroff
        MENU LABEL Poweroff
        COM32 poweroff.c32
EOS
	write_file("boot/syslinux/syslinux.cfg",content)
	if @computer[:syst][:lang]=="fr"
		FileUtils.cp(@gendir+"files/0Abootloader/syslinux/fr.ktl",@out+"boot/syslinux/")
	end

end
