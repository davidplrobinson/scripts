sudo virt-install -n test2 --ram=512 --vcpu=1 --disk pool=default,format=qcow2,size=5 --graphics vnc,password=password --cdrom /mnt/data/isos/ubuntu-17.10.1-server-amd64.iso --network bridge:virbr100
