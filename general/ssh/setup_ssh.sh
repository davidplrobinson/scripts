#!/bin/bash

if [ "$EUID" -eq 0 ]; then
	echo "Please DO NOT run as root"
	exit
fi

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y ssh

mkdir ~/.ssh
cat davidplrobinson.pub >~/.ssh/authorized_keys
chmod 700 ~/.ssh -R
