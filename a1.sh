#!/bin/bash

echo "Enter the length of the rectangle: "
read length

echo "Enter the breadth of the rectangle: "
read breadth

area=$(echo "$length*$breadth" | bc)
perimeter=$(echo "2*($length+$breadth)" | bc)

echo "Area of the rectangle: $area"
echo "Perimeter of the rectangle: $perimeter"
