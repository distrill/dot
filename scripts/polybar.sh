#! /bin/sh

left="DP-0"
right="DP-2"
MONITOR=${left} polybar --reload &
MONITOR=${right} polybar --reload &
