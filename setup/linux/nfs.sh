#!/bin/bash
sudo apt update
sudo apt install nfs-kernel-server

sudo mkdir /var/nfs/general -p
sudo chown -R chmod -R "=r,u+w,g+w,o+w,+X"

sudo ln -s -f -v ~/dotfiles/static/nfs/exports /etc/exports
sudo systemctl restart nfs-kernel-server

echo '/var/nfs/general 192.168.11.0/24(rw,async,no_subtree_check,all_squash)' | sudo tee -a /etc/exports
