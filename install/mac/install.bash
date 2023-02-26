#!/bin/bash

test -d ~/git_config || git clone git@github.com:totto2727/git_config.git ~/git_config
test -d ~/ssh_config || git clone git@github.com:totto2727/ssh_config.git ~/ssh_config
test -d ansible_playbooks || git clone git@github.com:totto2727/ansible_playbooks.git ~/ansible_playbooks

bash ~/dotfiles/install/mac/brew.bash

source ~/.asdf/asdf.sh
make_link ~/dotfiles/.tool-versions ~/.tool-versions
make_link ~/dotfiles/.default-golang-pkgs ~/.default-golang-pkgs
bash ~/dotfiles/update/asdf/update.bash

bash ~/dotfiles/install/install.bash

bash ~/dotfiles/install/mac/shell.bash

bash ~/dotfiles/update/link.bash

echo -e ":PackerInstall"
echo -e ":TSInstall all"
