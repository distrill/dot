#!/bin/sh

# mouse cursor shoudl not be an x
xsetroot -cursor_name left_ptr &

# fix oversized cursor
gsettings set org.gnome.desktop.interface cursor-size 16 &

# quick repeating keys
xset r rate 200 30 &

# xresources
xrdb -merge ~/.Xresources &

# retina display
export QT_AUTO_SCREEN_SCALE_FACTOR=2
export GDK_SCALE=2

# lockscreen
xautolock -time 5 -locker 'betterlockscreen -l' &

# screenshot daemon
flameshot &

dunst &
