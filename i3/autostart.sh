#!/bin/sh

killall polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

fcitx &
feh --bg-fill ~/Downloads/back.jpg
echo "---" | tee -a /tmp/tbar.log
polybar right >> /tmp/right.log 2>&1 &

echo "Bar is launched..."

