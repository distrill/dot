#!/bin/sh


# mouse cursor should not be an x
xsetroot -cursor_name left_ptr &

# global vim keyboard
setxkbmap -option custom_arrows:custom

# quick repeating keys
xset r rate 200 30 &
# trackpad acceleration
xset m 10 2
# vim keys
xmodmap ~/.xmodmap

# screenshot daemon
flameshot &

# notifications
dunst &

# multitouch
fusuma &

# lockscreen
xautolock -time 5 -locker 'betterlockscreen -l' -corners '00-0' &
betterlockscreen -w dim &

# status bar
~/dev/dot/scripts/polybar.sh &

# trackpad 
# natural scrolling on the trackpoint 
xinput set-prop 'TPPS/2 Elan TrackPoint' 'libinput Natural Scrolling Enabled' 1
# disable main touchpad
xinput disable 'SYNA8017:00 06CB:CEB2 Touchpad'

# compositor
picom  &
