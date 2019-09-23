vim: ft=markdownlight fdm=expr

Hidden menus
============
- *#*#46360000#*#* (shortcut: *#*#4636#*#*)
- *#06# IMEI
- https://www.xda-developers.com/codes-hidden-android/

Applis
======
- vlc

FDroid:
- f-droid: https://f-droid.org/en/
  Fdroid apk: https://f-droid.org/FDroid.apk
- Termux: https://termux.com
  [distrib linux sur android sans besoin de rooter le tél, installer depuis
  fdroid pour avoir les plugins gratuits)
[- Music Folder Player free (music player using the folder layout)
   vlc can do it]
- Amaze File Manager (fdroid/google play)
- Adaway (fdroid) [needs root]
- OsmAnd~ (fdroid) [OsmAnd in googleplay has some limitations:
  https://wiki.openstreetmap.org/wiki/OsmAnd#Free_version]
  MapsMe
- https://f-droid.org/en/packages/org.schabi.newpipe/
  newpipe, lightweight youtube frontend

Themes:
- substratum: theme engine
- xposed: framework for modules that can change the behavior of the system
  and apps without touching any APKs

Camera:
- https://www.celsoazevedo.com/files/android/google-camera/
- https://play.google.com/store/apps/details?id=net.sourceforge.opencamera&hl=en

Divers:
- pixel wallpapers: https://forum.xda-developers.com/android/apps-games/port-live-earth-wallpapers-t3481640/post74142755#post74142755
- https://pi-hole.net/ (opensource dns based add blocker)

Overlays
========

- https://code.tutsplus.com/tutorials/quick-tip-theme-android-with-the-runtime-resource-overlay-framework--cms-29708
  [Essentially /vendor/overlay is used as a unionfs]
  Eg: https://forum.xda-developers.com/project-treble/trebleenabled-device-development/overlay-enable-night-light-adaptive-t3741965
  => [Overlay] Enable Night Light, Auto-Brightness, Ambient Display & more on Treble ROM

Roms / Root
===========

- https://twrp.me/
- https://lineageos.org/
- http://opengapps.org/
- magisk: https://forum.xda-developers.com/apps/magisk
  https://forum.xda-developers.com/apps/magisk/official-magisk-v7-universal-systemless-t3473445 

MTP
===

- gvfs-mtp: mtp support for mtpfs
- mtpfs: fuse filesystem, not maintained
  jmtpfs: maintend fork of mtpfs
- gmtp: simple graphical mtp client
- simple-mtpfs => in practice works very well
  simple-mtpfs ~/mnt/usb
- android-file-transfer: minimalist qt client + fuse wrapper
  aft-mtp-mount ~/my-device
  cf https://github.com/whoozle/android-file-transfer-linux, has the most features

Tricks
======

https://android.stackexchange.com/questions/98228/removing-encryption-from-recovery
    adb shell recovery --wipe_data --set_filesystem_encryption=off

Register your device for google applications:
https://www.xda-developers.com/google-blocks-gapps-uncertified-devices-custom-rom-whitelist/

Flash
=====

# ADB and fastboot
Archlinux: https://wiki.archlinux.org/index.php/android
- android-tools -> adb, fastboot
- android-udev -> https://github.com/M0Rf30/android-udev-rules/blob/master/51-android.rules [activates android, android_adb, android_fastboot symlinks]
"Instead of using udev rules, you may create/edit ~/.android/adb_usb.ini which contains a list of vendor IDs. (cf lsusb => vendor_id:product_id)"

# fastboot
https://forum.xda-developers.com/showthread.php?t=2277112 '[Guide] How To Setup And Use Fastboot'
- fastboot update factory.zip /flashall: Flash boot, system, vendor, and -- if found -- recovery. If the device supports slots, the slot that has been flashed to is set as active.
Note: - 'update' default to update.zip; which should contain a
        android-info.txt, boot.img, system.img and optional recovery.img.
      - flashall flashes the images of the same name available in the current
        directory. Essentially from the source, update does the equivalent of
        unzipping the file, cd to the directory and 'fastboot flashall'.
- fastboot erase system -w #Erase system + userdata and cache (and format if supported by partition type) (+ do a 'fastboot erase boot' too before clean ota rom install)
- fastboot getvar all

# adb
adb push --sync / pull -a / sync system|vendor|oem|data|all
adb shell
adb install
adb shell bmgr #backups packages, cf https://developer.android.com/guide/topics/data/testingbackup.html

Adb diagnostic mode: https://stackoverflow.com/questions/24006903/android-diagnostic-mode-how-to-enable-it
    su; setprop sys.usb.config diag,adb
    setprop sys.usb.config mtp #back to mtp

# Installer une nouvelle rom:
https://tektab.com/2015/10/31/android-bootloaderfastboot-mode-and-recovery-mode-explained/
https://developers.google.com/android/images #Instruction for flashing nexus
https://forum.xda-developers.com/wiki/Flashing_Guide_-_Android

1 - Déverrouiller le bootloader
2 - Flasher un recovery custom (ex : TWRP)
3 - Flasher une ROM (ex : Lineage OS)
4 - Éventuellement flasher les Google Apps (GAPPS, optionnel)

- fastboot (=bootloader): volume down + power / adb reboot bootloader
- recovery mode (par ex TWRP): volume up + power / adb reboot recovery

0) Usb debugging
- Enable USB Debugging on your phone or device:
    Jelly Bean (4.2) and newer: Go to Settings --> About Phone tap “Build Number” 7 times until you get a popup that you have become a developer. Then go to Settings --> Developer --> USB debugging and enable it. The device will ask to allow the computer with its fingerprint to connect. allowing it permanent will copy $HOME/.android/adbkey.pub onto the devices /data/misc/adb/adb_keys folder.

