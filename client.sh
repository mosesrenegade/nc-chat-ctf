#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then 
	echo "Incorrect number of arguments"
	echo "Usage: ./client.sh <server-ip> <port>"
	exit 1
else 
	server=$1
	port=$2
	echo -n "Enter your name: " ; read name
	echo "Your idenfifier will be: $name"
	echo "Connecting to $1 on port $2"
	while true; do
		#echo -n "$name: " > $tty ; read message
		read message
		echo -e "$name: $message" 
	done |  ncat --ssl-verify --ssl-trustfile chat-cert.pem $server $port # can use nc, netcat as well

fi
