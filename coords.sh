#!/bin/bash

export RESULT=""

function error() {
yad --center --title=" Error " --width=500 --borders=15 --fixed --window-icon="gtk-dialog-error" --text="<span font= \"14\" >\nError in inserted value [$1]. \n\nTry Again. \n</span>" --button="gtk-close:1"
}

function showres() {
yad --form \
    --center --title=" Conversion Result " --width=500 --borders=15 --fixed --window-icon="gtk-dialog-error" \
    --button="gtk-close:1" \
    --field="Result:" "$@"\
    
}

RESULT=$(yad --form \
    --title="Coordinates Converter" \
    --center \
    --window-icon="application-x-addon" \
    --button="Convert!gtk-ok:0" --button="gtk-close:1" \
    --width=500 \
    --field="Convert From:CB" 'GGRS87!WGS84!UTM zone 34N' \
    --field="Longitude:" ''\
    --field="Latitude:" '' \
    --field="Convert From:CB" 'WGS84!GGRS87!UTM zone 34N' \
    --field="Result in Decimal:CHK")
    
ret=$?

[[ $ret -eq 1 ]] && exit 0

from=$(echo $RESULT | cut -d'|' -f1)
long=$(echo $RESULT | cut -d'|' -f2)
lat=$(echo $RESULT | cut -d'|' -f3)
to=$(echo $RESULT | cut -d'|' -f4)
dec=$(echo $RESULT | cut -d'|' -f5)


if [ -z "$from" ]; then
  error "FROM field"
fi
if [ -z "$lat" ]; then
  error "LATITUDE field"
fi
if [ -z "$long" ]; then
  error "LONGITUDE field"
fi
if [ -z "$from" ]; then
  error "TO field"
fi

case $from in
  WGS84) ft=4326 ;;
  GGRS87) ft=2100 ;;
  "UTM zone 34N") ft=23034;;
esac

case $to in
  WGS84) tt=4326 ;;
  GGRS87) tt=2100 ;;
  "UTM zone 34N") tt=23034;;
esac

if [ $dec == "FALSE" ]; then
  conv=$(echo "$lat $long" | cs2cs +init=epsg:$ft +to +init=epsg:$tt)
else
  conv=$(echo "$lat $long" | cs2cs +init=epsg:$ft +to +init=epsg:$tt -d 8)
fi

showres "$conv"


