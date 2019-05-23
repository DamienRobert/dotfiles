#!/bin/sh

[ -z "$_INITVARS" -a -f "$HOME/.initvars" ] && . "$HOME/.initvars"
mylog "session" ".xsession ($0 $@ DISPLAY=$DISPLAY)"
case "$_INIT" in
	*e*) ;;
	*) [ -f "$HOME/.initenv" ] && . "$HOME/.initenv";;
esac

[ -z "$XDG_SESSION_DESKTOP" ] && XDG_SESSION_DESKTOP="xsession"
[ -z "$DESKTOP_SESSION" ] && DESKTOP_SESSION="xsession"
export DESKTOP_SESSION XDG_SESSION_DESKTOP
mylog "session" ".xsession -> exec $HOME/.xinitrc $@"
exec "$HOME/.xinitrc" "$@"
