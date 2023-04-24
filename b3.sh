#!/bin/bash

vendor_id=$(grep -m 1 "vendor_id" /proc/cpuinfo | cut -d ":" -f 2 | sed 's/^[ \t]*//')
model_name=$(grep -m 1 "model name" /proc/cpuinfo | cut -d ":" -f 2 | sed 's/^[ \t]*//')
cpu_mhz=$(grep -m 1 "cpu MHz" /proc/cpuinfo | cut -d ":" -f 2 | sed 's/^[ \t]*//')
cache_size=$(grep -m 1 "cache size" /proc/cpuinfo | cut -d ":" -f 2 | sed 's/^[ \t]*//')

echo "Vendor ID: $vendor_id"
echo "Model Name: $model_name"
echo "CPU MHz: $cpu_mhz"
echo "Cache Size: $cache_size"
