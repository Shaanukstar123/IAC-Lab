#!/bin/sh



echo "Starting compilation"

for f in rtl/*.v; do
  iverilog -g 2012 -o ${f%.*} $f 
  #echo  -n "file $f without extension ${f%.*}\n" 
  if [ $? -eq 0 ]; then

    ./${f%.*}

    if [ $? -eq 0 ]; then

    echo -n "$f Pass\n"
    
    else
    
    echo -n "$f Fail\n"
    
    fi
  else
    echo -n "$f Fail\n"
  fi
done