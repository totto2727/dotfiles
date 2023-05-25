#!/bin/bash

source ~/dotfiles/static/script/exist.bash

test -d ~/git_config || git clone git@github.com:totto2727/git_config.git ~/git_config
test -d ~/ssh_config || git clone git@github.com:totto2727/ssh_config.git ~/ssh_config
test -d ansible_playbooks || git clone git@github.com:totto2727/ansible_playbooks.git ~/ansible_playbooks

test -e ~/dotfiles/install/install.bash && bash ~/dotfiles/install/install.bash

test -e ~/dotfiles/update/link.bash && bash ~/dotfiles/update/link.bash
test -e ~/dotfiles/update/theme.bash && bash ~/dotfiles/update/theme.bash

echo -e ":PackerInstall"
echo -e ":TSInstall all"
