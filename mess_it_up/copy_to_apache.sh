#!/bin/sh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
rm -rf /idan
mkdir /idan
cp -r $SCRIPT_DIR/* /idan/
rm -rf /usr/share/openstack-dashboard/static/app/css
rm -rf /usr/share/openstack-dashboard/static/app/js
rm -rf /usr/share/openstack-dashboard/static/app/mess_it_up.php
mkdir /usr/share/openstack-dashboard/static/app/css
mkdir /usr/share/openstack-dashboard/static/app/js
cp /idan/css/* /usr/share/openstack-dashboard/static/app/css
cp /idan/js/* /usr/share/openstack-dashboard/static/app/js
cp /idan/mess_it_up.php /usr/share/openstack-dashboard/static/app/
setenforce 0



