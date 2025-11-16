#!/bin/bash

yt-dlp "$1" --write-thumbnail -S "height:480"

for f in *.webp; do
  name=$(basename "$f" .webp)
  ffmpeg -i "$f" "$name.mp4.png"
done

rm *.webp
