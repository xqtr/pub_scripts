#!/bin/bash

#alias yt-play-fzf-mpv='mpv "$(/usr/bin/ls *.mp4 | fzf --preview="catimg {}.png -r2 -w$COLUMNS")"'

function fzz() {
  #"right,50%,:wrap"
  fzf --ansi --bind 'end:last' --bind 'home:first' --header $'\x1b[1;32mVideo List'
  }

while [ -z "$ans"  ]
  do 
  rm -f /tmp/www.www
  /usr/bin/ls *.mp4 | fzz --preview="catimg {}.png -r2 -w$COLUMNS" > /tmp/www.www

  ans="$(cat /tmp/www.www)"
  if [ -z "$ans" ]; then
    rm /tmp/www.www
    exit
  fi


  option=$(printf "play\ndelete\nquit\n" | fzz)
  if [ ! -z "$option" ]; then
   case $option in
      play*) mpv "$ans";;
      delete*) clear
               echo "Do you want to delete the file?"
               select yn in "Yes" "No"; do
                 case $yn in
                   Yes ) rm "$ans"; break;;
                   No ) break;;
                 esac
               done;;

      quit*) exit;;
   esac
  fi
  ans=""
done

rm /tmp/www.www
