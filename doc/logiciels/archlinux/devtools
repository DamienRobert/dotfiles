vim: ft=markdownlight fdm=expr

Containers
==========

* Create a base install with pacstrap
sudo pacstrap -GMcd archtest base #base-devel

* Boot in it
sudo systemd-nspawn -b -D archtest

* Create an arch chroot with mkarchroot

mkarchroot /opt/archchroot/root base-devel
-> calls pacstrap
-> echo "$CHROOT_VERSION" > "$working_dir/.arch-chroot"
-> setup locale and calls arch-nspawn $working_dir locale_gen

This set up an arch container suitable to call with makechrootpkg and
arch-nspawn, but not necesseraly to install a new container

## Via packer

cf ~progs/packer-arch, using an arch iso

Archlinux+Ansible+Vagrant: http://elasticdog.com/2013/08/developing-ansible-playbooks-for-arch-linux-with-vagrant/

## Prebuilt Archlinux images

Archlinux images (for systemd-nspawn, kvm or bare metal):
http://www.politreco.com/2015/08/throw-away-linux-images-in-seconds/
-> https://github.com/lucasdemarchi/toolbox/blob/master/arch-installer.sh
Essentially do a standard install on a file block device via losetup:
    dd if=/dev/null of="$file" bs=1M seek=4096
    DEV=$(losetup --find --show "$file")

See also https://wiki.archlinux.org/index.php/Creating_Arch_Linux_disk_image#Install_Arch_Linux_in_a_disk_image_without_the_installation_media

## Creation via my script arch_img

See ~/script/archlinux/arch_img:
sudo ~/script/set_acls -u g:wheel -w /var/lib/machines
sudo ~/script/archlinux/arch_img -k ~syst/ssh/provision_id_rsa.pub arch-container
sudo ~/script/archlinux/arch_img -k ~syst/ssh/provision_id_rsa.pub -b -t raw arch-virtual

## Launch

sudo machinectl start arch-container
=> sudo systemd-nspawn -qbjnM arch-container
cf [../systemd/systemd-nspawn]

~/script/qemu-launch --efi -m arch-virtual.raw
sudo systemd-nspawn -bni /var/lib/machines/arch-virtual.raw

## Set up

Some infos: https://lists.freedesktop.org/archives/systemd-devel/2015-November/034890.html [systemd-devel] Pulseaudio & systemd-nspawn
http://unix.stackexchange.com/questions/304252/access-usb-device-from-systemd-nspawn-container
http://stackoverflow.com/questions/16296753/can-you-run-gui-apps-in-a-docker-container

* bind mount /tmp to get access to the x socket
sudo systemd-nspawn --bind=/tmp --bind=/dev/snd --bind=/run/user/1000/pulse -jM arch-container
useradd -m dams
usermod -a -G audio dams
su dams
  #on host:
  pacstrap -d /var/lib/machines/arch-container xeyes pulseaudo mesa-libgl
  xhost + #or copy .Xauthority to /tmp and use XAUTHORITY=/tmp/.Xauthority but I was not able to make that work
DISPLAY=:0 xeyes

* do we need /dev/snd when going through the pulse socket?
PULSE_SERVER=unix:/run/user/1000/pulse/native DISPLAY=:<Plug>yankstack_after_paste0 ./SakuraValentinesDay.sh 

arch-install-scripts
====================

- arch-chroot: wrapper around chroot that mounts /proc, /sys, efivars,
  /dev, /run, /tmp and so on, and also mount bind resolv.conf

- pacstrap: wrapper around pacman to install pkgs in a chroot
Ex: sudo pacstrap -GMcd archtest --needed base #base-devel
  Options:
    -C config      Use an alternate config file for pacman
    -c             Use the package cache on the host, rather than the target
    -d             Allow installation to a non-mountpoint directory
    -G             Avoid copying the host's pacman keyring to the target
    -i             Avoid auto-confirmation of package selections
    -M             Avoid copying the host's mirrorlist to the target
-> creates needed directories in $newroot via chroot_setup (like arch-chroot) and call `pacman -r $newroot -Sy $pacman_args`

ex: mkarchroot calls: pacstrap -GMcd ${pac_conf:+-C "$pac_conf"} "$working_dir" \ "${cache_dirs[@]/#/--cachedir=}" "$@"

pacstrap foo/ --needed base

devtools
========
sudo pacman -S devtools

https://projects.archlinux.org/devtools.git/
https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_Clean_Chroot

Note samples pacman.conf (with different repos activated) and makepkg.conf
are in /usr/share/devtools:
makepkg-x86_64.conf         pacman-kde-unstable.conf      pacman-multilib.conf
pacman-extra.conf           pacman-multilib-staging.conf  pacman-staging.conf
pacman-gnome-unstable.conf  pacman-multilib-testing.conf  pacman-testing.conf

