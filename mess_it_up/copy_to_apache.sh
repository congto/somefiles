#!/bin/sh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo -i
mkdir -p /var/lib/config-data/puppet-generated/horizon/usr/share/openstack-dashboard/static/app/
mkdir -p /var/lib/config-data/puppet-generated/horizon/root/mess_it_up
cp $SCRIPT_DIR/mess_it_up.php /var/lib/config-data/puppet-generated/horizon/usr/share/openstack-dashboard/static/app/
cp -r $SCRIPT_DIR/css /var/lib/config-data/puppet-generated/horizon/usr/share/openstack-dashboard/static/app/
cp -r $SCRIPT_DIR/js /var/lib/config-data/puppet-generated/horizon/usr/share/openstack-dashboard/static/app/
cp $SCRIPT_DIR/button_*.sh /var/lib/config-data/puppet-generated/horizon/root/mess_it_up/

cp ~/.ssh/id_rsa /var/lib/config-data/puppet-generated/horizon/root/mess_it_up/
cp /home/cbis-admin/AutoSetUP/bcmtkey.pem /var/lib/config-data/puppet-generated/horizon/root/mess_it_up/
