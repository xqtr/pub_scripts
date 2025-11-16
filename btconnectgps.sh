#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: connectgps.sh <MAC_ADDRESS> <channel> [gui]"
    exit 1
fi
if [ $# -lt 3 ]; then
    rfcomm release "$2"
    rfcomm bind /dev/rfcomm0 "$1" "$2"
    pkill gpsd -9
    gpsd /dev/rfcomm0 --port 6666
    echo "GPSD Initiated on port 6666"
    exit 1
fi
if [ $# -eq 3 ]; then
yad --notification \
  --listen \
  --image="gnome-info" \
  --text="GPSD Initiated on port 6666"
#    sdptool browse "$1" | yad --text-info --file-op --editable --width=600 --height=480 --line-num --title="Quering BT Device. Please Wait... Check Channel!"
#    exit 1
fi
