#!/bin/bash

MYUSER=$USER
MYID=$(id -u $MYUSER)
MYGID=$(id -g $MYUSER)

LOCALBACKUPDIR=/mnt/Backup
REMOTEBACKUPDIR=//HS2/Backup/raspi

if [ "$1" = '-u' ];
then 
    sudo umount $LOCALBACKUPDIR
else
    PERMISSIONS="$(cat ~/.smbcredentials),uid=$MYID,gid=$MYGID"
echo $PERMISSIONS
    sudo mount -t cifs -o $PERMISSIONS $REMOTEBACKUPDIR $LOCALBACKUPDIR 
fi
