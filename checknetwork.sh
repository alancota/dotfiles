#!/bin/bash

interface="$(networksetup -listnetworkserviceorder | grep -B1 "$(route get google.com | awk "/interface/ {print \$2}")" | awk "/Hardware Port:/ {print \$3}" | sed 's/.$//')"

if [ -n "$interface" ]; then
    iswifi="$interface"
    if [ "$iswifi" = "Wi-Fi" ]; then
        echo "wifi"
    fi
fi
