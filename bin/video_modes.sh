#!/bin/bash

BUS=$(lsusb | grep 'LifeCam\|Chicony' | awk '{print $2}' | sed 's/://')
DEVICE=$(lsusb | grep Chicony | awk '{print $4}' | sed 's/://')
#echo "DEVICE=$DEVICE"

#CMD="lsusb -s $BUS:$DEVICE -v | grep 'Height\|Width'"
lsusb -s $BUS:$DEVICE -v | grep 'Height\|Width'

#echo $CMD
#$($CMD)

