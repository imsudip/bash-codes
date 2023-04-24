#!/bin/bash

for dir in "$@"; do
  echo "Directory: $dir"
  
  echo -n "Disk usage (bytes): "
  du -s -b "$dir" | cut -f1
  
  echo -n "Disk usage (KB/MB): "
  du -s -h "$dir" | cut -f1
  
  echo ""
done