- arch-nspawn: thin wrapper around systemd-nspawn, doing some
  pacman-specific stuff like copying pacman.d/gnupg, binding the cache and
  copying pacman and makepkg config from the host (+ the first host on the
  mirror list). So it is
  only usefull when related to pacman calls in the chroot (and it checks
  that .arch-chroot exists)

Used by:
- mkarchroot: builds the chroot using pacstrap (on btrfs constructs a subvolume)
  then use arch-nspawn for locale-gen
- makechrootpkg: like makepkg but in the chroot
- archbuild: build a package, use mkarchroot and makechrootpkg

=> check packages: finddeps, find-libdeps, checkpkg, lddd
- Feanor /var/abs $ finddeps openssh #packages depending on openssh
  ./extra/vinagre (makedepends)
  ./extra/vinagre (optdepends)
  ./extra/cvs (optdepends) ...
- Feanor ~/opt/arch/pkgs/dest $ find-libdeps openssh-6.5p1-1-x86_64.pkg.tar.xz
  libc.so=6-64
  libcrypto.so=1.0.0-64 ...
(Find library dependencies [or provides with find-libprovides] of a package)
- Feanor ~/opt/arch/pkgs/pkgbuild/openssh $ checkpkg openssh-6.5p1-1-x86_64.pkg.tar.xz
==> No soname differences for openssh.
(checks if the built package has a soname difference compared to the
current package in archlinux's mirror)
- lddd: look for ldd of binaries of PATH and report missing libraries

=> TU stuff (use nymeria.archlinux.org)
- commitpkg: commit PKGBUILD
- archco/archrm: wrappers for svn co, svn rm
- archrelease: release .tar.xz?
- rebuildpkgs ~/chroot readline bash foo bar baz (check if packages rebuild correctly)

Usage
-----
* Usage: arch-nspawn [options] working-dir [systemd-nspawn arguments]
  A wrapper around systemd-nspawn. Provides support for pacman.
   options:
      -C <file>     Location of a pacman config file
      -M <file>     Location of a makepkg config file
      -c <dir>      Set pacman cache
      -f <file>     Copy file from the host to the chroot
      -s            Do not run setarch
      -h            This message

Ex: arch-nspawn /opt/archchroot/root ls

On cache dirs: the first is bind mounted rw and the next ones are mounted
readonly, however with the command line we can only specify one...

Note: arch-nspawn overwrites gnupg, the mirrorlist, CacheDir
(by default these are taken from `pacman -v`)
+ pacman.conf, makepkg.conf if -C.../-M... are passed:
  copy_hostconf () {
  	cp -a /etc/pacman.d/gnupg "$working_dir/etc/pacman.d"
  	echo "Server = $host_mirror" >"$working_dir/etc/pacman.d/mirrorlist"
  	[[ -n $pac_conf ]] && cp "$pac_conf" "$working_dir/etc/pacman.conf"
  	[[ -n $makepkg_conf ]] && cp "$makepkg_conf" "$working_dir/etc/makepkg.conf"
  	local file
  	for file in "${files[@]}"; do
  		mkdir -p "$(dirname "$working_dir$file")"
  		cp -T "$file" "$working_dir$file"
  	done
  	sed -r "s|^#?\\s*CacheDir.+|CacheDir = ${cache_dirs[*]}|g" -i "$working_dir/etc/pacman.conf"
  }
Solution: pass an expanded pacman.conf (via pacman-conf/pacconf), so that
the mirrorlist is not used; eventually change GPGDir)


* Usage: mkarchroot [options] working-dir [package-list | app]
 options:
    -C <file>     Location of a pacman config file
    -M <file>     Location of a makepkg config file
    -c <dir>      Set pacman cache
    -f <file>     Copy file from the host to the chroot
    -s            Do not run setarch

Ex: mkarchroot /opt/archchroot/root base-devel
   (makes a btrfs subvolume on btfs)

=> pacstrap -GMcd ${pac_conf:+-C "$pac_conf"} "$working_dir" \
  "${cache_dirs[@]/#/--cachedir=}" "$@"
  + setup machine-id and launch locale-gen
  + echo "$CHROOT_VERSION" > "$working_dir/.arch-chroot"

