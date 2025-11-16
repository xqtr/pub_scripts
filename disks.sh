#!/bin/bash

#title           : usb stick operations
#description     : script to manage common usb stick operations
#author          : xqtr | http://cp737.net
#date            : 2024/10/28
#version         : 1.0
#usage           : 
#notes           : install fzf

script="${0##*/}"
script="${script%.*}"
DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#yellow start 
	C14="\e[1;33m"
#blue start 
	C01="\e[0;34m"
#color end
	CE="\e[0m"
#red start
	C04="\e[1;31m"
#black start
	C00="\e[0;30m"
#dark gray start
	C08="\e[1;30m"
#light blue start
	C09="\e[1;34m"
#green start
	C02="\e[0;32m"
#light green start
	C10="\e[1;32m"
#cyan start
	C03="\e[0;36m"
#light cyan start
	C11="\e[1;36m"
#light red start
	C12="\e[0;31m"
#purple start
	C05="\e[0;35m"
#light purple start
	C13="\e[1;35m"
#brown start
	C06="\e[0;33m"
#light gray start
	C07="\e[0;37m"
#white 
	C15="\e[1;37m"
#setting frequent stings
	YNYES="("$C14"Y"$CE"/"$C14"n"$CE")("$C14"Enter"$CE"=yes)"
	YNNO="("$C14"y"$CE"/"$C14"N"$CE")("$C14"Enter"$CE"=no)"

function presskey() {
  echo ""
  echo "Press a key to continue..."
  read -n 1
}

prompt_confirm_no() {
  while true; do
    echo -e -n "${1:-Continue?} ${YNNO}: "
    read -e -r -n 1 REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo; echo "Aborting..."; sleep 1; return 1 ;;
      $'\0A') echo; echo "Aborting..."; sleep 1; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input"
    esac 
  done  
}

function fzz() {
  #"right,50%,:wrap"
  fzf --ansi --bind 'enter:execute(echo {1})+abort' --bind 'end:last' --bind 'home:first' --header $'\x1b[1;32m'"$1"
}

function backup() {
  clear
  echo "You are going to create an image file of disk: $1"
  prompt_confirm_no || return 1
  echo "Unmounting USB stick..."
  sudo umount /dev/$1
  
  echo "Enter full absolute path/filename of image file:"
  read -p ":> " fn
  
  echo "Write /dev/$1 to file: $fn"
  prompt_confirm_no || return 1
    
  sudo dd if=/dev/$1 of="$fn" bs=1M status=progress
  
  echo "Finished. Check for errors..."  
}

function select_file() {
  while true 
do
  SELECTED="$(CLICOLOR_FORCE=1 ls -G -a --group-directories-first | fzf --header "Select File | Dir: $(pwd)")"
  if [ -z "$SELECTED" ]
  then
    exit 0
  fi
  
  if [ -d "$SELECTED" ]
  then
    cd $SELECTED
  else
    echo "$(pwd)/$SELECTED"
    return 0
  fi
done
}

function image() {
  clear
  echo "You are going to write an image file to disk: $1"
  prompt_confirm_no || return 1
  echo "Unmounting USB stick..."
  sudo umount /dev/$1
  
  fn=$(select_file)
  #read -p ":> " fn
  
  if [ -z "$fn" ]; then
    echo "Aborting..."
    sleep 1
    exit 1
  fi
  
  echo "Write $fn to device: /dev/$1"
  prompt_confirm_no || return 1

  sudo dd if="$fn" of=/dev/$1 bs=1M status=progress
  
  echo "Finished. Check for errors..."  
}

function format() {
  option=$(echo "1. FAT
2. EXT3
3. EXT4
4. VFAT
5. EXFAT
6. MSDOS
X. Exit" | fzz "Select Format Type | Disk: $1")

    if [ ! -z "$option" ]
      then
        echo "Unmounting USB stick... $1"
        sudo umount /dev/$1
        ch="$option"
        case $ch in
          1.*) sudo mkfs.fat /dev/$1;;
          2.*) sudo mkfs.ext3 /dev/$1;;
          3.*) sudo mkfs.ext4 /dev/$1;;
          4.*) sudo mkfs.vfat /dev/$1;;
          5.*) sudo mkfs.exfat /dev/$1;;
          6.*) sudo mkfs.msdos /dev/$1;;
          X.*) break;;
        esac
      echo "Checking for errors..."
      sudo fsck /dev/$1
    fi
  
}

function unmount(){
  echo "Unmounting drive: $1"
  sudo umount /dev/$1
  presskey
}

disk=$(lsblk -o HOTPLUG,NAME,VENDOR,MODEL,SIZE | grep "^ *1" | sed "s/      //g" | cut -d" " -f2- | fzz "Select USB Stick" | cut -d" " -f 1)

if [ -z $disk ]; then
  echo "No USB stick selected."
  exit 1
fi

option=$(echo "1. Format
2. Backup to Image
3. Write Image to Device
U. Unmount
X. Exit" | fzz "Select Operation")

    if [ ! -z "$option" ]
      then
        ch="$option"
        case $ch in
          1.*) format $disk;;
          2.*) backup $disk;;
          3.*) image $disk;;
          U.*) unmount $disk;;
          X.*) exit 1;;
        esac
    fi

