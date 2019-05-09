#! /bin/sh

compton &
mopidy &
/home/arthur/Development/scripts/polybar.sh &
nitrogen --restore &
xinput --set-prop 11 "libinput Accel Speed" "1"
# xrandr --output DVI-D-0 --auto --left-of HDMI-0 & 
xset r rate 200 25

export QT_AUTO_SCREEN_SCALE_FACTOR=1.5
export GDK_SCALE=1.5
