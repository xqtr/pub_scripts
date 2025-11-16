#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "MD5Check"
    echo "  Usage:"
    echo "    md5check.sh <checksum> <file>"
    echo "                or"
    echo "    md5check.sh <checksum_file> <file>"
    echo " "
    exit
fi

fl="$2"
echo "Calculating MD5 checksum..."
md="$(md5sum $fl | cut -f1 -d' ')"

if [ -f "$1" ]; then 
    acheck="$(cat $1 | cut -f1 -d' ')"
  else
    acheck="$1"
fi
echo "Given checksum is      : $acheck"
echo "Calculated checksum is : $md"

echo "Checking..."
if [ "$md" == "$acheck" ]; then
  echo "File matches MD5 checksum!"
else
  echo "Checksum doesn't match!!!"
fi
