#!/bin/bash

bash ./brew.bash

bash ~/dotfiles/install/mac/link.bash

git clone git@github.com:totto2727/ansible_playbooks.git ~/ansible_playbooks

source ~/.asdf/asdf.sh
bash ~/dotfiles/update/asdf/update.bash

bash ~/dotfiles/install/install.bash

echo "fish ./fish.fish"

echo -e ":PackerInstall"
echo -e ":TSInstall all"
