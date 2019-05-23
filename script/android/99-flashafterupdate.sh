#!/sbin/sh
# From: https://forum.xda-developers.com/showthread.php?t=2239421&page=123
#
# /system/addon.d/99-flashafterupdate.sh
# For ROMs that don't have "Flash After Update" support built-in.
#
# During an upgrade, this script will flash zips in /sdcard/FlashAfterUpdate
# after all other addon.d backup/restore actions have completed.
#
# Create a file named "verbose" in the above directory to see all output from flashed zips.
# Create a file named "silent" in the above directory to hide all script output.
#
# osm0sis @ xda-developers

. /tmp/backuptool.functions

# define working paths
sdzipdir=/sdcard/FlashAfterUpdate;
tmpzipdir=/tmp/flashafterupd;

case "$1" in
  backup)
    # Stub
  ;;
  restore)
    # Stub
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # set up sdcard directory if it does not yet exist
    if [ ! -d "$sdzipdir" ]; then
      mkdir "$sdzipdir";
      chown 1023:1023 "$sdzipdir";
      chmod 775 "$sdzipdir";
    fi;

    # determine parent output fd
    FD=1;
    if [ ! -f "$sdzipdir/silent" ]; then
      OUTFD=`ps | grep -v "grep" | grep -oE "update(.*)" | cut -d" " -f3`;
      test -f "$sdzipdir/verbose" && FD=$OUTFD;
      ui_print() { until [ ! "$1" ]; do echo -e "ui_print $1\nui_print" >> /proc/self/fd/$OUTFD; shift; done; }
    else
      ui_print() { echo "$1"; }
    fi;

    # wait out any post-addon.d zip actions (flashing boot.img, etc.)
    while sleep 5; do
      ui_print " " "FlashAfterUpdate by osm0sis @ xda-developers";
      if [ ! "$(ls "$sdzipdir" | grep -vE 'verbose|silent')" ]; then
        ui_print " " "No files found in '$sdzipdir' to flash!";
        exit;
      fi;
      # read zips from sdcard directory and unpack then run update-binary/script
      metadir=META-INF/com/google/android;
      for i in "$sdzipdir"/*; do
        case "$i" in *silent|*verbose) continue;; esac;
        ui_print " " "--- Flashing '$i'...";
        mkdir -p "$tmpzipdir";
        unzip "$i" -d "$tmpzipdir" "$metadir/*";
        chmod 755 "$tmpzipdir/$metadir/update-binary";
        # update-binary <RECOVERY_API_VERSION> <OUTFD> <ZIPFILE>
        "$tmpzipdir/$metadir/update-binary" 3 $FD "$i";
        ret=$?;
        test $ret != 0 && ui_print "...Failed! Exit code: $ret" || ui_print "...Succeeded!";
        rm -rf "$tmpzipdir";
      done;
      ui_print " ";
      test -f "$sdzipdir/silent" || sleep 10;
      exit;
    done&
  ;;
esac;
