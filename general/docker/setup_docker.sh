#!/bin/bash

# Tested and working on ubuntu.

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

apt-get update
apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce docker-compose
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker run hello-world
docker-compose --version
