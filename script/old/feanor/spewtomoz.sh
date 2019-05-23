#!/bin/zsh
# spewtomoz.sh
# You shouldn't install this dumb script for all users because it only
# uses one pipe and one port.  Have it pick a better name for the pipe,
# and set the port from an environment variable.

# window id cache
touch $HOME/.firefox-window.cache
. $HOME/.firefox-window.cache
export FIREFOX_WINDOW

TEMP="$HOME/tmp/spewtomoz"
PORT=8088
rm -f $TEMP
mkfifo --mode=600 $TEMP


# netcat is the fun part of this script.
# -l:            listen for an incoming connection
# -q 1:          wait 1s after EOF and quit
# -s 127.0.0.1   only use the lo interface
# -p $PORT       use $PORT
echo "netcat"
netcat -l -q 1 -s 127.0.0.1 -p $PORT < $TEMP &> /dev/null &
PID=$!
# send the HTTP headers, followed by a blank line.
echo "HTTP/1.1 200 OK" >> $TEMP
echo -n "Content-type: " >> $TEMP
file -bni "$1" 2> /dev/null >> $TEMP
echo >> $TEMP

# debug
echo "debug"
file -bni "$1"

echo "send"
# Get started sending the file...
cat "$1" >> $TEMP &
# Wait a second and tell the user's Mozilla, wherever it is, to start
# viewing the file.  This works over the X protocol.
# (the date is to blow the cache and may not be necessary)
#sleep 1 && gnome-moz-remote http://localhost:$PORT/`date +%s`
echo Launching firefox
firefox -timeout 60 -e "openURL(http://127.0.0.1:$PORT/`date +%s`)" || (rm -f $HOME/.firefox-window.cache; kill $PID)
echo done...
sleep 20
wait
# end spewtomoz.sh
