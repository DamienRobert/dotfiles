#!/bin/zsh

KEYFILE="$HOME/.authinfo.gpg"
GPGOPTIONS=(--no-tty -q)
GPGAGENTOPTIONS=(--daemon)
ONLYCONNECT=

function help() {
echo "get_authinfo connect to a gpg agent and read the auth file

  ACTIONS:
  start ploum: connect to gpg and start ploum,
    otherwise start gpg-agent and start   ploum
  exec ploum: connect to gpg and start ploum even if the connection failed
  startexec: like start, except that if it launch gpg-agent then it use it as
    gpg-agent get_authinfo exec ploum
    (the reason we recall get_authinfo is to set up the credentials)
  wait: run every 60s until it can connect to gpg
  pass|mutt|offlineimapall: get corresponding credentials

  OPTIONS:
  -connect: only connect to gpg without reading auth file
  -env: launch gpg agent with ${HOME}/.gpg-agent-info as env-file
  -auth: allow gpg to ask for our passphrase
  -key: use another keyfile than $KEYFILE
  -gpgopt|-gpgagentopt: add options when launching gpg/gpg-agent
  "
exit 1
}

#get environnement info from the pid
#seahorse needs DISPLAY to be set, don't ask me why...
function get_env_info() {
  vars=(GPG_AGENT_INFO DISPLAY)
  pid=$1
  eval "unset ${vars[@]}; $(printf "export %s;" $(sed 's/\x00/\n/g' /proc/${pid//[^0-9]/}/environ | grep $(printf -- "-e ^%s= " "${vars[@]}")) )"
}

#see if we can connect to gpg-agent
function get_auth() {
  #echo "calling auth: $GPG_AGENT_INFO"
  if [ -n "$ONLYCONNECT" ]; then
    gpg-agent 2>/dev/null
  else
    gpg-agent 2>/dev/null && auth=$(gpg $GPGOPTIONS -d $KEYFILE)
  fi
}

#look if we can connect to gpg, if not try via gpg-agent-info-file, if not try via polkit-gnoe (seahorse)
function connect-to-gpg() {
# #the best way should probably to write an environnement file when I launch
# #gpg-agent, and when I use seahorse to launch a program in .xprofile that
# #connect to it and print also an environnement file
if  get_auth; then
  return 0;
fi
for file in "$HOME/.gpg-agent-info" "$HOME/.cache/gpg-agent-info"; do
  if [ -f $file ]; then
    . $file
    export GPG_AGENT_INFO
    if get_auth; then
      return 0;
    fi
  fi
done
pidfound=""
pid=$(pgrep -U $UID polkit-gnome)  && get_env_info $pid && pidfound="true"
if [ -n "$pidfound" ] && get_auth; then
  return 0;
fi
return 1
}

function get_pass() {
  machine=$1; login=$2; port=$3
  #be carefull never to put $auth in an argument, otherwise it will be seen
  #on ps...
  pass=$(grep "machine $machine login $login password.*port $port" <<< $auth | cut -d ' ' -f 6)
}

while true;
do
  case "$1" in
    -- ) break ;;
    -h|-help|--help ) shift; help ;;
    -connect|--connect ) shift; ONLYCONNECT=true ;;
    #-env|--env ) shift; GPGAGENTOPTIONS=($GPGAGENTOPTIONS --write-env-file "${HOME}/.gpg-agent-info" --no-use-standard-socket) ;;
    -env|--env ) shift; GPGAGENTOPTIONS=($GPGAGENTOPTIONS --write-env-file "${HOME}/.gpg-agent-info") ;;
    -auth|--auth ) shift; GPGOPTIONS=() ;;
    -key|--key ) shift;  KEYFILE="$1"; shift ;;
    -gpgopt ) shift; GPGOPTIONS=($GPGOPTIONS $1); shift ;;
    -gpgagentopt ) shift; GPGAGENTOPTIONS=($GPGAGENTOPTIONS $1); shift ;;
    *) break;;
  esac
done

if [ $# -eq 0 ]; then
    connect-to-gpg
else
  prog=$1; shift
  case $prog in
    start )
      connect-to-gpg
      r=$?
      if [ $r -eq 0 ]; then
        exec "$@"
      else
        eval $(gpg-agent $GPGAGENTOPTIONS)
        get_auth
        exec "$@"
        # I don't use
        # gpg-agent --daemon "$@" here because I want to be able to unlock
        # the key before launching "$@"
        # so I have just added exec and startexec for that...
        # get_authinfo startexec ploum, if it can't connect to gpg will
        # launch gpg-agent --daemon get_authinfo exec ploum, where the
        # get_authinfo exec is just here to start the credentials
      fi
      ;;
    exec )
      connect-to-gpg;
      exec "$@"
      ;;
    startexec )
      connect-to-gpg
      r=$?
      if [ $r -eq 0 ]; then
        exec "$@"
      else
        eval $(exec gpg-agent $GPGAGENTOPTIONS $0 exec "$@")
      fi
      ;;
    wait )
      while true; do
        connect-to-gpg
        r=$?
        if [ $r -eq 0 ]; then break; fi
        echo "Could not connect to a gpg-agent, sleep 60s" >&2
        sleep 60
      done
      ;;

    getpass )
      connect-to-gpg
      ipass=get_pass $1 $2 $3
      printf "%s" $ipass
    ;;
    mutt )
      connect-to-gpg
      get_pass "phare.normalesup.org" "robert" "993"
      echo "set my_pw_phare = \"$pass\""
      get_pass "zimbra.inria.fr" "roberdam" "993"
      echo "set my_pw_inria = \"$pass\""
      get_pass "imap.gmail.com" "ploum.plam@gmail.com" "993"
      echo "set my_pw_ploum_plam_gmail = \"$pass\""
      get_pass "imap.gmail.com" "damien.olivier.robert@gmail.com" "993"
      echo "set my_pw_damien_robert_gmail = \"$pass\""
      get_pass "imap.gmail.com" "robertdami@gmail.com" "993"
      echo "set my_pw_robertdami_gmail = \"$pass\""
      get_pass "cyrha.drimm.u-bordeaux1.fr" "drobert" "993"
      echo "set my_pw_damien_robert_imb = \"$pass\""
      get_pass "imap.mail.yahoo.com" "robertdamien" "993"
      echo "set my_pw_yahoo = \"$pass\""

    ;;
    offlineimapall )
      connect-to-gpg
      mytype=$1
      case $mytype in
        perso|imb )
          output="passdict={"
          get_pass "phare.normalesup.org" "robert" "993"
          output="$output 'robert@phare.normalesup.org': \"$pass\","
          get_pass "zimbra.inria.fr" "roberdam" "993"
          output="$output 'roberdam@zimbra.inria.fr': '$pass',"
          get_pass "imap.gmail.com" "ploum.plam@gmail.com" "993"
          output="$output 'ploum.plam@gmail.com': '$pass',"
          get_pass "imap.gmail.com" "damien.olivier.robert@gmail.com" "993"
          output="$output 'damien.olivier.robert@gmail.com': '$pass',"
          get_pass "imap.gmail.com" "robertdamigmail.com" "993"
          output="$output 'robertdami@gmail.com': '$pass',"
          output="$output}"
          echo $output
          ;;
      esac
      ;;

  esac
fi
