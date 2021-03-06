#!/bin/sh
DIR=${MYTMP-/tmp}
while true;
do
  case "$1" in
    -d ) shift; DIR=$1; shift ;;
    -- ) break ;;
    *) break;;
  esac
done

findcmd() {
  find . -type f -atime +$TIME -ctime +$TIME -mtime +$TIME "$@"
}

TIME=${1-60}
echo "Dir to clean: $DIR, Time in day: $TIME"
cd "$DIR"

echo "Files to erase:"
findcmd -exec ls --color=auto -F -T 0 -d  '{}' \+
echo "Proceed? (press a key)"
read a
findcmd -delete && ploum | ls
ls | ls

case $1 in
  ploum|plam ) "ah"
    ;;
esac

echo "ploum
qfq f"

cat <<EOF
lalalal
EOF
