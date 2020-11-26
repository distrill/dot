#! /bin/sh

killall polybar
source ~/.config/bh/colors
MONITOR=eDP-1 polybar bh -r &
