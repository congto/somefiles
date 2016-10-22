#!/bin/sh

#Update zabbix item system.cpu.load[percpu,avg1] to every 10 seconds instead of 60
#Duplicate trigger Processor load is too high on {HOST.NAME} and change expression to "{compute-0-0:system.cpu.load[percpu,avg1].avg(1m)}>4"
#Disable the original trigger

#copy and make https://github.com/julman99/eatmemory
#Update vm.memory.size[available] to every 10 seconds instead of 60
#Duplicate trigger  Lack of available memory on server {HOST.NAME} and change expression to "{compute-0-0:vm.memory.size[available].last(0)}<250M"
#Disable the original trigger

echo "What would you like to do?"
echo "c - Raise CPU levels            Compute-0-0      <cu undo>"
echo "m - Raise Memory levels         Compute-0-0      <mu undo>"
echo "i - ifdown public interface     Compute-0-0      <iu undo>"
echo "s - Switch public port failure  Switch-0         <su undo>"
echo "Enter your choice: []:"
#read -r OPTION
case $1 in

c)  echo "Raise CPU levels on Compute-0-0"
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
    eatmemory 300M &
    ;;
mu) echo  "Undo raise Memory levels on Compute-0-0"
    pkill eatmemory
    ;;
i)  echo  "ifdown public interface on Compute-0-0"
    kill 123123123
    ;;
iu) echo  "ifup public interface on Compute-0-0"
    kill 123123123
    ;;
s)  echo  "Switch-0 public port failure"
    kill 123123123
    ;;
su) echo  "Undo switch-0 public port failure"
    kill 123123123
    ;;
*)  echo "UNKOWN!!"
    ;;
esac