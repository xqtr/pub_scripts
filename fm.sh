#!/usr/bin/bash

media="mpv"
audio="audacious"

function list_dirs {
  dirs=("..") # Add ".." to the array
  dirs+=( "$(exa --classify --group-directories-first -1 ${pwd} | sed "s/\*$//g")" )
  printf "%s\n" "${dirs[@]}"
}

while :; do
  sel="$(list_dirs | fzf --header "${PWD}")"
  if [ -d "$PWD/$sel" ]; then
    cd "$sel"
  fi
  if [ -z "$sel" ]; then
    exit
  fi
  if [ -f "$PWD/$sel" ]; then
    case "$sel" in 
      *.avi) $media "$PWD/$sel";;
      *.mkv) $media "$PWD/$sel";;
      *.mp4) $media "$PWD/$sel";;
      *.webm) $media "$PWD/$sel";;
      *.mp3) $audio "$PWD/$sel";;
    esac
  fi
done
