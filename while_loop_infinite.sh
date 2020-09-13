#!/bin/bash

count=0

while true;
do
  curl -o /dev/null $1
  count=$(expr $count + 1)
  echo "Attempts: $count"
  echo "curl: $1"
  echo "\n"
  sleep 2
done
