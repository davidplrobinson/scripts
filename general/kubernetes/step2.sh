#!/bin/bash

snap install lxd
/snap/bin/lxd init --auto
/snap/bin/lxc network create lxdbr0 ipv4.address=auto ipv4.nat=true ipv6.address=none ipv6.nat=false
conjure-up kubernetes
