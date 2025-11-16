#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: browse.sh <MAC_ADDRESS> [gui]"
    exit 1
fi
if [ $# -lt 2 ]; then
    sdptool browse "$1"
    exit 1
fi
if [ $# -lt 3 ]; then
    sdptool browse "$1" | yad --text-info --file-op --editable --width=600 --height=480 --line-num --title="Quering BT Device. Please Wait... Check Channel!"
    exit 1
fi
