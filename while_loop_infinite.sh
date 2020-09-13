#!/bin/bash

count=0

while true;
do
  curl -o /dev/null $1
  count=$(expr $count + 1)
  echo "Attempts: $count)
  echo "url: $1"
  sleep 2
done