* Usage: makechrootpkg [options] -r <chrootdir> [--] [makepkg args]
   Run this script in a PKGBUILD dir to build a package inside a
   clean chroot. Arguments passed to this script after the
   end-of-options marker (--) will be passed to makepkg.

   The chroot dir consists of the following directories:
   <chrootdir>/{root, $copy} but only "root" is required
   by default. The working $copy will be created as needed
   (by default $copy=$USER)

  The chroot "root" directory must be created via the following
  command:
      mkarchroot <chrootdir>/root base-devel
  (on btrfs snapshot the /root dir into /$copy)

  Default makepkg args: --syncdeps --noconfirm --log --holdver --skipinteg
  (       -s, --syncdeps:
           Install missing dependencies using pacman. When build-time or
           run-time dependencies are not found, pacman will try to resolve
           them. If successful, the missing packages will be downloaded and
           installed.
           -L/--log: log
           --holdver: When using VCS sources (PKGBUILD(5)) any currently checked out source will not be updated to the latest revision.
  )

  Flags:
  -h         This help
  -c         Clean the chroot before building #(ie delete $copy/)
  -d <dir>   Bind directory into build chroot as read-write
  -D <dir>   Bind directory into build chroot as read-only
  -u         Update the working $copy of the chroot before building
             This is useful for rebuilds without dirtying the pristine chroot
  -r <dir>   The chroot dir to use
  -I <pkg>   Install a package into the working $copy of the chroot
  -l <$copy>  The directory to use as the working $copy of the chroot
             Useful for maintaining multiple copies
             Default: dams
  -n         Run namcap on the package
  -T         Build in a temporary directory
  -U         Run makepkg as a specified user

Ex: arch-nspawn $CHROOT/root pacman -Syu
    /var/abs/core/openssh $ makechrootpkg -c -r $CHROOT
    (-> mount bind $CHROOT/root into $CHROOT/dams and build the package in
    $CHROOT/dams)

* Usage: archbuild [options] -- [makechrootpkg args]
      -c         Recreate the chroot before building #(including root/)
      -r <dir>   Create chroots in this directory
  Default makechrootpkg args: -c -n

(Needs to use a symlink like /usr/bin/testing-x86_64-build -> archbuild
 otherwise we get setarch: archbuild: Unrecognized architecture)

Ex: /var/abs/core/openssh $ sudo testing-x86_64-build -r /opt/archbuildchroot
-> ls /opt/archbuildchroot/testing-x86_64: dams/  dams.lock  root/  root.lock

(without -c, will still call pacman -Syu in the chroot root:

if ${clean_first} || [[ ! -d "${chroots}/${repo}-${arch}" ]]; then
	... #delete the chroot
	setarch "${arch}" mkarchroot \
		-C "/usr/share/devtools/pacman-${repo}.conf" \
		-M "/usr/share/devtools/makepkg-${arch}.conf" \
	      "${chroots}/${repo}-${arch}/root" \
		"${base_packages[@]}" || abort
else
	arch-nspawn \
		-C "/usr/share/devtools/pacman-${repo}.conf" \
		-M "/usr/share/devtools/makepkg-${arch}.conf" \
		"${chroots}/${repo}-${arch}/root"  pacman -Syu --noconfirm
)

* Usage: repo-add [options] <path-to-db> <package|delta> ...

  repo-add will update a package database by reading a package file.
  Multiple packages to add can be specified on the command line.
  
  Options:
    -d, --delta       generate and add delta for package update
    -n, --new         only add packages that are not already in the database
    -R, --remove      remove old package file from disk after updating database
    --nocolor         turn off color in output
    -q, --quiet       minimize output
    -s, --sign        sign database with GnuPG after update
    -k, --key <key>   use the specified key to sign the database
    -v, --verify      verify database's signature before update

  If an older version exists, it is removed from the db (with -R the
  package is removed too)

Some bugs:
- pacstrap: cannot not run -Sy
  [but can use -i to remove --noconfirm]
- https://github.com/AladW/aurutils/issues/20
  In particular  arch-nspawn replaces CacheDir unconditionally patch
  (so that mkarchroot can handle multiple cache)
  https://github.com/eli-schwartz/devtools/commit/2bfe582bee3c4d17314e46bb15c03f75cc269dc8.patch
  Currently: the -c option of arch-nspawn and mkarchroot can only accept
  one directory. If no cache dir is specified on the command line,
  arch-nspawn and mkarchroot will use all thoses which are defined in
  pacman.conf.
  Work around: make a custom pacman.conf with all the cache we want.
- makechrootpkg has default_makepkg_arg: default_makepkg_args=(--syncdeps --noconfirm --log --holdver --skipinteg)
  makepkg does not accept all pacman options.
  There are some work-around for this:
  Cf https://github.com/AladW/aurutils/issues/447

  @AladW: there is a trick to make makepkg pass options to pacman other than the ones supported natively (like --noconfirm, --noprogress). Indeed, makepkg FOO=foo will set 'FOO' to 'foo' (see extra_environment), so you can pass use makepkg PACMAN_OPTS=--confirm for instance. And since makechrootpkg pass its extra arguments to makepkg, you could do makechrootpkg -- 'PACMAN_OPTS=--confirm' (or --ask=4 or whatever) to override the --noconfirm default of makechrootpkg.

  Two drawbacks: extra_environment does not support arrays, so you cannot use makepkg PACMAN_OPTS+=(foo bar) to append pacman options, and so you can only set one pacman option. You could also use this feature to overwrite the internal variables of makepkg (to override the defaults of makechrootpkg), but these variables will then be exported [makepkg does export $extra_environment], which is annoying.

