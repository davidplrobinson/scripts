#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

randomid=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1)

virt-install -n test-$randomid --ram=512 --vcpu=1 --disk pool=default,format=qcow2,size=5 \
	--graphics vnc,listen=0.0.0.0,password=password --noautoconsole \
	--cdrom /mnt/data/isos/ubuntu-17.10.1-server-amd64.iso --network bridge:virbr100 \
	--console "pty,target_type=serial"
