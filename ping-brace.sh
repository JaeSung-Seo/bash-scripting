#!/bin/bash

# IP ping testing with brace expansion

trap 'date; exit' INT

echo -n "Enter C class:(ex 192.168.0) ): "
read class
for ipaddr in $class.{1..254}
do
	ping -c 1 -t 1 "$ipaddr" > /dev/null 2>&1 
	
	if [ $? -eq 0 ]; then
	  echo "[OK] ping --> $ipaddr"
	else
	  echo "[NG] ping --> $ipaddr"
	fi

done
