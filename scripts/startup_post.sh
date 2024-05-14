#!/bin/sh

# background and lockscreen
betterlockscreen -w dim &

# status bar
~/dev/dot/scripts/polybar.sh &
