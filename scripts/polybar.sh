#! /bin/sh

killall polybar
source /home/arthur/.config/bh/colors
MONITOR=HDMI-0 polybar bh -r &
