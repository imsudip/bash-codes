#!/bin/bash

num_files=$(ls -l | grep ^- | wc -l)
num_dirs=$(ls -l | grep ^d | wc -l)

echo "Number of files: $num_files"
echo "Number of directories: $num_dirs"


echo "File names:"
ls -l | grep ^- | awk '{print $9}'
echo "Directory names:"
ls -l | grep ^d | awk '{print $9}'
