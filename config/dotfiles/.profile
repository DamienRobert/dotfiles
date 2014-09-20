[ -z "$_INITVARS" ] && . "$HOME/.initvars"
mylog "session" ".profile ($0 $@); SHELL=$SHELL"
case "$_INIT" in
	*e*) ;;
	*) . "$HOME/.initenv";;
esac
