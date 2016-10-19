#!/bin/sh

# Close STDOUT file descriptor
exec 1<&-
# Close STDERR FD
exec 2<&-
# Open STDOUT as $LOG_FILE file for read and write.
exec 1<>/tmp/vitrage_demo.log
# Redirect STDERR to STDOUT
exec 2>&1

echo "Starting zabbix"
sudo service zabbix-server start
sudo service zabbix-agent start


echo "vitrage_demo.sh: Getting local.conf"
cd /home/stack/devstack
mv local.conf local.conf.orig
wget https://github.com/Idandos/somefiles/raw/master/vitrage_devstack/local.conf
wget -O /etc/vitrage/zabbix_conf.yaml https://raw.githubusercontent.com/Idandos/somefiles/master/vitrage_devstack/zabbix_conf.yaml
sudo hostname compute-0-0

echo "vitrage_demo.sh: Running stack.sh"
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
