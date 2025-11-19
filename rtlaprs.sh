rtl_fm -f 144.8M -g 30 -s 22050 -l 20 - | multimon-ng -a AFSK1200 -A -t raw - | sed -u -r 's/^.{6}//'
