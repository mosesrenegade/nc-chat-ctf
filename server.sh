#!/usr/bin/env bash

if [[ ! -e chat-cert.pem ]] ; then

if [[ $# -ne 2 ]] ; then
     echo "Incorrect number of arguments, you do not have a certificate:"
     echo "Usage: ./server.sh <port> <ip of server>"
     exit 1
fi

  openssl req \
    -new \
    -newkey rsa:4096 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=EG/ST=Denial/L=River/O=IS/CN=$2" \
    -keyout chat-key.pem \
    -out chat-cert.pem
fi

if [[ $# -ne 2 ]] ; then 
	echo "Incorrect number of arguments."
	echo "Usage: ./server.sh <port> <ip of server>"
	exit 1
else 
	ncat --ssl --ssl-key chat-key.pem --ssl-cert chat-cert.pem -km 100 -lp $1 --broker
fi
