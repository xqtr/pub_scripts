#!/bin/bash

yt-dlp --flat-playlist $1 --print-to-file "%(duration_string)s - %(title)s;%(id)s" /tmp/ttt.ttt

fn=""
while [ -z "$fn"  ]
  do 
  fn=$(cat /tmp/ttt.ttt | fzf)
  if [ ! -z "$fn" ]; then
    vid=$(echo "$fn" | cut -d";" -f2)
    mpv https://www.youtube.com/watch?v=$vid
    fn=""
  else 
    break
  fi
  
done

rm /tmp/ttt.ttt
