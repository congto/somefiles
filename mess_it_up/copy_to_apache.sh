#!/bin/sh

rm -rf /usr/share/openstack-dashboard/static/app/css
rm -rf /usr/share/openstack-dashboard/static/app/js
rm -rf /usr/share/openstack-dashboard/static/app/mess_it_up.php
mkdir /usr/share/openstack-dashboard/static/app/css
mkdir /usr/share/openstack-dashboard/static/app/js
cp /idan/css/* /usr/share/openstack-dashboard/static/app/css
cp /idan/js/* /usr/share/openstack-dashboard/static/app/js
cp /idan/mess_it_up.php /usr/share/openstack-dashboard/static/app/


