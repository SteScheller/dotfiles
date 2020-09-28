#!/bin/bash

servername='ssh1.visus.uni-stuttgart.de'
mountdir='/home/stefan/mnt/vhome'

if [ ! "$(ls -A $mountdir)" ]
then
    sshfs -o uid=1000,gid=1000 -C schellsn@$servername:/home/schellsn ~/mnt/vhome
    RETVAL=$?
    if [ "$RETVAL" == 0 ] 
    then
        echo "mounted home directory..."
    else
        echo "could not mount home director..."
    fi
else
    echo "mounted home directory..."
fi

