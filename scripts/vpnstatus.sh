#!/bin/sh

city=$(nordvpn status | grep City | cut -d ' ' -f 2-)
printf "VPN: ${city}"
