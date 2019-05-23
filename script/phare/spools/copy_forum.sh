#!/bin/zsh

#echo "- unarchive forum*.tar.xz"
#ssh -L 42019:clipper.ens.fr:2019 -Nf ens
socat TCP-LISTEN:42119 ssl:forum.salle-s.org:2063,verify=0 &
./nntp_mirror.pl

echo $(date --rfc-3339="date") > 00LASTBACKUP
archive forum && mv forum.tar.xz forum.xz/forum.$(date --rfc-3339="date").tar.xz
