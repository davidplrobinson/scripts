#!/bin/bash

# note - this script isn't finished, it will disconnect the network, to resolve use -
#
# sudo brctl delif br0 ens33
# sudo brctl delbr br0

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

brctl addbr br0
brctl addif br0 ens33
