#!/bin/bash

if [ $# -eq 0 ]; then
	>&2 echo -e "Usage: btdate.sh <dev> \nExample: btdate.sh /dev/rfcomm0"
fi

if [ ! -e "$1" ]
then
exit
else
GPSDATE=""

until [ "$GPSDATE" != "" ]; do
GPSDATE=`gpspipe -n 10 -w | grep TPV | grep -e '"mode":[23]' | grep '"time":' | sed -r 's/.*"time":"([^"]*)".*/\1/' | tail -1`
done

date --utc -s "$GPSDATE"
echo "$GPSDATE"
date
read -p "Press a key to continue..."
fi 
