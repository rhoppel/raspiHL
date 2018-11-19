#!/bin/bash

#INTERFACE=$1
#INTERFACE=$2
INTERFACE=eth0

if [ $1 = '-c' ]; 
then 
    if [ $2 ];
    then
        INTERFACE=$2
    fi
    CLEAN=YES
else
    if [ $1 ];
    then INTERFACE=$1
    fi
fi

MACADDR=$(ifconfig | grep $INTERFACE | awk '{print $5}')

if [ $CLEAN ];
then 
    echo $MACADDR | sed s/://g
else
    echo $MACADDR 
fi
