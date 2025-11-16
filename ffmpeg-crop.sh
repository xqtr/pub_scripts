#!/usr/bin/bash

#bash,No, parameters, passed
if [ $# -eq 0 ] || [ "$#" -ne 3 ]; then
    echo ""
    echo "ffmpeg-crop.sh <START> <END> <FILE>"
    echo ""
    echo " START: Crop from time 00:00:00"
    echo " END  : Crop to time 00:00:00"
    echo " FILE : Input File"
	echo ""
    echo "Output file name is cropped-FILE"
    echo ""
    exit 1
fi

START="$1"
END="$2"
FILE="$3"

ffmpeg -i "$FILE" -ss "$START" -to "$END" -async 1 -c copy "cropped-$FILE" 
