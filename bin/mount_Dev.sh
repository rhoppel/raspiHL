#!/bin/bash

MYUSER=$USER
MYID=$(id -u $MYUSER)
MYGID=$(id -g $MYUSER)

LOCALDIR=/home/$MYUSER/workspace/
#REMOTEDIR=//HS2/Development
REMOTEDIR=//HS2/Development/Raspberry_Pi/workspace

if [ "$1" = '-u' ];
then 
    sudo umount $LOCALDIR 
else
    PERMISSIONS="$(cat ~/.smbcredentials),uid=$MYID,gid=$MYGID"
    sudo mount -t cifs -o $PERMISSIONS $REMOTEDIR $LOCALDIR 
fi
