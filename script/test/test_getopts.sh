#!/bin/sh
die() { printf "$1\n" "${@:2}"; exit 1; } >&2
usage() { echo "Usage: ${0##*/} -C ploum -d -h plam"; }

#OPTERR=0
while getopts ':C:dh' flag; do
  case $flag in
    C) pacman_config=$OPTARG ;;
    d) directory=1 ;;
    h) usage ;;
    :) usage; die '%s: option requires an argument -- '\''%s'\' "${0##*/}" "$OPTARG" ;;
    ?) usage; die '%s: invalid option -- '\''%s'\' "${0##*/}" "$OPTARG" ;;
  esac
done
shift $(( OPTIND - 1 ))
echo "$@"
