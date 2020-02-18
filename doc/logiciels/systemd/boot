vim: ft=markdownlight fdm=expr

man kernal-command-line, bootparam
man bootup [man boot for legacy sysinitV]

Kernel command line
===================

systemd.unit=emergency-net.target

Shortcuts:
/src/core/main.c:
static int parse_proc_cmdline_item(const char *key, const char *value) {
  static const char * const rlmap[] = {
         "emergency", SPECIAL_EMERGENCY_TARGET, #systemctl emergency
         "-b",        SPECIAL_EMERGENCY_TARGET,
         "rescue",    SPECIAL_RESCUE_TARGET, #systemctl rescue
         "single",    SPECIAL_RESCUE_TARGET,
         "-s",        SPECIAL_RESCUE_TARGET,
         "s",         SPECIAL_RESCUE_TARGET,
         "S",         SPECIAL_RESCUE_TARGET,
         "1",         SPECIAL_RESCUE_TARGET,
         "2",         SPECIAL_RUNLEVEL2_TARGET,
         "3",         SPECIAL_RUNLEVEL3_TARGET,
         "4",         SPECIAL_RUNLEVEL4_TARGET,
         "5",         SPECIAL_RUNLEVEL5_TARGET,
  }

Initrd
======
cf man bootup for a nice graph

initrd.target -> initrd-root-fs.target, initrd-parse-etc, initrd-fs.target
initrd-switch-root <- initrd-switch-root.target -> initrd-udevadm-cleanup-db
                                                   initrd-root-fs.target 
                                                   initrd-fs.target 
                                                   systemd-journald
- initrd-parse-etc:
  ExecStartPre=/usr/bin/systemctl daemon-reload
  # we have to retrigger initrd-fs.target after daemon-reload
  ExecStart=-/usr/bin/systemctl --no-block start initrd-fs.target
  ExecStart=/usr/bin/systemctl --no-block start initrd-cleanup.service
- initrd-cleanup: ExecStart=/usr/bin/systemctl --no-block isolate initrd-switch-root.target
- initrd-udevadm-cleanup-db: ExecStart=-/usr/bin/udevadm info --cleanup-db
- initrd-switch-root: ExecStart=/usr/bin/systemctl --no-block --force switch-root /sysroot

       initrd-fs.target
           systemd-fstab-generator(3) automatically adds dependencies of type
           Before= to sysroot-usr.mount and all mount points found in
           /etc/fstab that have x-initrd.mount and not have noauto mount
           options set.
       #meaning when the target is active, the initrd fs have been mounted
       initrd-root-fs.target
           systemd-fstab-generator(3) automatically adds dependencies of type
           Before= to the sysroot.mount unit, which is generated from the
           kernel command line.


Generators
==========

Getting rid of /etc/fstab:
- http://www.freedesktop.org/software/systemd/man/systemd-gpt-auto-generator.html
  #autodiscover gpt partitions to mount (now also include efi auto-generator)

File hierarachy:
http://www.freedesktop.org/software/systemd/man/file-hierarchy.html

fsck
====

There are two players involved:
1) mkinitcpio offers you the option to fsck your root device before mounting it via the fsck hook. If you do this, you should mount root read-write via the appropriate rw option on the kernel commandline.
2)systemd will fsck all filesystems assuming three things are true: the filesystem has a fsck pass number greater than 0 (either from /etc/fstab or a user-supplied unit file), the filesystem is not already mounted read-write, and you've not elected to disable fsck entirely via the kernel commandline option fsck.mode=skip.
Note: Option 1 is the recommended default, and what you will end up with if
you follow the Installation Guide. If you want to go with option 2 instead,
you should remove the fsck hook from mkinitcpio.conf and use ro on the
kernel commandline. The kernel parameter fsck.mode=skip can be used to make
sure fsck is disabled entirely for both options.

http://www.freedesktop.org/software/systemd/man/systemd-remount-fs.service.html
Remount / to apply the options in the fstab

systemd-boot
============
http://www.freedesktop.org/wiki/Specifications/BootLoaderSpec/

