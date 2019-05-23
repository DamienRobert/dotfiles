[ -z "$_INITVARS" -a -f "$HOME/.initvars" ] && . "$HOME/.initvars"
mylog "session" ".profile ($0 $@ SHELL=$SHELL)"
case "$_INIT" in
	*e*) ;;
	*) [ -f "$HOME/.initenv" ] && . "$HOME/.initenv";;
esac
