#!/bin/bash

source ~/dotfiles/static/script/exist.bash

test -d ~/git_config || git clone git@github.com:totto2727/git_config.git ~/git_config
test -d ~/ssh_config || git clone git@github.com:totto2727/ssh_config.git ~/ssh_config
test -d ansible_playbooks || git clone git@github.com:totto2727/ansible_playbooks.git ~/ansible_playbooks

exist cargo && cargo install cargo-update

# exist go && go install 

exist pip3 && pip3 install -r ~/dotfiles/static/package/requirements.txt

test -e ~/dotfiles/update/link.bash && bash ~/dotfiles/update/link.bash
test -e ~/dotfiles/update/theme.bash && bash ~/dotfiles/update/theme.bash

echo -e ":PackerInstall"
echo -e ":TSInstall all"
