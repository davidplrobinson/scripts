#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

randomid=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 4 | head -n 1)
servername=svrv-vyos-254-$randomid
iso=/mnt/data/isos/vyos-1.1.7-amd64.iso

if [ ! -f $iso ]; then
	echo "File $iso not found"
	exit
fi

virt-install -n $servername --ram=512 --vcpu=1 --disk pool=datastore_1,format=qcow2,size=5 \
	--graphics vnc,listen=0.0.0.0,password=password --noautoconsole \
	--cdrom $iso --network bridge=virbr100 \
	--console "pty,target_type=serial" --wait=-1

virsh autostart $servername
virsh vncdisplay $servername
virsh list --all
