#!/bin/bash

MYUSER=$USER
MYID=$(id -u $MYUSER)
MYGID=$(id -g $MYUSER)

HOST=$(hostname)
LOCALBACKUPDIR=/mnt/Backup
REMOTEBACKUPDIR=//HS2/Development/Raspberry_Pi/$HOST

if [ "$1" = '-u' ];
then 
    sudo umount $LOCALBACKUPDIR
else
    PERMISSIONS="$(cat ~/.smbcredentials),uid=$MYID,gid=$MYGID"
echo $PERMISSIONS
    sudo mount -t cifs -o $PERMISSIONS $REMOTEBACKUPDIR $LOCALBACKUPDIR 
fi
