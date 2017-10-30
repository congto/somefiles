#!/bin/sh
ssh -i /usr/share/httpd/.ssh/id_rsa root@overcloud-ovscompute-0.localdomain 'ifconfig eno3 up'

