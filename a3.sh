#!/bin/bash

echo "Enter a five-digit number: "
read number

if [ ${#number} -ne 5 ]; then
  echo "Error: Please enter a five-digit number"
  exit 1
fi

sum=0
for digit in $(echo $number | fold -w1); do
  sum=$(expr $sum + $digit)
done

echo "Sum of digits: $sum"
