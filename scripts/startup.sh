#!/bin/sh

compton &
mopidy &
~/Development/scripts/polybar.sh &

# background
nitrogen --restore &

# notifications
/usr/bin/dunst &

# trackpad
id=$(xinput list | grep Touchpad | awk '{print $6}' | sed s/id=//)
xinput set-prop ${id} "libinput Accel Speed" +0.5
xinput set-prop ${id} "libinput Natural Scrolling Enabled" 1
xinput set-prop ${id} "libinput Tapping Enabled" 1
xinput set-prop ${id} "libinput Click Method Enabled" 0 1
# multitouch gestures
fusuma &
# hjkl arrows
xmodmap ~/Development/scripts/my_keyboard &

# repeating key rate
xset r rate 200 30 &
xsetroot -cursor_name left_ptr &

# san mateo, ca
redshift -l 37.547150:-122.314400 &

export QT_AUTO_SCREEN_SCALE_FACTOR=2
export GDK_SCALE=2
