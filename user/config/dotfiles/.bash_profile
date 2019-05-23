[ -z "$_INITVARS" -a -f "$HOME/.initvars" ] && . "$HOME/.initvars"

case "$_INIT" in
	*e*) ;;
	*) . "$HOME/.initenv";;
esac
command -v mylog >/dev/null && mylog "session" ".bash_profile"

#Only launch zsh under an interactive shell
if [[ -z $DESKTOP_SESSION && $(basename $SHELL) == "zsh" && -x $SHELL ]]; then
	command -v mylog >/dev/null && mylog "session" "-> Launch SHELL: $SHELL"
	exec $SHELL -l
fi

#By default the login shell does not source bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
