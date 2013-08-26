# vim: filetype=sh:

[ -z "$_INITENV" ] && . "$HOME/.initenv"
. $MYFILES/.initlog
mylog "session" ".zprofile read"

if [ -z "$SSH_CLIENT" ]; then
case $MYHOSTTYPE in
  perso) 
    if systemctl --user --no-pager >/dev/null 2>&1; then
      systemctl --no-block --user  start "basic.target"
    else
      exec /usr/lib/systemd/systemd --user --unit="basic.target" &!
    fi
  ;;
esac
fi

if [ -z "$MYXSESSION" -a -z "$DESKTOP_SESSION" ]; then
  if [ -z "$SSH_AUTH_SOCK" -a -x "/usr/bin/ssh-agent" ]; then
  mylog "session" "  exec ssh-agent $SHELL"
  exec ssh-agent "$SHELL"
  fi
fi

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
