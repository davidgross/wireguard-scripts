#!/bin/bash

if [ $# -eq 0 ]
then
	echo "must have args"
else
	echo "Creating client config for: $1"
	mkdir $1
	wg genkey | tee clients/$1/$1.priv | wg pubkey > clients/$1/$1.pub
	key=$(cat clients/$1/$1.priv) 
	ip="10.8.0."$(expr $(cat last-ip.txt | tr "." " " | awk '{print $4}') + 1)
	cat wg0-client.example.conf | sed -e 's/:CLIENT_IP:/'"$ip"'/' | sed -e 's|:CLIENT_KEY:|'"$key"'|' > clients/$1/wg0.conf
	echo $ip > last-ip.txt
	cp SETUP.txt clients/$1/SETUP.txt
	tar czvf clients/$1.tar.gz clients/$1
	echo "Created config!"
	echo "Adding peer"
	sudo wg set wg0 peer $(cat clients/$1/$1.pub) allowed-ips $ip/32
	echo "Adding peer to hosts file"
	echo $ip" "$1 | sudo tee -a /etc/hosts
	sudo wg show
fi
