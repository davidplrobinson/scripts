#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

brctl addbr br0
brctl addif br0 ens33
