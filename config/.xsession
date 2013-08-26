#!/bin/sh

# Rem: .dmrc spécifie au dm quelle session sélectionner par défaut
# Note: gnome3 n'utilise plus ce fichier
#
# .gnomerc est executé par gdm suelement en version <2.4
# donc avec gnome3 ces deux fichiers sont obsolètes

[ -z "$_INITENV" ] && . "$HOME/.initenv"
. $MYFILES/.initlog
mylog "session" ".xsession ($0 $@)"

MYXSESSION=true
export MYXSESSION
_LAUNCH="$@"
if [ $# -eq 0 -a -n "$GDMSESSION" ]; then _LAUNCH="$GDMSESSION"; fi

mylog "session" ".xsession: $HOME/.xinitrc $_LAUNCH"
exec "$HOME/.xinitrc" "$_LAUNCH"
