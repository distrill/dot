#! /bin/sh

# left=$(xrandr  | grep connected | grep -v disconnected | grep HDMI | cut -d " " -f1)
# right=$(xrandr  | grep connected | grep -v disconnected | grep DP | cut -d " " -f1)
left="DP-0"
right="DP-2"
MONITOR=${left} polybar --reload &
MONITOR=${right} polybar --reload &
