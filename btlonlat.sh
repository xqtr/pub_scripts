#!/bin/bash

if [ $# -eq 0 ]; then
	>&2 echo -e "Usage: btdate.sh <dev> \nExample: btdate.sh /dev/rfcomm0"
fi

if [ ! -e "$1" ]
then
exit
else
NMEA=""

until [ "$NMEA" != "" ]; do
NMEA=`gpspipe -n 10 -w | grep TPV | grep -e '"mode":[23]' | grep '"lat":' | tail -1`
done

echo "Latitude:"
echo $NMEA | cut -d"," -f 6 | cut -d":" -f 2
echo "Longitude:"
echo $NMEA | cut -d"," -f 7 | cut -d":" -f 2
echo "Altitude:"
echo $NMEA | cut -d"," -f 10 | cut -d":" -f 2


read -p "Press a key to continue..."
fi 
