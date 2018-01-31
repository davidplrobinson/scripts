#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

mkdir /mnt/data/datastores
virsh pool-define ./kvm_datastore.xml
virsh pool-start datastore_1
virsh pool-autostart datastore_1
virsh pool-list --all
virsh pool-info datastore_1

