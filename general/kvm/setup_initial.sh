#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

apt-get update
apt-get upgrade
apt-get install -y ssh screen qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker uuid
kvm-ok
