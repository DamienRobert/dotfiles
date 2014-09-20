# .bash_profile
. $HOME/.initvars
case "$_INIT" in
	*e*) ;;
	*) . "$HOME/.initenv";;
esac
mylog "session" ".bash_profile"

#Only launch zsh under an interactive shell
if [[ -z $DESKTOP_SESSION && $(basename $SHELL) == "zsh" && -x $SHELL ]]; then
	mylog "session" "-> Launch zsh"
	exec $SHELL -l
fi

#By default the login shell does not source bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
