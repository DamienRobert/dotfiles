vim: ft=markdownlight fdm=expr

Some common tasks done in archlinux
https://wiki.archlinux.org/index.php/List_of_Applications

Users
=====
cf aussi ~syst/new/scripts/24users

Utilisation des groupes: https://wiki.archlinux.org/index.php/Users_and_groups

* rajouter des groupes: (en pratique il vaut mieux laisser logind faire)
  - $ sudo usermod -a -G network,power dams #-a: append
  - avec systemd je n'ai besoin d'être dans aucun groupe
    à part sshc (cf sshd), et anciennement network and power (cf polkit,
    mais /etc/polkit-1/rules.d/50-default.rules ajoute le groupe 'wheel'
    dans les administrateurs, donc en étant dans 'wheel' j'ai déjà toutes
    les autorisations polkit. Le journal est aussi lisible par 'wheel' et
    'adm', pas besoin de se rajouter à 'systemd-journal'.
    Note that by default, for cups access, we need to be in the 'sys'
    group, but I change cups-files.conf to add 'wheel')
    $ sudo usermod -G wheel,sshc dams
  - pour raspberry: $ sudo usermod -a -G audio dams
  - alternativement: gpasswd -a user group
  -> 'newgrp' pour rafraichir les groupes

* dina
  sudo useradd -m -g users -s /bin/bash dina
  sudo passwd dina
  ~maint/user/misc/acls

* git user for repository sharing
  sudo useradd -m -g nobody -G sshc -s /bin/bash repos
  sudo mkdir ~repos/.ssh
  sudo cp ~/.ssh/authorized_keys ~repos/.ssh/

mkinitcpio
==========

mkinitcpio -p linux; mkinitcpio -P [run all presets]
mkinitcpio --config CONFIG -g /boot/initramfs-linux.img
  [--kernel kernelversion] [--addhooks HOOKS]

Structure
---------

- Config: /etc/mkinitcpio.conf

- /etc/mkinitcpio.d: preset files
  # Example mkinitcpio preset file (/usr/share/mkinitcpio/example.preset)
  
  # preset names
  PRESETS=('default' 'fallback')
  
  # ALL_kver is used if presetname_kver is not set
  # The kver can be specified as an explicit kernel version or
  # as the path to an kernel image.
  ALL_kver='/boot/vmlinuz-linux'
  ALL_config='/etc/mkinitcpio.conf'
  
  # presetname_kver    - the kernel version (omit if ALL_kver should be used)
  # presetname_config  - the configuration file (omit if ALL_config should be used)
  # presetname_image   - the filename of generated image
  # presetname_options - any extra options
  
  #default_kver="3.0-ARCH"
  #default_config="/etc/mkinitcpio.conf"
  default_image="/tmp/initramfs-linux.img"
  default_options=""
  
  #fallback_kver="3.0-ARCH"
  #fallback_config="/etc/mkinitcpio.conf"
  fallback_image="/tmp/initramfs-linux-fallback.img"
  fallback_options="-S autodetect"

- initcpio dir: /etc/initcpio; /usr/lib/initcpio/
install/: files,modules,hooks to install for a given hook
(should be in the build() function, there is also the help() function)

- hook/: functions run during initcpio boot (ex the hook/consolefont hook is run
  when install/consolefont is used since the build() contains 'add_runscript')
(functions can be run_early_hook(), run_hook(), run_latehook(), run_cleanuphook())

mkinitcpio hooks
----------------

See https://wiki.archlinux.org/index.php/Mkinitcpio
When using systemd there is no emergency shell, cf
https://bugs.archlinux.org/task/36265
https://bugs.archlinux.org/task/45480

Mounting root
-------------

/usr/lib/initcpio/init_functions:
  mount ${fstype:+-t $fstype} -o ${rwopt:-ro}${rootflags:+,$rootflags} "$root" "$1";
rwopt is 'ro' by default, and 'rw' if rw is passed to the command line
$1 is /newroot

Extract
-------

https://wiki.archlinux.org/index.php/Mkinitcpio#Extracting_the_image
lsinitcpio /boot/initramfs-linux.img #list
lsinitcpio -x /boot/initramfs-linux.img #extract

Divers
======

* battery:
Mithrim /sys/class/power_supply/BAT0 $ ls
alarm               current_now   present        uevent
capacity            cycle_count   serial_number  voltage_min_design
capacity_level      device@       status         voltage_now
charge_full         manufacturer  subsystem@
charge_full_design  model_name    technology
charge_now          power/        type

* ntfs
sudo mount -t ntfs-3g /dev/sda4 /mnt/windows -o uid=1000,fmask=0113,gid=100,users

* convert to ext4
tune2fs -O extents,uninit_bg,dir_index /dev/the_partition
fsck -fDp /dev/the_partition
* add extents
find /home -xdev -type f -print0 | xargs -0 chattr +e
find /home -xdev -type d -print0 | xargs -0 chattr +e

* microcode
https://wiki.archlinux.org/index.php/Microcode#Enabling_Intel_Microcode_Updates

Vulnerabilities:
/sys/devices/system/cpu/vulnerabilities/*

* updatedb
Since /etc/updatedb.conf contains 'autofs' from the prune fs list, the
mounts marked as systemd.automount will not be searched

Redirections
============

Port 40000-41999: ports that are forwarded from another machine (connecting to these ports forwards from the corresponding port -40000 on the other machine; 40000 is used for a socks proxy)
Port 42000-43999: ports that are forwarded to another machine (connecting to these ports forwards to the corresponding port -42000 to the other machine)
Port 44000-44499: forwards to several ssh clients
Port 445??: ssh for containers
Port 446??: ssh for virtual machines

Packages Update
===============

- mkinitcpio -p linux is run when linux is installed and updated
  [but installing mkinitcpio.conf before hand does not work: since mkinitcpio is not yet installed, installing it move the original mkinitcpio.conf to mkinitcpio.conf.orig]
- locale-gen is run when glibc is updated
