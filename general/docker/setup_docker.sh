#!/bin/bash

# Tested and working on ubuntu.

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

apt-get update
apt-get install -y --no-install-recommends linux-image-extra-$(uname -r) linux-image-extra-virtual
apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl software-properties-common
#curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"
#add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) bionic test"
apt-get update
apt-get -y install docker-ce docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
update-rc.d docker defaults
update-rc.d docker enable
service docker start
docker run hello-world
