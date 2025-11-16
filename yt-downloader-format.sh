#!/bin/bash
yt-dlp --download-archive downloaded.txt -i -o "%(uploader)s/%(title)s.%(ext)s" --embed-chapters --embed-metadata --sponsorblock-mark all,-filler --match-filters 'tags !*= shorts' --match-filter "is_live != true & was_live != true" "$FILE" "$@"
