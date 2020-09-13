#!/bin/bash

count=0
#start
while true;
do
  curl -o /dev/null $1
  count=$(expr $count + 1)
  echo "Attempts: $count"
  echo "curl: $1"
  echo "Sleep time: $2 second"
  sleep $2
done
