#!/bin/sh
. $HOME/.initvars
mylog "session" ".xinitrc ($0 $@ DISPLAY=$DISPLAY)"

if [ -n "$MYXFAILSAFE" -o "x$1" = "xfailsafe" ]; then
	DM="fvwm"; export DM
	mylog "session" ".xinitrc -> failsafe session: exec $DM"
	exec $DM
fi

if [ -z "$XDG_SESSION_DESKTOP" -a -z "$DESKTOP_SESSION" ]; then
	# We were not launched by a DM, don't use these variables (and this would
	# make the DM detection in .xprofile wrong)
	# XDG_SESSION_DESKTOP="xinitrc"
	# DESKTOP_SESSION="xinitrc"
	# export DESKTOP_SESSION XDG_SESSION_DESKTOP
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

case "$_INIT" in
	*"x($DISPLAY)"*) ;;
	*) [ -f "$HOME/.xprofile" ] && . "$HOME/.xprofile" ;;
esac

if [ $# -eq 0  ]; then
	case "$DM" in
		fvwm ) LAUNCH="fvwm" ;;
		fvwm-xfce ) LAUNCH="fvwm" ;;
		mate ) LAUNCH="mate-session" ;;
		gnome ) LAUNCH="gnome-session" ;;
		xfce ) LAUNCH="startxfce4" ;;
		'' ) LAUNCH="fvwm" ;; #failsafe
		* ) LAUNCH="$DM" ;;
	esac
else
	#Note: .xprofile sets DM="$1" also but only if DESKTOP_SESSION is not set
	#So DM prioritizes DESKTOP_SESSION while LAUNCH prioritizes $1
	LAUNCH="$1"; shift
fi

mylog "session" ".xinitrc -> exec $LAUNCH $@ (DM: $DM)"
exec "$LAUNCH" "$@"