From kernel-install add 4.1.5-1-ARCH /boot/vmlinuz-linux:
/boot/loader/entries/609f1fc725e24d45b25c148751313b07-4.1.5-1-ARCH.conf
title      Arch Linux
version    4.1.5-1-ARCH
machine-id 609f1fc725e24d45b25c148751313b07
options    root=PARTUUID="986178da-85b0-4a7c-a0ec-600adfa32be7" libahci.ignore_sss=1
linux      /609f1fc725e24d45b25c148751313b07/4.1.5-1-ARCH/linux
initrd     /609f1fc725e24d45b25c148751313b07/4.1.5-1-ARCH/initrd

Partition spec
==============

44479540-f297-41b2-9af7-d131d5f0458a 	Root Partition (x86) [8303]
4f68bce3-e8cd-4db1-96e7-fbcaf984b709 	Root Partition (x86-64) [8304]
69dad710-2ce4-4e3c-b16c-21a1d49abed3 	Root Partition (32bit ARM)
b921b045-1df0-41c3-af44-4c6f280d3fae 	Root Partition (64bit ARM) [8305]
933ac7e1-2eb4-4f13-b844-0e14e2aef915 	Home Partition [8302, /home]
3b8f8425-20e0-4f3b-907f-1a25a76f98e8 	Server Data Partition [/srv]
0657fd6d-a4ab-43c4-84e5-0933c84b4f4f 	Swap 	Swap [8200]
c12a7328-f81f-11d2-ba4b-00a0c93ec93b 	EFI System Partition 	VFAT [ef00, /boot]
bc13c2ff-59e6-4262-a352-b275fd6f7172 	Extended Boot Partition
0fc63daf-8483-4772-8e79-3d69d8477de4 	Other Data Partitions
cf [../partitions] for more infos.

Boot
====

Hardcoded in the .target files
------------------------------

graphical.target => display-manager.service + multi-user.target
multi-user.target => basic.target => sockets.target timers.target paths.target slices.target sysinit.target
rescue.target => sysinit.target
sysinit.target => local-fs.target swap.target

~systemdlib $ ls *.wants
------------------------

local-fs.target.wants:
systemd-remount-fs.service@  tmp.mount@

machines.target.wants:
var-lib-machines.mount@

multi-user.target.wants:
dbus.service@  man-db.timer@                    systemd-logind.service@         updatedb.timer@
getty.target@  systemd-ask-password-wall.path@  systemd-user-sessions.service@

remote-fs.target.wants:
var-lib-machines.mount@

shutdown.target.wants:
mkinitcpio-generate-shutdown-ramfs.service@

sockets.target.wants:
dbus.socket@      systemd-coredump.socket@  systemd-journald-audit.socket@    systemd-journald.socket@       systemd-udevd-kernel.socket@
dm-event.socket@  systemd-initctl.socket@   systemd-journald-dev-log.socket@  systemd-udevd-control.socket@

sound.target.wants:
alsa-restore.service@  alsa-state.service@

sysinit.target.wants:
cryptsetup.target@          proc-sys-fs-binfmt_misc.automount@  systemd-journal-catalog-update.service@  systemd-tmpfiles-setup-dev.service@
dev-hugepages.mount@        sys-fs-fuse-connections.mount@      systemd-journal-flush.service@           systemd-tmpfiles-setup.service@
dev-mqueue.mount@           sys-kernel-config.mount@            systemd-journald.service@                systemd-udev-trigger.service@
kmod-static-nodes.service@  sys-kernel-debug.mount@             systemd-machine-id-commit.service@       systemd-udevd.service@
ldconfig.service@           systemd-ask-password-console.path@  systemd-modules-load.service@            systemd-update-done.service@
lvm2-lvmetad.socket@        systemd-binfmt.service@             systemd-random-seed.service@             systemd-update-utmp.service@
lvm2-lvmpolld.socket@       systemd-firstboot.service@          systemd-sysctl.service@
lvm2-monitor.service@       systemd-hwdb-update.service@        systemd-sysusers.service@

timers.target.wants:
logrotate.timer@  shadow.timer@  systemd-tmpfiles-clean.timer@

my system services
------------------

getty.target.wants
│   └── getty@tty1.service -> /usr/lib/systemd/system/getty@.service

