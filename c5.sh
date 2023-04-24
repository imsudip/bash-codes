#!/bin/bash

count=0

for file in *.sh; do
  if [ -f "$file" ]; then
    ((count++))
  fi
done

echo "Number of shell scripts in the current directory: $count"
