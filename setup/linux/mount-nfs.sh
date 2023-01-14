#!/bin/bash

sudo apt update
sudo apt install nfs-common

mkdir -p ~/nfs/general

DOMAIN=dev-surface3.totto.page
HOST_DIR=/var/nfs/general
CLIENT_DIR=$HOME/nfs/general

sudo mount -o vers=4 -o bg "$DOMAIN":"$HOST_DIR" "$CLIENT_DIR"
echo "$DOMAIN:$HOST_DIR $CLIENT_DIR nfs defaults 0 0" | sudo tee -a /etc/fstab

sudo mount -a