├── multi-user.target.wants
│   ├── machines.target -> /usr/lib/systemd/system/machines.target
│   ├── remote-cryptsetup.target -> /usr/lib/systemd/system/remote-cryptsetup.target
│   ├── remote-fs.target -> /usr/lib/systemd/system/remote-fs.target
│   ├── systemd-networkd.service -> /usr/lib/systemd/system/systemd-networkd.service
│   ├── systemd-resolved.service -> /usr/lib/systemd/system/systemd-resolved.service
│   ├── unbound.service -> /usr/lib/systemd/system/unbound.service
│   ├── wpa_supplicant@wlp2s0.service -> /usr/lib/systemd/system/wpa_supplicant@.service
│   └── zerotier-one.service -> /usr/lib/systemd/system/zerotier-one.service

├── sockets.target.wants
│   ├── avahi-daemon.socket -> /usr/lib/systemd/system/avahi-daemon.socket
│   ├── org.cups.cupsd.socket -> /usr/lib/systemd/system/org.cups.cupsd.socket
│   ├── sshd.socket -> /etc/systemd/system/sshd.socket
│   └── systemd-networkd.socket -> /usr/lib/systemd/system/systemd-networkd.socket

sysinit.target.wants
│   └── systemd-timesyncd.service -> /usr/lib/systemd/system/systemd-timesyncd.service

dbus
----

* /usr/share/dbus-1/system-services => SystemdService=
[!] running, but because they are launched by default
[x] typically launched via dbus in my session
[etc] the symlink from the dbus service name to the real service file is in etc/

[x] org.freedesktop.RealtimeKit1.service => rtkit-daemon.service
[x] org.freedesktop.Accounts.service => accounts-daemon.service
[x] org.freedesktop.UDisks2.service => udisks2.service
[x] org.freedesktop.UPower.service => upower.service
[x] org.freedesktop.PolicyKit1.service => polkit.service
org.freedesktop.ColorManager.service => colord.service
org.freedesktop.Avahi.service => dbus-org.freedesktop.Avahi.service
[x] org.freedesktop.GeoClue2.service => geoclue.service
org.freedesktop.fwupd.service => fwupd.service
org.freedesktop.ModemManager1.service => dbus-org.freedesktop.ModemManager1.service
fi.w1.wpa_supplicant1.service => wpa_supplicant.service
org.bluez.mesh.service => dbus-org.bluez.mesh.service
org.bluez.service => dbus-org.bluez.service
org.freedesktop.nm_dispatcher.service => dbus-org.freedesktop.nm-dispatcher.service

org.freedesktop.hostname1.service => dbus-org.freedesktop.hostname1.service -> systemd-hostnamed.service [hostnamectl]
org.freedesktop.import1.service => dbus-org.freedesktop.import1.service -> systemd-importd.service [companion for machinectl]
org.freedesktop.locale1.service => dbus-org.freedesktop.locale1.service -> systemd-localed.service [localectl]
org.freedesktop.machine1.service => dbus-org.freedesktop.machine1.service -> systemd-machined.service [machinectl]
[!] org.freedesktop.login1.service => dbus-org.freedesktop.login1.service -> systemd.logind.service [loginctl]
[!] org.freedesktop.network1.service => dbus-org.freedesktop.network1.service -> [etc] systemd-networkd.service [networkctl]
org.freedesktop.portable1.service => dbus-org.freedesktop.portable1.service -> systemd-portabled.service [portablectl]
[!] org.freedesktop.resolve1.service => dbus-org.freedesktop.resolve1.service -> [etc] systemd-resolved.service [resolvectl]
org.freedesktop.timedate1.service => dbus-org.freedesktop.timedate1.service -> systemd-timedated.service [timedatectl]
[!] org.freedesktop.timesync1.service => dbus-org.freedesktop.timesync1.service -> [etc] systemd-timesyncd.service

system-preset
-------------

* 90-systemd.preset
enable remote-fs.target
enable remote-cryptsetup.target
enable machines.target

enable getty@.service
enable systemd-timesyncd.service
enable systemd-networkd.service
enable systemd-resolved.service

* 99-default.preset
disable *