archiso
=======

mkarchiso: helpers to create a bootable cd
cf aussi: archboot (arch bootloader with a CLI)

Building the iso
----------------

sudo /usr/share/archiso/configs/releng/build.sh -v

(Rem: this generate an hybrid iso, meaning it works both on a cdrom and an
usb stick
https://plus.google.com/105696767572828808697/posts/iwT51iMjayQ
)

Installing the iso on an usb stick
----------------------------------

https://wiki.archlinux.org/index.php/USB_flash_installation_media#Preparing_the_USB_flash_drive

- Using dd:

dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx && sync

- Using manual formatting:

mkdir -p /mnt/{iso,usb}
mount -o loop archlinux-2014.09.03-dual.iso /mnt/iso
mount /dev/sdXn /mnt/usb
cp -a /mnt/iso/* /mnt/usb
sync
umount /mnt/iso

  * To boot either a label or an UUID to select the partition to boot from is required. By default the label ARCH_2014XX (with the appropriate release month) is used. Thus, the partition’s label has to be set accordingly, for example using gparted. Alternatively, you can change this behaviour by altering the lines ending by archisolabel=ARCH_2014XX in files /mnt/usb/arch/boot/syslinux/archiso_sys32.cfg and archiso_sys64.cfg, as well as /mnt/usb/loader/entries/archiso-x86_64.conf or similar for a 32-bit ISO (the last being useful only, if you want to boot the USB flash device from an EFI system). To use an UUID instead, replace those portions of lines with archisodevice=/dev/disk/by-uuid/YOUR-UUID. The UUID can be retrieved with blkid -o value -s UUID /dev/sdXn.
Warning: Mismatching labels or wrong UUID prevents booting from the created medium.

  * Syslinux is already preinstalled in /mnt/usb/arch/boot/syslinux. Install it completely to that folder by following Syslinux#Manual_install. Instructions are reproduced here for convenience:
    - Overwrite the existing syslinux modules (*.c32 files) present in the USB (from the ISO) with the ones from the syslinux package. This is necessary to avoid boot failure because of a possible version mismatch.
    - extlinux --install /mnt/usb/arch/boot/syslinux
    - Unmount the partition (umount /mnt/usb) and install the MBR or GPT partition table to the USB device as described in the page mentioned.
    - Mark the partition as active (or “bootable”).

=> All Steps:
DEV="/dev/sdd"
SUBDEV="$DEV1"
sudo mkfs.vfat -F32 $SUBDEV -n ARCH_201307
sudo mount $SUBDEV /mnt/tmp
sudo mount ~/large/Isos/archlinux-2013.07.01-dual.iso /mnt/loop
sudo cp -a /mnt/loop* /mnt/iso/
cd /mnt/tmp/arch/boot/syslinux
sudo extlinux --install .
sudo umount /mnt/tmp
sudo dd bs=440 conv=notrunc count=1 if=/usr/lib/syslinux/mbr.bin of=$DEV

Clé agreg
---------

Exemple pour installer l'iso clé agreg sur une clé usb:
http://clefagreg.dnsalias.org/9.0/creer_cleISN_linux.html
- # mount -o loop -t iso9660 ClefISN.iso /mnt/iso/ .
- # fdisk -l
  Affiche tous les périphériques. Supposons pour la suite que /dev/sdb corresponde à la clé.
  Formater:
  # mkdiskimage /dev/sdb 0 255 63
  # mkfs.vfat /dev/sdb1 .
  # mount -t vfat /dev/sdb1 /mnt/cle
- Copier
  # cp -r /mnt/iso/{*,.*} /mnt/cle
  Remarquer le fichier /mnt/cle/vesamenu.c32 situé sur la clé. Ce fichier doit être remplacé par le fichier vesamenu.c32 fourni par syslinux.
  # cp /usr/lib/syslinux/vesamenu.c32 /mnt/cle
  Il peut être nécessaire de rajouter de même les autres *.c32
- Rendre la clé démarrable :
  - Installer le bootloader SYSLINUX sur la première partition de la clé :
    # syslinux -i /dev/sdb1
  - Recopier le fichier mbr.bin fourni par syslinux sur le secteur d'amorçage de la clé.
    # dd conv=notrunc bs=440 count=1 if=/usr/lib/syslinux/mbr.bin of=/dev/sdb
  - Ensuite marquer la première partition comme active (démarrable) :
    # parted /dev/sdb set 1 boot on
    (utiliser la commande #fdisk /dev/sdb est égalemant possible.)
