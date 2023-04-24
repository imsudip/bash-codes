#!/bin/bash

IFS=':' read -ra directories <<< "$PATH"

for dir in "${directories[@]}"
do
  echo "$dir"

  ls -ld "$dir"
done
