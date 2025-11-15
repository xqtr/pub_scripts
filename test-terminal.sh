#!/bin/bash
#
#   This file echoes a bunch of 24-bit color codes
#   to the terminal to demonstrate its functionality.
#   The foreground escape sequence is ^[38;2;<r>;<g>;<b>m
#   The background escape sequence is ^[48;2;<r>;<g>;<b>m
#   <r> <g> <b> range from 0 to 255 inclusive.
#   The escape sequence ^[0m returns output to default

function presskey() {
  read -p "Press ENTER to continue..."
}

setBackgroundColor()
{
    echo -en "\x1b[48;2;$1;$2;$3""m"
}

resetOutput()
{
    echo -en "\x1b[0m\n"
}

# Gives a color $1/255 % along HSV
# Who knows what happens when $1 is outside 0-255
# Echoes "$red $green $blue" where
# $red $green and $blue are integers
# ranging between 0 and 255 inclusive
rainbowColor()
{ 
    let h=$1/43
    let f=$1-43*$h
    let t=$f*255/43
    let q=255-t

    if [ $h -eq 0 ]
    then
        echo "255 $t 0"
    elif [ $h -eq 1 ]
    then
        echo "$q 255 0"
    elif [ $h -eq 2 ]
    then
        echo "0 255 $t"
    elif [ $h -eq 3 ]
    then
        echo "0 $q 255"
    elif [ $h -eq 4 ]
    then
        echo "$t 0 255"
    elif [ $h -eq 5 ]
    then
        echo "255 0 $q"
    else
        # execution should never reach here
        echo "0 0 0"
    fi
}

function terminal-app() {
# Source - https://stackoverflow.com/a
# Posted by user14033418, modified by community. See post 'Timeline' for change history
# Retrieved 2025-11-15, License - CC BY-SA 4.0
ps -o comm= -p "$(($(ps -o ppid= -p "$(($(ps -o sid= -p "$$")))")))"

}

function terminal-ansi() {
    echo -e "Bold Red: \033[1;31mBold red?\033[0m"
    echo -e "Underlined Blue: \033[4;34mUnderlined Blue?\033[0m"
    echo -e "Blinking Yellow (if supported): \033[5;33mBlinking Yellow?\033[0m"
    echo -e "Reversed text: \033[7mReversed?\033[0m"
    IFS=';' read -sdR -p $'\E[6n' ROW COL;echo -n "Cursor Position: ${ROW#*[} x ${COL#*[} ..."
    presskey
    echo -en "\033[?25lThe cursor should be invisible..."
    presskey
    echo -en "\033[?25hThe cursor should be now visible..."
    presskey
    
    echo -en "Cursor shape to blinking block: \033[0 q"
    presskey
    echo -en "Cursor shape to steady block: \033[2 q"
    presskey
    echo -en "Cursor shape to blinking underline: \033[3 q"
    presskey
    echo -en "Cursor shape to steady underline: \033[4 q"
    presskey
    echo -en "Cursor shape to blinking bar: \033[5 q"
    presskey
    echo -en "Cursor shape to steady bar: \033[6 q"
    presskey
    echo -en "Did you hear a bell? \007\007 $(tput bel)"
    presskey
    echo -e "\033[0 q"
    echo "Terminal width in characters:"
    echo "0....:....1....:....2....:....3....:....4....:....5....:....6....:....7....:....8"
    clear
    for i in `seq 0 49`; do
      echo $i
      echo -en " "
    done
    echo -n "50 Type the number you see on top> "
    read line
    echo -e "Your terminal has $((50 - $line + 1)) lines"
}

function terminal-various() {
  echo ":: Terminal size is: TPUT: $(tput cols) x $(tput lines) | STTY: $(stty size)"
  echo ":: The terminal supports $(tput colors) colors"
  echo ':: The $TERM env. is:' $TERM
  echo ":: Terminal application is: " $(terminal-app)
  echo ":: Encoding is: $(locale charmap)"
  echo "--- Locale info ---"
  locale
  echo -e ":: Do you see the Euro sign? ---> \xe2\x82\xac "
  echo -e ":: Do you see a smily emoticon? ---> \u263A"
}

function test24bit() {
echo "If you are seeing gradient color changing, the terminal supports 24bit colors"
for i in `seq 0 127`; do
    setBackgroundColor $i 0 0
    echo -en " "
done
resetOutput
for i in `seq 255 -1 128`; do
    setBackgroundColor $i 0 0
    echo -en " "
done
resetOutput

for i in `seq 0 127`; do
    setBackgroundColor 0 $i 0
    echo -n " "
done
resetOutput
for i in `seq 255 -1 128`; do
    setBackgroundColor 0 $i 0
    echo -n " "
done
resetOutput

for i in `seq 0 127`; do
    setBackgroundColor 0 0 $i
    echo -n " "
done
resetOutput
for i in `seq 255 -1 128`; do
    setBackgroundColor 0 0 $i
    echo -n " "
done
resetOutput

for i in `seq 0 127`; do
    setBackgroundColor `rainbowColor $i`
    echo -n " "
done
resetOutput
for i in `seq 255 -1 128`; do
    setBackgroundColor `rainbowColor $i`
    echo -n " "
done
resetOutput
}

clear
echo "--- Various terminal capabilities..."
terminal-various
presskey
clear
echo "--- ANSI Codes Support..."
terminal-ansi
presskey
clear
echo "--- Lets test color support..."
test24bit
