#!/bin/sh

count=0

while true;
do
  time curl -o /dev/null $1
  count=$(expr $count + 1 )
  echo " Target url: $1"
  echo " Attempts: $count"
  sleep 2
done
