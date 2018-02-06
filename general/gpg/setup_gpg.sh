#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

if [ ! -f ~/private.asc ]; then
	echo "Please copy your private key to ~/private.asc before running"
	exit
fi

apt-get update
apt-get upgrade
apt-get install -y gnupg2
