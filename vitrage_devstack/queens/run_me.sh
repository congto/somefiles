#!/usr/bin/env bash
cd ~
rm -rf devstack/
git clone https://github.com/openstack-dev/devstack.git
cd devstack/
wget https://raw.githubusercontent.com/Idandos/somefiles/master/vitrage_devstack/queens/local.conf
sudo hostname compute-0-0
./stack.sh

cd ~
rm -rf keystonerc_admin
wget https://raw.githubusercontent.com/Idandos/somefiles/master/vitrage_devstack/queens/keystonerc_admin
wget https://raw.githubusercontent.com/Idandos/somefiles/master/vitrage_devstack/tinylinux.qcow2
wget -O /etc/vitrage/zabbix_conf.yaml https://raw.githubusercontent.com/Idandos/somefiles/master/vitrage_devstack/zabbix_conf.yaml
wget -O /home/stack/heat_stack.yaml https://raw.githubusercontent.com/Idandos/somefiles/master/vitrage_devstack/some_stack.yaml
wget https://raw.githubusercontent.com/Idandos/somefiles/master/vitrage_devstack/install_zabbix_on_devstack.sh

source keystonerc_admin
source /home/stack/devstack/openrc
echo "source keystonerc_admin" >> .bashrc
echo "source /home/stack/devstack/openrc" >> .bashrc

openstack image create TinyLinux --public --file /home/stack/tinylinux.qcow2
openstack network create NetA --share
openstack subnet create subnetA --network NetA --subnet-range 8.8.8.0/24 --gateway 8.8.8.1
openstack stack create App_1 --template https://github.com/Idandos/somefiles/raw/master/vitrage_devstack/some_stack.yaml
openstack stack create App_2 --template https://github.com/Idandos/somefiles/raw/master/vitrage_devstack/some_stack.yaml

sed -i.bak 's/stacks:global_index": "rule:deny_everybody/stacks:global_index": "/g' /etc/heat/policy.json
chmod +x install_zabbix_on_devstack.sh
sudo ./install_zabbix_on_devstack.sh
sudo service devstack@vitrage-graph restart
sudo service apache2 restart

