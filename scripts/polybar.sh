#! /bin/sh

killall polybar
source ~/.config/bh/colors
MONITOR=HDMI-0 polybar bh -r &
