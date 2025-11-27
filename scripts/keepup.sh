#!/bin/bash

# Host to ping — use a highly reliable one
HOST="8.8.8.8"
# How many ping attempts before deciding there's no connection
PING_COUNT=2

# Log file (optional)
LOGFILE="$HOME/internet_check.log"

# Function to log messages
log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOGFILE"
}

# Try to ping
if ping -c $PING_COUNT -W 2 "$HOST" > /dev/null 2>&1; then
  log "Internet connection OK."
else
  log "No internet connection detected. Rebooting..."
  /usr/sbin/reboot
fi
