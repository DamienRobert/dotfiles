#!/bin/sh

[ -z "$_INITVARS" ] && . "$HOME/.initvars"
[ -z "$_INITENV" ] && . "$HOME/.initenv"
mylog "session" ".xsession ($0 $@ DISPLAY=$DISPLAY)"

[ -z "$DESKTOP_SESSION" ] && DESKTOP_SESSION="xsession"
export DESKTOP_SESSION
mylog "session" ".xsession -> $HOME/.xinitrc $@"
exec "$HOME/.xinitrc" "$@"
