#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# install kvm
sudo apt-get install -y libvirt-bin qemu-kvm
sudo usermod -a -G libvirtd $(whoami)
#newgrp libvirtd

# install docker
curl -L https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
chmod +x /tmp/docker-machine
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

# get docker-machine-driver-kvm
curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-ubuntu16.04 >docker-machine-driver-kvm
sudo mv docker-machine-driver-kvm /usr/local/bin/
sudo chmod +x /usr/local/bin/docker-machine-driver-kvm

# install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

kubectl cluster-info

# install minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.22.3/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

echo
echo You must logout and back in now...
echo
