#!/bin/sh

count=0
trap ' echo
	echo "try count: $count"
	date;
     exit ' SIGINT

while :
do
  time curl -o /dev/null $1
  count=$(expr $count + 1)
  sleep 1
done
