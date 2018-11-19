#!/bin/bash

INTERFACE=eth0

if [ $1 ];
then INTERFACE=$1
#echo "Interface to check is $INTERFACE"
fi

IPADDR=$(ifconfig | grep -A 1 $INTERFACE | grep inet | awk '{print $2}'| sed s/addr://)

echo $IPADDR

