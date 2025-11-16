#!/bin/bash
if [ $# -eq 0 ]; then
    >&2 echo "No arguments provided, console mode. Insert an argument to run in GUI mode"
    hcitool scan
    exit 1
fi
if [ $# -eq 1 ]; then
	hcitool scan | yad --text-info --file-op --editable --width=600 --height=480 --line-num --title="Scanning for BT Devices. Please Wait..."
	exit 1
fi
