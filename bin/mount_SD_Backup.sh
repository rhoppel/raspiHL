#!/bin/bash

MYUSER=$USER

SDCARD=/dev/sda2
SDCARDDIR=/mnt/Backup

if [ "$1" = '-u' ];
then 
    sudo umount $SDCARDDIR
else
    if [ -e $SDCARDDIR ];
         then 
             sudo mount  $SDCARD $SDCARDDIR
    fi
fi
