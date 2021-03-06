#/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

sudo apt-get update
sudo apt-get upgrade

apt-get install -y docker-compose
docker-compose up -d
