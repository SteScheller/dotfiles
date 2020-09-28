#!/bin/bash

servername='ssh1.visus.uni-stuttgart.de'
mountdir='/home/stefan/mnt/share'

if [ ! "$(ls -A $mountdir)" ]
then
    sshfs -o uid=1000,gid=1000 -C schellsn@$servername:/share ~/mnt/share
    RETVAL=$?
    if [ "$RETVAL" == 0 ] 
    then
        echo "mounted share directories..."
    else
        echo "could not mount share directories..."
    fi
else
    echo "mounted share directories..."
fi

