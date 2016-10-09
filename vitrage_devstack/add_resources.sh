#!/bin/sh

source /home/stack/keystonerc

#Images
wget https://github.com/Idandos/somefiles/raw/master/vitrage_devstack/tinylinux.qcow2
openstack image create TinyLinux --public --file tinylinux.qcow2

#Networks
openstack network create NetA --share
openstack subnet create subnetA --network NetA --subnet-range 8.8.8.0/24 --gateway 8.8.8.1

#Heat Stack
#wget https://github.com/Idandos/somefiles/raw/master/vitrage_devstack/some_stack.yaml

