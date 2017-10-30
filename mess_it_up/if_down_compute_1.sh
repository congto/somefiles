#!/bin/sh
ssh -i /usr/share/httpd/.ssh/id_rsa root@overcloud-ovscompute-1.localdomain 'ifconfig eno3 down'
