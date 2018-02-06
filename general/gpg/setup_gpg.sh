#!/bin/bash

if [ "$EUID" -eq 0 ]; then
	echo "Please DO NOT run as root"
	exit
fi

if [ ! -f ~/private.asc ]; then
	echo "Please copy your private key to ~/private.asc before running"
	exit
fi

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y gnupg2

gpg --import /home/localadmin/private.asc
gpg --list-keys
