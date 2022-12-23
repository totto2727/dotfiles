#!/bin/bash

UUID='402B-6594'
DIR=/var/nfs/general
sudo mount -t ext4 UUID="$UUID" $DIR
echo "UUID=$UUID $DIR ext4    defaults        0       0" | sudo tee -a /etc/fstab