1) Unlock the bootloader
- Reboot phone into fastboot:
  adb reboot bootloader (or use key combo vol down + power)
- Unlock device bootloader:
  fastboot devices //see if device is unlocked
  fastboot flashing unlock (or fastboot oem unlock for older devices)
  [on newer android we also need to activate oem unlock on the developer options, cf http://www.droid-life.com/2014/11/04/fyi-android-5-0-introduces-enable-oem-unlock-option-in-developer-options/. Sur mon téléphone activer cette option a unlocké le bootloader sans avoir besoin de faire un 'fastbook flashing unlock']

2) Flash new recovery
  fastboot flash recovery Le_X820_TWRP.img; fastboot reboot
  fastboot boot Le_X820_TWRP.img #test without flashing

  Note: option to mount read only to back-up stock rom, cf https://twrp.me/site/update/2015/06/22/twrp-2.8.7.0-released.html

3) Flasher une rom (on peut aussi directement depuis twrp, que ce soit une
factory [= full image] ou une ota [= script d'install/updgrade])
   fastboot update factory.zip
ou adb sideload ota.zip

Note: pour mettre twrp en mode 'adb sideload': go to advanced -> adb sideload

4) Flasher des applis:
- Root a phone: magisk is opensource, so better than supersu, cf https://www.reddit.com/r/oneplus/comments/6plldl/what_is_magisk_how_does_it_compare_to_supersu/
  => install superSU https://su.chainfire.eu/
  $ adb sideload SuperSU-v2.79-201612051815.zip

- On the air updates
  Note: stock ota usually needs a stock boot.img (and maybe stock recovery.img)

OTA structure
=============

adb sideload essentiellement ça update une archive et execute un script
dedans (dans META-INF).
Quand le OTA utilise un block update, une full update revient
essentiellement au même que flasher via fastboot, mais par contre une
incremental update n'est possible que par OTA.

META-INF/com/google/android/update-binary is a script interpreter (script
called edify) in META-INF/com/google/android/updater-script
The OTA for lineage OS 
- copy 'install' in '/tmp/install'
- run_program("/tmp/install/bin/backuptool.sh", "backup");
- block_image_update("/dev/block/bootdevice/by-name/system", package_extract_file("system.transfer.list"), "system.new.dat", "system.patch.dat") #cf https://source.android.com/devices/tech/ota/block
- run_program("/tmp/install/bin/backuptool.sh", "restore");
- package_extract_file("boot.img", "/dev/block/bootdevice/by-name/boot");

Fastboot
--------

Exemple of android-info.txt (this is used by fastboot update/flashall):
  modelid: PL9910000
  cidnum: HTC__621
  mainver: 2.28.709.2
  btype:1
  aareport:1
  hbootpreupdate:12

Slots are used for A/B updates, cf
http://www.androidpolice.com/2016/11/07/android-7-1-feature-spotlight-a-closer-look-at-seamless-updates-partition-changes-and-new-fastboot-commands/
https://source.android.com/devices/tech/ota/ab_updates

Backups
=======

Back up stock rom: http://www.cyanogenmods.org/forums/topic/backup-data-android-device-step-step-guide/
Back up from adb: https://forum.xda-developers.com/showthread.php?t=2450045
http://android.stackexchange.com/questions/5232/how-can-i-view-the-android-internal-partition-table

Note on twrp system vs system_image: https://twrp.me/faq/whattobackup.html
system is like a tar.gz archive, system_image is a 'dd' bit by bit backup (which will work to restore when system is encrypted)

Backup partition table from adb shell:
echo '$ /proc/partitions' > /tmp/android.txt
cat /proc/partitions >> /tmp/android.txt
echo '$ /proc/mounts' >> /tmp/android.txt
cat /proc/mounts >> /tmp/android.txt
echo '$ ls -l /dev/block/platform/soc/by-name' >> /tmp/android.txt
ls -l /dev/block/platform/soc/by-name >> /tmp/android.txt
echo '$ df'  >> /tmp/android.txt
df >> /tmp/android.txt
echo '$ fdisk -l /dev/block/sd?' >> /tmp/android.txt
fdisk -l /dev/block/sd? >> /tmp/android.txt

Roms:
=====

- LineageOs. Some versions include the AKT for better battery
- AKT: Advanced Kernel Tweaks:
  https://forum.xda-developers.com/oneplus-3/how-to/advanced-interactive-governor-tweaks-t3476589 "AKT: [AKT] Advanced Kernel Tweaks v1.4 BETA | Insane Battery & Performance (SD820/1|OP3/T)"
  https://forum.xda-developers.com/showpost.php?p=70352820&postcount=2146 "Advanced Kernel Tweaks ~ [A·K·T] ~ All-in-one Project"
- AICP "Android ice cold project"
  https://www.reddit.com/r/Axon7/comments/6e515u/difference_between_android_ice_cold_project_and/
  AICP has lots more customization options and supports substratum
  officially. AICP also comes with magisk

Phones
======

LeEco Le Max 2: cf https://www.gizdev.com/install-twrp-root-le-max-2/
=> Install twrp recovery: twrp: https://dl.twrp.me/x2/

- fastboot  (volume down + power), recovery mode: volume up + power
- Unlock bands (not available yet for x829)
  https://forum.xda-developers.com/le-max-2/how-to/guide-unlock-bands-leeco-le-max-2-fix-t3439154
- Roms: https://forum.xda-developers.com/le-max-2/development
  - Stock roms: https://forum.xda-developers.com/le-max-2/how-to/le-max-2-official-stock-firmware-links-t3433761
  - List of firmwares: https://forum.xda-developers.com/le-max-2/help/flashing-modem419dv-00050-how-to-backup-t3587989 
    => https://yadi.sk/d/5v2p3F7o3GJBxn [I had 419D]
       More recent: https://yadi.sk/d/woKdrlRrv8yhr/%D0%94%D0%BB%D1%8F%20%D1%80%D0%B0%D0%B7%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%87%D0%B8%D0%BA%D0%BE%D0%B2
       MODEM_466D_V.00050.zip [x]
       MODEM_CN_26S_05.09_V.00033.zip
  - Official LineageOS CM 14.1: https://forum.xda-developers.com/le-max-2/development/unofficial-cyanogenmod-14-1-t3498764 
  - OREO:
    - Alpha EUI6: https://forum.xda-developers.com/le-max-2/development/alpha-eui-6-cbg-team-t3728196
    - Unofficial AICP Oreo: https://forum.xda-developers.com/le-max-2/development/8-0-aicp-x2-t3694741
    - Lineage OS 15.1 https://forum.xda-developers.com/le-max-2/development/rom-lineage-15-1-blue-t3745796
    - https://forum.xda-developers.com/le-max-2/development/rom-pixel-experience-t3734990
    - https://forum.xda-developers.com/le-max-2/development/rom-aosip-t3743937
- opengapps 8.1: https://forum.xda-developers.com/android/apps-games/arm-unofficial-opengapps-builds-android-t3743495
  https://forum.xda-developers.com/le-max-2/development/rom-aosip-t3743937
- backups: the boot.emmc.win backup image is *after* the supersu patch. The
  stock boot img is in x2-stock-boot.img
  Modem installed: MODEM_466D_V.00050.zip

Samsung S3 Mini
- Lineage OS 14.1: https://forum.xda-developers.com/galaxy-s3-mini/orig-development/rom-lineage-os-14-1-cyanogenmod-t3592044
