#fstab vim: ft=markdownlight

Ex:
# <file system> <dir> <type> <options> <dump> <pass>
UID=D906-BEB0 /boot vfat rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro,noauto,x-systemd.automount   0 2
UUID=382E89A02E895830 /mnt/windows  ntfs ro,user,nls=utf8,umask=00,noauto,x-systemd.automount

To set up automount, add the noauto,x-systemd.automount parameters (in
systemd auto-gpt setup the automount is added automatically with a timeout
of 2 minutes for /boot, ie as if we had a
x-systemd.automount,x-systemd.idle-timeout=120)

The last field is for fsck
http://askubuntu.com/questions/9939/what-does-the-last-two-fields-in-fstab-mean
    The sixth field, (fs_passno), is used by the fsck(8) program to
    determine the order in which filesystem checks are done at reboot time.
    The root filesystem should be specified with a fs_passno of 1, and
    other filesystems should have a fs_passno of 2. Filesystems within a
    drive will be checked sequentially, but filesystems on different drives
    will be checked at the same time to utilize parallelism available in
    the hardware. If the sixth field is not present or zero, a value of
    zero is returned and fsck will assume that the filesystem does not need
    to be checked.
Dump is essentially unused. Omitting the values mean '0'

atime
-----

relatime, lazytime: https://lwn.net/Articles/621046/

Systemd
-------
See also systemd/boot

systemd-fstab-generator generates units in /run/systemd/generator
while systemd systemd-gpt-auto-generator generates units in /run/systemd/generator.late. So the fstab options takes precedence.

defaults
--------

http://unix.stackexchange.com/questions/191405/do-you-need-to-specify-the-defaults-option-in-fstab
From what I understand the defaults option is included by default(!) so it
is not needed. The only reason to add it in fstab is if we want to specify
dump and pass

Usual options
-------------

genfstab generates the fstab by looking at the current options.
The defaults options are
- vfat: rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro
- ntfs [old ntfs]: ro,nls=utf8,umask=00
- ntfs-3g: rw,nosuid,nodev,relatime,user_id=0,group_id=0,allow_other,blksize=4096

ntfs: For ntfs-3g see https://wiki.archlinux.org/index.php/NTFS-3G
-> gid=users,dmask=022,fmask=133

boot: when auto-gpt is active, it behaves as if we had
'x-systemd.automount,x-systemd.idle-timeount=120'. But it is only active
when we boot from uefi and from the current disk (ie not from an usb
stick/cd recovery). I also want to add the 'defaults' option, so I get the
following:
-> UUID=...  /boot vfat defaults,noauto,x-systemd.automount,x-systemd.idle-timeount=120 0 2

Options
-------
umask=value
       Set  the  umask  (the  bitmask  of  the permissions that are not
       present).  The default is the umask of the current process.  The
       value is given in octal.
dmask=value
       Set  the  umask applied to directories only.  The default is the
       umask of the current process.  The value is given in octal.
fmask=value
       Set the umask applied to regular files only.  The default is the
       umask of the current process.  The value is given in octal.
user   Allow an ordinary user to mount the filesystem.  The name of the
       mounting user is written to the mtab file  (or  to  the  private
       libmount  file  in /run/mount on systems without a regular mtab)
       so that this same user can unmount the filesystem  again.   This
       option  implies  the  options  noexec, nosuid, and nodev (unless
       overridden  by  subsequent  options,  as  in  the  option   line
       user,exec,dev,suid).
nouser Forbid  an  ordinary  user to mount the filesystem.  This is the
       default; it does not imply any other options.
users  Allow any user to mount and to unmount the filesystem, even when
       some  other  ordinary  user mounted it.  This option implies the
       options noexec, nosuid, and nodev (unless overridden  by  subse‐
       quent options, as in the option line users,exec,dev,suid).
defaults
       Use  the default options: rw, suid, dev, exec, auto, nouser, and
       async.
       Note that the real set of all default mount options  depends  on
       kernel  and  filesystem type.  See the beginning of this section
       for more details.
->
FILESYSTEM-INDEPENDENT MOUNT OPTIONS
       Some of  these  options  are  only  useful  when  they  appear  in  the
       /etc/fstab file.
       Some  of  these  options could be enabled or disabled by default in the
       system kernel.  To  check  the  current  setting  see  the  options  in
       /proc/mounts.   Note that filesystems also have per-filesystem specific
       default mount options (see for  example  tune2fs  -l  output  for  extN
       filesystems).
       The  following  options  apply  to any filesystem that is being mounted
       (but not every filesystem actually honors them – e.g., the sync  option
       today has an effect only for ext2, ext3, fat, vfat and ufs):
