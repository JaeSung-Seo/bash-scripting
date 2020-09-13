#!/bin/sh

while true;
do
  curl -o /dev/null $1
  echo " Target url: $1"
  sleep 2
done
