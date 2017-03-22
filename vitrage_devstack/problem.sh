#!/bin/sh
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
    /bin/eatmemory 300M &
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
    echo "What would you like to do?"
    echo "c - Raise CPU levels            Compute-0-0      <cu undo>"
    echo "m - Raise Memory levels         Compute-0-0      <mu undo>"
    echo "i - ifdown public interface     Compute-0-0      <iu undo>"
    echo "s - Switch public port failure  Switch-0         <su undo>"
    ;;
esac
