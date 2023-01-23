#!/bin/bash

test -d ~/git_config || git clone git@github.com:totto2727/git_config.git ~/ansible_playbooks
test -d ~/ssh_config || git clone git@github.com:totto2727/ssh_config.git ~/ansible_playbooks
test -d ansible_playbooks || git clone git@github.com:totto2727/ansible_playbooks.git ~/ansible_playbooks

sudo apt install fd-find ripgrep bat exa zoxide expect xclip xsel zsh
sudo snap install starship
bash ~/dotfiles/install/linux/install-rust.sh && source ~/.cargo/env && cargo install starship gitui git-delta sd bottom tree-sitter-cli

bash ~/dotfiles/install/linux/install-asdf.bash && source ~/.asdf/asdf.sh && bash ~/dotfiles/update/asdf/update.bash

bash ~/dotfiles/install/install.bash

bash ~/dotfiles/install/linux/install-nvim.bash
bash ~/dotfiles/install/linux/install-helix.bash

bash ~/dotfiles/update/link.bash

echo -e ":PackerInstall"
echo -e ":TSInstall all"
