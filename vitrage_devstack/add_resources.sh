#!/bin/sh

cd /home/stack
. /home/stack/keystonerc

echo "Creating Image"
if [ ! -f /home/stack/tinylinux.qcow2 ]; then
    wget https://github.com/Idandos/somefiles/raw/master/vitrage_devstack/tinylinux.qcow2
fi
openstack image create TinyLinux --public --file tinylinux.qcow2

echo "Creating Network & Subnet"
openstack network create NetA --share
openstack subnet create subnetA --network NetA --subnet-range 8.8.8.0/24 --gateway 8.8.8.1

echo "Creating Heat Stack"
openstack stack create some_stack --template https://github.com/Idandos/somefiles/raw/master/vitrage_devstack/some_stack.yaml


