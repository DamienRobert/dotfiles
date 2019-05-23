#On imb
cd var/backups/unison || exit 1
find -name '(copy: conflict*on*)*' -exec rm {} \;
