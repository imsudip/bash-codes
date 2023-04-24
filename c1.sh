#!/bin/bash

while read line; do
  a=$(echo $line | cut -d' ' -f1)
  b=$(echo $line | cut -d' ' -f2)
  c=$(echo $line | cut -d' ' -f3)
  
  sum=$(expr $a + $b + $c)
  
  echo "Sum of $a, $b, and $c is: $sum"
done < input.txt
