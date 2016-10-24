#!/bin/sh

#Update zabbix item system.cpu.load[percpu,avg1] to every 10 seconds instead of 60
#Duplicate trigger Processor load is too high on {HOST.NAME} and change expression to "{compute-0-0:system.cpu.load[percpu,avg1].avg(1m)}>4"
#Disable the original trigger

#copy and make https://github.com/julman99/eatmemory
#Update vm.memory.size[available] to every 10 seconds instead of 60
#Duplicate trigger  Lack of available memory on server {HOST.NAME} and change expression to "{compute-0-0:vm.memory.size[available].last(0)}<250M"
#Disable the original trigger

echo "usage: ./problem.sh <option>"
echo "c - Raise CPU levels            Compute-0-0      <cu undo>"
echo "m - Raise Memory levels         Compute-0-0      <mu undo>"
echo "i - ifdown public interface     Compute-0-0      <iu undo>"
echo "s - Switch public port failure  Switch-0         <su undo>"
#read -r OPTION
case $1 in

c)  echo "Raise CPU levels on Compute-0-0"
    pkill yes
    yes > /dev/null &
    yes > /dev/null &
    yes > /dev/null &
    yes > /dev/null &
    yes > /dev/null &
    yes > /dev/null &
    yes > /dev/null &
    ;;
cu)  echo "Undo raise CPU levels on Compute-0-0"
    pkill yes
    ;;
m)  echo  "Raise Memory levels on Compute-0-0"
    pkill eatmemory
    eatmemory 300M &
    ;;
mu) echo  "Undo raise Memory levels on Compute-0-0"
    pkill eatmemory
    ;;
i)  echo  "ifdown public interface on Compute-0-0"
    touch /tmp/public-down
    ;;
iu) echo  "ifup public interface on Compute-0-0"
    rm /tmp/public-down
    ;;
s)  echo  "Switch-0 public port failure"
    touch /tmp/switch-port
    ;;
su) echo  "Undo switch-0 public port failure"
    rm /tmp/switch-port
    ;;
*)  echo "UNKOWN!!"
    ;;
esac
