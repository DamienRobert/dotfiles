# vim: filetype=zsh:
setopt null_glob
[[ -z $_INITVARS && -f "$HOME/.initvars" ]] && . "$HOME/.initvars"
command -v mylog >/dev/null && mylog "session" ".zprofile ($0 $@)"

case "$_INIT" in
	*e*) ;;
	*) [[ -f "$HOME/.initenv" ]] && . "$HOME/.initenv";;
esac

session_target="session"
[[ -n $SSH_CLIENT ]] && session_target="basic"
if [[ -x /usr/bin/systemctl && -e "$HOME/.config/systemd/user/$session_target.target" ]]; then
	if systemctl --user --no-pager >/dev/null 2>&1; then
		systemctl --no-block --user start "$session_target.target"
	else
		exec /usr/lib/systemd/systemd --user --unit="$session_target.target" &!
	fi
fi
unset session_target
