# vim: filetype=zsh:
[ -z "$_INITVARS" ] && . "$HOME/.initvars"
mylog "session" ".zprofile ($0 $@)"

case "$_INIT" in
	*e*) ;;
	*) . "$HOME/.initenv";;
esac

if [[ -z $SSH_CLIENT ]]; then
	if [[ -x /usr/bin/systemctl && -e "$HOME/.config/systemd/user/basic.target" ]]; then
		if systemctl --user --no-pager >/dev/null 2>&1; then
			systemctl --no-block --user start "basic.target"
		else
			exec /usr/lib/systemd/systemd --user --unit="basic.target" &!
		fi
	fi
fi

if [[ -z $DESKTOP_SESSION && -z $SSH_AUTH_SOCK && -x "/usr/bin/ssh-agent" ]]; then
	mylog "session" ".zprofile -> exec ssh-agent $SHELL"
	exec ssh-agent "$SHELL"
fi
