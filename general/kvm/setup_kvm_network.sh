#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

virsh net-define ./kvm_network.xml
virsh net-autostart internalnet
virsh net-start internalnet
virsh net-list --all
virsh net-info internalnet
