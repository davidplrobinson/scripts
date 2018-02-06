#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

virsh net-define ./kvm_internal_network.xml
virsh net-define ./kvm_external_network.xml
virsh net-autostart internalnet
virsh net-autostart externalnet
virsh net-start internalnet
virsh net-start externalnet
virsh net-list --all
virsh net-info internalnet
virsh net-info externalnet
