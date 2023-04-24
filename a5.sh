#!/bin/bash

echo "Enter a username: "
read username

# Find the user's details from /etc/passwd
user_details=$(grep "^$username:" /etc/passwd)

if [ -z "$user_details" ]; then
  echo "Error: User '$username' does not exist"
  exit 1
fi

user_info=($(echo $user_details | cut -d':' -f1,3,4,5,6,7))

echo "Username: ${user_info[0]}"
echo "User ID: ${user_info[1]}"
echo "Group ID: ${user_info[2]}"
echo "User ID Info: ${user_info[3]}"
echo "Home Directory: ${user_info[4]}"
echo "Login Shell: ${user_info[5]}"
