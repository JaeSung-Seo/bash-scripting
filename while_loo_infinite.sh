#!/bin/sh

count = 0

while true;
do
  time curl -o /dev/null www.google.com
  count=$(expr $count + 1 )
  echo " Attempts: $count"
  sleep 2
done
