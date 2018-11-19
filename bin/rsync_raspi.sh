#!/bin/bash
# script to synchronise Pi files to backup

SOURCEDIR=/
TYPE=PI_IMAGE

ERROR=""
MYUSER=$USER
HOSTNAME=$(hostname)
BACKUPDIR=/mnt/Backup
LOGFILE=/tmp/rsync_$HOSTNAME.log

EXCLUDEFILE=~/bin/rsync_exclude.txt
EXCLUDE="--exclude-from $EXCLUDEFILE"
#DRY="--dry-run"
OPTS="--links --times --delete-during --modify-window=1"

if [ $1 ];
then 
    if [ $1 = "user" ];
    then
        TYPE="PI_USERS"
        SOURCEDIR=/home/$MYUSER
        LOGFILE=/tmp/rsync_$MYUSER.log
    else
        echo "ERROR: Unknown Parameter"
        echo "USAGE: rsync_raspi2.sh [user]"
        echo "Defaulting to Backup TYPE=$TYPE"
        ERROR="Unknown Parameter"
    fi
fi

if [ -e $LOGFILE ]; 
then rm $LOGFILE
fi

if [ -e $BACKUPDIR ];
then 
    echo "Backing up host $HOSTNAME to $BACKUPDIR "
    echo "---------------------------------------" >> $LOGFILE
    echo "HOST:$HOSTNAME - full backup from '/' " >> $LOGFILE
    echo "---------------------------------------" >> $LOGFILE

    sudo rsync -av $DRY $EXCLUDE $OPTS $SOURCEDIR $BACKUPDIR/$TYPE/$HOSTNAME >> $LOGFILE

    sudo sync;sync
    echo "BACKUP completed"
    df -H | grep  /mnt
    echo "----"
    echo "Backups on $BACKUPDIR/$TYPE"
    if [ $TYPE = "PI_USERS" ];
    then
        MORE="/*"
    fi
    sudo du -sh $BACKUPDIR/$TYPE/*$MORE
else
    echo "ERROR: $BACKUPDIR does not exist " | tee $LOGFILE
fi

head $LOGFILE
echo ......
tail $LOGFILE
