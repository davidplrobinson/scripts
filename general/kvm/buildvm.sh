#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

randomid=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 4 | head -n 1)
servername=test-$randomid

virt-install -n $servername --ram=2048 --vcpu=1 --disk pool=datastore_1,format=qcow2,size=10 \
	--graphics vnc,listen=0.0.0.0,password=password --noautoconsole \
	--cdrom /mnt/data/isos/something.iso --network bridge=br37 \
	--console "pty,target_type=serial" --wait=-1

virsh autostart $servername
virsh vncdisplay $servername
virsh list --all
