#!/bin/bash

findprog () {
    _foundprog=`which $1`
    return $?
}

check_pdftk(){
if findprog pdftk; then
    _pdftk=true
else
    echo "Package pdftk needed. Installing..."
    sudo apt-get -y install pdftk
fi
}

check_magic(){
if findprog imagemagick; then
    _magic=true
else
    echo "Package imagemagick needed. Installing..."
    sudo apt-get -y install imagemagick
fi
}

check_pdftk
check_magic

mkdir temp_multi
cp $1 ./temp_multi/
cd temp_multi
echo "Expanding PDF file to multiple pages... May take a while..."
pdftk $1 burst output %01d.pdf
rm $1
rm *.txt

convert xc:white -page A4 ../blank.pdf

count=$(ls *.pdf -1 | wc -l)

let "dfi = -1"
let "b = 0"
until [ $dfi -ge 0 ]; do
  
  let "b = b + 8 "
  let "dfi = b - count"
done
echo "Creating $dfi blank pages..."

if [ $dfi -ne 0 ] ; then 
    for z in $(seq 1 1 $dfi)
    do
      f=$((count + z))
      cp ../blank.pdf "$f.pdf"
    done
fi

echo "Creating new combined PDF... Please Wait..."
let "count = count + dfi - 8"
for i in $(seq 0 8 $count)
do
  let "a = i+1 "
  let "b = i+3 "
  let "c = i+5 "
  let "d = i+7 "
    pdftk "$a.pdf" "$b.pdf" "$c.pdf" "$d.pdf"  cat output "a$i-1.pdf"
rm "$a.pdf"
rm "$b.pdf"
rm "$c.pdf"
rm "$d.pdf"
  let "w = i+4 "
  let "x = i+2 "
  let "y = i+8 "
  let "z = i+6 "
    pdftk "$w.pdf" "$x.pdf" "$y.pdf" "$z.pdf"  cat output "a$i-2.pdf"
rm "$w.pdf" 
rm "$x.pdf"
rm "$y.pdf"
rm "$z.pdf"
#  fi
done
   pdftk *.pdf  cat output "booklet-$1"
   mv "booklet-$1" ..
rm *
cd ..
rmdir temp_multi
rm blank.pdf
echo "Done... Your new file is booklet-$1"

