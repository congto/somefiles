#!/bin/sh

echo "Starting zabbix"
sudo service zabbix-server start
sudo service zabbix-agent start

echo "vitrage_demo.sh: Running stack.sh"
cd /home/stack/devstack
./stack.sh

echo "vitrage_demo.sh: Configuring Devstack"
. /home/stack/keystonerc

echo "vitrage_demo.sh: Creating Image"
openstack image create TinyLinux --public --file /home/stack/tinylinux.qcow2

echo "vitrage_demo.sh: Creating Network & Subnet"
openstack network create NetA --share
openstack subnet create subnetA --network NetA --subnet-range 8.8.8.0/24 --gateway 8.8.8.1

echo "vitrage_demo.sh: Creating Heat Stack"
openstack stack create some_stack --template https://github.com/Idandos/somefiles/raw/master/vitrage_devstack/some_stack.yaml
