#!/usr/bin/bash

#https://blog.ctms.me/posts/2023-12-18-download-options-youtube-archiving/

#bash,No, parameters, passed
if [ $# -eq 0 ]; then
    echo ""
    echo "yt-downloader.sh <URL> [QUALITY] [-s]"
    echo ""
    echo "  Quality Paramaters / Default is 720p:"
	echo "    --360, -3 : 360p"
    echo "    --480, -4 : 480p"
    echo "    --720, -7 : 720p"
    echo "    --1080, -1 : 1080p"
    echo "  -s : Download Subtitles"
    echo ""
    exit 1
fi

FILE="$1"
shift 1
QUALITY="136+234"
SUBS=0

while [ True ]; do
  if [ "$1" = "--480" -o "$1" = "-4" ]; then
      QUALITY="135+234"
      shift 1
  elif [ "$1" = "--720" -o "$1" = "-7" ]; then
      QUALITY="136+234"
      shift 1
  elif [ "$1" = "--360" -o "$1" = "-3" ]; then
        QUALITY="134+234"
        shift 1
  elif [ "$1" = "--1080" -o "$1" = "-1" ]; then
      QUALITY="137+234"
      shift 1
  elif [ "$1" = "-s" ]; then
  		SUBS=1
  		shift 1
  else
      break
  fi
done

#yt-dlp --download-archive downloaded.txt -f $QUALITY -i -o "%(uploader)s/%(title)s.%(ext)s" --write-thumbnail --convert-thumbnails png --embed-thumbnail --write-subs --write-auto-subs --embed-subs --sub-langs en --embed-chapters --embed-metadata --sponsorblock-mark all,-filler --dateafter 20230615 --match-filters 'tags !*= shorts' --match-filter "is_live != true & was_live != true" "$FILE"
if [ $SUBS -eq 1 ]; then
	yt-dlp --download-archive downloaded.txt -f $QUALITY -i -o "%(uploader)s/%(title)s.%(ext)s" --write-subs --write-auto-subs --embed-subs --sub-langs en --embed-chapters --embed-metadata --sponsorblock-mark all,-filler --match-filters 'tags !*= shorts' --match-filter "is_live != true & was_live != true" "$FILE"
else
	yt-dlp --download-archive downloaded.txt -f $QUALITY -i -o "%(uploader)s/%(title)s.%(ext)s" --embed-chapters --embed-metadata --sponsorblock-mark all,-filler --match-filters 'tags !*= shorts' --match-filter "is_live != true & was_live != true" "$FILE"
fi
