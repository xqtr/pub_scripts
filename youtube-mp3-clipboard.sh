#!/bin/bash
cd /home/x/Music
mkdir downloads
cd downloads
yt-dlp -R5 -c --extract-audio --audio-format=mp3 "$(xclip -o -r)"
