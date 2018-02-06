#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

./setup_initial.sh
./setup_kvm_datastore.sh
./setup_kvm_network.sh
