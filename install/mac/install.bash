#!/bin/bash

bash ~/dotfiles/install/mac/brew.bash

git clone git@github.com:totto2727/ansible_playbooks.git ~/ansible_playbooks

source ~/.asdf/asdf.sh
make_link ~/dotfiles/.tool-versions ~/.tool-versions
make_link ~/dotfiles/.default-golang-pkgs ~/.default-golang-pkgs
bash ~/dotfiles/update/asdf/update.bash

bash ~/dotfiles/install/install.bash

bash ~/dotfiles/install/mac/shell.bash

bash ~/dotfiles/update/link.bash

echo "fish ./fish.fish"

echo -e ":PackerInstall"
echo -e ":TSInstall all"
