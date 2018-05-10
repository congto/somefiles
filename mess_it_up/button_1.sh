#!/bin/sh
ssh -i /usr/share/httpd/.ssh/id_rsa root@overcloud-ovscompute-0.localdomain 'touch /tmp/kuku'
