#!/bin/sh
. $HOME/.initvars
mylog "session" ".xinitrc ($0 $@ DISPLAY=$DISPLAY)"

if [ -n "$MYXFAILSAFE" -o "x$1" = "xfailsafe" ]; then
	mylog "session" ".xinitrc: Launching failsafe session"
	DM="fvwm"; export DM
	mylog "session" ".xinitrc -> failsafe exec $DM (DISPLAY=$DISPLAY)"
	exec $DM
fi

if [ -z "$DESKTOP_SESSION" ]; then
	DESKTOP_XSESSION="xinitrc"
	export DESKTOP_SESSION
	mylog "session" ".xinitrc: xinitrc read but not launched by a *dm, try to source system *.d files"

	sysresources=/etc/X11/xinit/.Xresources
	if [ -f $sysresources ]; then
			xrdb -merge $sysresources
	fi
	[ -f /etc/xprofile ] && . /etc/xprofile

	# Run all system xinitrc shell scripts.
	xinitdir="/etc/X11/xinit/xinitrc.d"
	if [ -d "$xinitdir" ]; then
		for script in $xinitdir/*; do
			echo "Loading xinit script $script"
			if [ -x "$script" -a ! -d "$script" ]; then
				. "$script"
			fi
		done
	fi
	unset script
fi

[ "x$_INITXPROFILE" != "x$DISPLAY" ] && [ -f $HOME/.xprofile ] && . $HOME/.xprofile
if [ $# -eq 0  ]; then
	case "$DM" in
		fvwm ) LAUNCH="fvwm" ;;
		fvwm-xfce ) LAUNCH="fvwm" ;;
		mate ) LAUNCH="mate-session" ;;
		gnome ) LAUNCH="gnome-session" ;;
		xfce ) LAUNCH="startxfce4" ;;
		'' ) LAUNCH="fvwm" ;; #failsafe
		* ) LAUNCH="$1" ;;
	esac
else
	LAUNCH="$1"; shift
fi

mylog "session" ".xinitrc -> exec $LAUNCH $@ (DISPLAY=$DISPLAY, SESSION: $DM)"
exec "$LAUNCH" "$@"
