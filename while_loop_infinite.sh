#!/bin/bash
# curl https://raw.githubusercontent.com/JaeSung-Seo/bash-scripting/master/while_loop_infinite.sh | bash -s -- www.google.com 2
count=0

while true;
do
  curl -o /dev/null $1
  count=$(expr $count + 1)
  echo "Attempts: $count"
  echo "curl: $1"
  echo "Sleep time: $2 second"
  sleep $2
done
