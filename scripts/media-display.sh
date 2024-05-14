#! /bin/bash

status=$(playerctl status 2>/dev/null)
output=$(playerctl metadata --format '{{ title }} - {{ artist }}' 2>/dev/null)
if [ "$status" != "Playing" ]; then
  echo "--"
elif [ -z "$output" ]; then
  echo ""
else
  echo $output
fi
