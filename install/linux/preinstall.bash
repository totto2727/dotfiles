#!/bin/bash

sudo groupadd sudoers
sudo useradd -s /bin/bash -m -k /etc/skel -u 2727 -U -G sudoers totto2727
sudo passwd totto2727
sudo visudo

%sudoers ALL=NOPASSWD: ALL
