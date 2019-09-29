#!/bin/sh

kill -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar tbar

echo "Bar is launched..."
