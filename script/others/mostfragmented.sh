#!/bin/bash
#From: http://ram.kossboss.com/find-fragmented-files-volume-filefrag-extents-per-megabyte/
#
# Filename: mostfragged.sh
#
# What this does:
# Runs an analysis on files by looking at thier sizes and number of extents (using filefrag tool), then it organizes the data to help find which files are most fragmented (extents per mb)
#
# Instructions:
# 1. Copy paste contents into a script called mostfragged.sh (or whatever name you wnat)
# 2. Read through the "Pick a Find" section below (and follow its steps if you want to skip reading certain folders, like snapshot folders)
# 3. Save the script
# 4. Run the script: mostfragged.sh <directory to analyze>
# 5. Wait for results that will get dumped to current directory
# 6. Read the MF-FINAL results for the best info, and the MF-0000# for other information
#
# Extra Info:
# /tmp files are generated and final files are generated into current directory (where mostfragged.sh is ran from - not where mostfragged.sh is located)
#
# How to read data:
# MB is size in megabytes (base 2, mebibytes MiB), e is filefrag extents, and e/MB is extents per megabytes (base 2, mebibytes MiB)
#
# Usage: mostfragged.sh <directory to analyze>
# Example: mostfragged.sh /data
# Example: mostfragged.sh /data/somefolder/
#
# Release Notes:
# UPDATE 8-21-2014: added support to skip snapshot folders for READYNAS OS6 scanning (just need to comment out default find, and uncomment the correct find). Read section below called pick a find.
# UPDATE 8-20-2014: fixed files with spaces (see #### comments below, ## for style change). dumping all results to same folder & better useability (check for argument, etc...)
# UPDATE 5-27-2014: filenames output are better now in script (make more sense)
#
###################
# THE MAIN SCRIPT #
###################
#
# --- set location of scan (To absolute path of given folder) ---
LOCATION=`readlink -f $1`
if [ -z ${LOCATION} ]; then echo -e "ERROR: Missing argument\nUsage: $0 <directory to analyze>\nExample: $0 /data"; exit 1; fi;
if [ ! -d ${LOCATION} ]; then echo -e "ERROR: directory doesn't exist\nUsage: $0 <directory to analyze>\nExample: $0 /data"; exit 1; fi;
# D81=`date +s%s-d%D-t%T | tr /: -`
D81=`date +d%Y-%m-%d-t%T | tr /: -`
# --- set file prefix (to a string that includes the full file path that can make do as a filename) ---
PATH2STRING=$(echo ${LOCATION} | sed -e 's/[^A-Za-z0-9._-]/_/g')
pref1x=MF-00001--${D81}--${PATH2STRING}
pref11x=MF-00002--${D81}--${PATH2STRING}
pref2x=MF-00003--${D81}--${PATH2STRING}
pref3x=MF-00004--${D81}--${PATH2STRING}
pref4x=MF-00005--${D81}--${PATH2STRING}
pref5x=MF-FINAL--${D81}--${PATH2STRING}
pref6x=MF-FINAL--${D81}--${PATH2STRING}
# filenames
file1=`pwd`/${pref1x}--extents.txt    # old filename: /tmp/extents-${D81}.txt
file11=`pwd`/${pref11x}--extents-organized.txt # this is like step 1.5 (to fix files with spaces)
file2=`pwd`/${pref2x}--sortbyextents.txt    # old filename: /tmp/sortbyextents-${D81}.txt
file3=`pwd`/${pref3x}--bytes-per-extent.txt    # old filename: /tmp/bytes-per-extent-${D81}.txt
file4=`pwd`/${pref4x}--extents-per-mb.txt    # old filename: /tmp/extents-per-mb-${D81}.txt
file5=`pwd`/${pref5x}--extents-per-mb.txt    # old filename: `pwd`/mostfragged-extents-per-mb-${D81}.txt
file6=`pwd`/${pref6x}--mostfragged-bytes-per-extent.txt    # old filename: `pwd`/mostfragged-bytes-per-extent-${D81}.txt
# --- work-begins ---
echo "-----------START INFO:---------------------"
echo "START INFO: Starting fragmentation analysis on: ${LOCATION}"
echo "START INFO: This might take a while (seconds to hours - depending on amount of data & fragmentation)"
echo "START INFO: Dumping data to current directory: `pwd`"
echo "-----------START:--------------------------"
echo "* [`date +%D-%T`][`date +%s`] STARTING 0/6: Analyzing $LOCATION for sizes and number of extents"
################################################
################################################
# ==============Pick a find:===================#
# Scanning with find will go through the entire
# directory tree, it will even scan the millions
# of copies that could exist due to snapshots
# The default find will scan everything.
# If you want to skip snapshot folders then pick
# one of the below finds (other then the default
# one). If on a Readynas I recommend using the
# ABSOLUTE FIND instead of the RELATIVE FIND.
# The RELATIVE FIND will skip all folders with
# the words snapshot/.snapshot/.snapshots (Even
# if the are customer made). The ABSOLUTE FIND
# will make sure that they are the NETGEAR made
# snapshot folder by looking into how deep into
# the filesystem the folders are as well. If
# Not on a READYNAS and your snapshots dont
# adhere to the folder notation: snapshot
# or .snapshot or .snapshots then you can make
# your own CUSTOM FIND
################################################
################################################
# **************** Default Find ************** # - comment this out if not on a readynas (or else this script will go on for forever through all of the snapshots)
find $LOCATION -type f -printf "%s - " -exec filefrag {} \; > ${file1}
################################################
################################################
# **************** RELATIVE FIND to skip snapshots for Readynas OS6 ************** #
# - since this is relative this will skip all directories names snapshot/.snapshots/.snapshot (even if its customers own dirs)
# find $LOCATION -type f -not -iwholename "*/.snapshot/*" -not -iwholename "*/.snapshots/*" -not -iwholename "*/snapshot/*" -not -iwholename "*/._snap-*/*" -printf "%s - " -exec filefrag {} \; > ${file1}
################################################
################################################
# **************** ABSOLUTE FIND to skip snapshots for Readynas OS6 ************** # <----------------------------- pick this one for readynas os6 best results
# - since this is absolute this will skip only netgear named snapshot/.snapshots/.snapshot folders
# find $LOCATION -type f -not -iwholename "/*/._share/*/.snapshot/*" -not -iwholename "/*/*/.snapshots/*/snapshot/*" -not -iwholename "/*/*/snapshot/*" -not -iwholename "/*/._snap-*/*" -printf "%s - " -exec filefrag {} \; > ${file1}
################################################
################################################
# **************** CUSTOM FIND for Snapshots ************** #
# - change the below snaps to whatever you call your snapshot folder (so if you call them snapshotties, then put in "*/snapshotties/*"
# find $LOCATION -type f -not -iwholename "*/snaps/*" -printf "%s - " -exec filefrag {} \; > ${file1}
################################################
################################################
#### added below to fix files with spaces
echo "* [`date +%D-%T`][`date +%s`] 0.5/6: Half way thru step1 - Organizing the data"
cat ${file1} | sed -n 's/^\([0-9]*\) - \(.*\): \([0-9]*\) extent[s]* found$/\1 bytes \3 extents - \2/p' > ${file11}
echo "* [`date +%D-%T`][`date +%s`] DONE 1/6: ${file1} generated"
# SORT BY SIZE AND EXTENTS (we need the extents ones)
# cat * | sort -nk1 > sortbysize.txt
#### changed below from file1 to file11 and -nk4 to -nk3 to fix spaces issue
cat ${file11} | sort -nk3 > ${file2}
echo "* [`date +%D-%T`][`date +%s`] DONE 2/6: /tmp/sortbyextents-${D81}.txt generated"
echo "* Starting Calculating BYTES PER EXTENT"
#### for files with space: $1 stays, $4 becomes $3, $3 to $6 (need to make it $6+)
## cat ${file2} | awk '{print "B: " $1, " e: " $3, " B/e: " ($1/$3), ": " $6}' > ${file3}
## cat ${file2} | awk '{print $1 " Bytes " $3 " extents " ($1/$3) " B/e - " $6}' > ${file3}
#### ---- interesting awk trick (to print nth column to end) start comment ---- ####
# How printed file name (because of spaces it can span more than just the 6th column, but it could be 6th column +): Note that $1=$2=$3=$4=$5="", so that $0 is the 6th column plus the rest, but that leaves left trailing spaces which we remove with gsub(match this,change to this,on this variable)
#### ---- interesting awk trick (to print nth column to end) end comment ---- ####
cat ${file2} | awk '{FIRST=$1; THIRD=$3; $1=$2=$3=$4=$5=""; gsub(/^[ \t]+/,"",$0); SIXPLUS=$0; print FIRST " Bytes " THIRD " extents " FIRST/THIRD " B/e - " SIXPLUS}' > ${file3}
echo "* [`date +%D-%T`][`date +%s`] DONE 3/6: ${file3} generated"
echo "* [`date +%D-%T`][`date +%s`] Starting Calculating EXTENTS PER MB"
#### for files with space: $1 stays, $4 becomes $3, $3 to $6 (need to make it $6+)
## cat ${file2} | awk '{print "M: " $1/1024/1024, " e: " $3, " e/M: " ($3/($1/1024/1024)), ": " $6}' > ${file4}
## cat ${file2} | awk '{print $1/1024/1024 " MB " $3 " extents " ($3/($1/1024/1024)) " e/MB - " $6}' > ${file4}
cat ${file2} | awk '{FIRST=$1; THIRD=$3; $1=$2=$3=$4=$5=""; gsub(/^[ \t]+/,"",$0); SIXPLUS=$0; print FIRST/1024/1024 " MB " THIRD " extents " (THIRD/(FIRST/1024/1024)) " e/MB - " SIXPLUS}' > ${file4}
echo "* [`date +%D-%T`][`date +%s`] DONE 4/6: ${file4} generated"
# THE 5TH COLUMN IS E/M WHICH IS THE EXTENTS PER MEGABYTE, LETS SORT BY IT
## cat ${file4} | sort -nk6 > ${file5} <--- 5th col used to be 6th
cat ${file4} | sort -nk5 > ${file5}
echo "* [`date +%D-%T`][`date +%s`] DONE 5/6: Finished - look for ${file5} generated"
# THE 5TH COLUMN BELOW IS B/E LETS SORT BY IT
## cat ${file3} | sort -nk6 > ${file6} <--- 5th col used to be 6th
cat ${file3} | sort -nk5 > ${file6}
echo "* [`date +%D-%T`][`date +%s`] DONE 6/6: Finished - look for ${file6} generated"
echo "-----------ANALYSIS COMPLETE:--------------"
D81F=`date +s%s-d%D-t%T | tr /: -`
echo "* START TIME: ${D81}"
echo "* END TIME: ${D81F}"
echo "-----------NONE IMPORTANT RESULTS:---------"
echo "* The following files are optional and inbetween information (you can choose to delete them with these command):"
echo "rm ${file1}"
echo "rm ${file11}"
echo "rm ${file2}"
echo "rm ${file3}"
echo "rm ${file4}"
echo "-----------IMPORTANT RESULTS:--------------"
echo "* The MF-FINAL files should be used for analysis:"
echo "(1) ${file5}"
echo "(2) ${file6}"
echo "-----------THE END-------------------------"
