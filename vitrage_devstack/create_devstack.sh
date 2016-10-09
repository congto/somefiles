#!/bin/sh

echo "~~~~~~~~~"
echo "PREPARING"
echo "~~~~~~~~~"
sudo adduser stack --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "stack:password" | sudo chpasswd

grep -q -F 'stack   ALL=(ALL) NOPASSWD:ALL' /etc/sudoers || echo 'stack   ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
DEBIAN_FRONTEND=noninteractive sudo apt-get -qqy update || sudo yum update -qy
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qqy git || sudo yum install -qy git
sudo chown stack:stack /home/stack
cd /home/stack

#sudo vi /etc/ssh/sshd_config
#change PasswordAuthentication to 'yes'
#sudo service ssh restart

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "CREATING KEYSTONE FILE /home/stack/keystonerc_admin"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "export OS_USERNAME=admin" > /home/stack/keystonerc_admin
echo "export OS_TENANT_NAME=admin" >> /home/stack/keystonerc_admin
echo "export OS_PASSWORD=password" >> /home/stack/keystonerc_admin
echo "export OS_AUTH_URL=http://127.0.0.1:5000/v2.0/" >> /home/stack/keystonerc_admin
echo "export PS1='[\u@\h \W(keystone_admin)]\$ '" >> /home/stack/keystonerc_admin

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "CLONE DEVSTACK AND CREATE /home/stack/devstack/local.conf"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

git clone https://git.openstack.org/openstack-dev/devstack
cd devstack

