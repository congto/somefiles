#!/bin/sh

source /idan/overcloudrc
ceilometer alarm-threshold-create --name 'cpu_warning' --state alarm --description 'CPU utilization is above 10%' -m 'cpu_util' --period 60 --threshold 0.01  --comparison-operator gt --query 'resource_id=aa900825-f5ab-4529-bdfb-d39269a5fafb'
