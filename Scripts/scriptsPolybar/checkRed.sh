#!/usr/bin/env bash
connected="說"
disconnected="ﲁ"

ping -c 1 google.com &>/dev/null
if [ $? == 0 ]; then
    echo "$connected Online" 
else
    echo "$disconnected Offline"
fi

