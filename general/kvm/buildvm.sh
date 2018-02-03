#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

virt-install -n test --ram=512 --vcpu=1 --disk pool=default,format=qcow2,size=5 --graphics vnc,password=password --cdrom /mnt/data/isos/ubuntu-17.10.1-server-amd64.iso --network bridge:virbr100 --console pty,target_type=virtio
