#!/bin/bash

username=guest
hostname=localhost

echo -n "Password: "
# echo back OFF

stty -echo
read password

#echo back On
stty echo

echo

# wget -q -password="$password" "ftp://${username}@${hostname}/filename.txt"
