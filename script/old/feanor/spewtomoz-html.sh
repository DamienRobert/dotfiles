#!/bin/zsh

# window id cache
. $HOME/.firefox-window.cache
export FIREFOX_WINDOW

PORT=8088

(
echo "HTTP/1.1 200 OK"
echo "Content-type: text/html"
echo
cat "$1"
) | netcat -l -q 1 -s 127.0.0.1 -p $PORT  &> /dev/null &
PID=$!

echo Launching firefox
firefox-remote -timeout 60 -e "openURL(http://127.0.0.1:$PORT/`date +%s`)" || (rm -f $HOME/.firefox-window.cache; kill $PID)
echo done...
wait
