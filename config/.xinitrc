#!/bin/sh

. $MYFILES/.initlog
mylog "session" ".xinitrc ($0 $@)"

if [ -n "$MYXFAILSAFE" -o "x$1" = "xfailsafe" ]; then
  mylog "session" ".xinitrc: Launching failsafe session"
  LAUNCHWM="fvwm"; 
else

 if [ -z "$MYXSESSION" -a -z "$DESKTOP_SESSION" -a -z "$GDMSESSION" -a -z "$GNOME_DESKTOP_SESSION_ID" ]; then
   MYXSESSION="true"
   export MYXSESSION
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
   # Load xsession scripts
   xsessionddir="/etc/X11/xsession.d"
   if [ -d "$xsessionddir" ]; then
       for i in `ls $xsessionddir`; do
           script="$xsessionddir/$i"
           echo "Loading X session script $script"
           if [ -r "$script"  -a -f "$script" ] && expr "$i" : '^[[:alnum:]_-]\+$' > /dev/null; then
               . "$script"
           fi
       done
   fi
   unset i; unset script
 
 fi
 
 [ -f $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources
 [ -f $HOME/.xprofile ] && . $HOME/.xprofile
 
 DEFAULT="startxfce4"
 case "$MYHOSTNAME" in
   Gondolin|Durin )
     DEFAULT="fvwm";
   ;;
   imb )
   if [ -e /usr/bin/mate-about ]; then
     DEFAULT="mate-session";
   else
     DEFAULT="gnome-session"
   fi
   ;;
 esac

 if [ $# -ne 0 ]; then
   LAUNCHWM="$@"
   case "$LAUNCHWM" in
     xfce )
       LAUNCHWM="startxfce4"
       ;;
   esac
 else
   LAUNCHWM=$DEFAULT
 fi

fi # end not failsafe 

mylog "session" ".xinitrc: exec $LAUNCHWM"
exec $LAUNCHWM
