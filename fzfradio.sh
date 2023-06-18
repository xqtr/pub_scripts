#!/bin/bash
#display the rest of the file, with all mystic stuff
thisfile=`basename "$0"`
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ $1 == "dm" ]]; then
  selected="$(cat $SCRIPT_DIR/$thisfile | tail -n+13 | grep "//" | sed 's/#//' | dmenu -l 20)"
else
  selected="$(cat $SCRIPT_DIR/$thisfile | tail -n+13 | grep "//" | sed 's/#//' | fzf -e -i)"
fi

stream="$(echo $selected | cut -d"," -f2 | tr -d '\n')"
audacious $stream

#dubstep,http://50.117.1.60:80/listen.pls?sid=1
#DnB/EDM,http://edmdnb.com:8000/radio.mp3
#BassJunkies,http://213.186.56.95:8128/
#Nautic Radio,http://83.137.145.141:14280/
#SubFM,http://procyon.shoutca.st:8062/stream
#darktechno,http://79.111.14.76:8002/darktechno
#iceradio,http://iceradio.net:8910/listen
#maxima,http://178.32.146.184:2088/listen.pls
#audacious,http://192.111.140.6:9772/listen.pls
#audacious,http://uk4.internet-radio.com:8049/stream
#renoize,http://stream.clubrenoize.com:9001/
#nectarine,https://scenestream.io/necta128.ogg
#audacious,http://pungas.space/radio/pungasradio.pls
#audacious,http://radio.modules.pl:8500/listen.pls
#partyvibe,http://www.partyviberadio.com:8040/listen.pls
#scene,https://www.scenesat.com/listen/normal/max.m3u
#paralax,https://www.radio-paralax.de/listen.pls
#uzic,http://stream.uzic.ch:9010/
