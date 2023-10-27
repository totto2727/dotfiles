#!/bin/bash

test -d ansible_playbooks || git clone git@github.com:totto2727/ansible_playbooks.git ~/ansible_playbooks

sudo apt install fd-find ripgrep bat exa zoxide expect xclip xsel zsh
bash ~/dotfiles/install/linux/install-rust.bash && source ~/.cargo/env && cargo install starship gitui git-delta sd bottom tree-sitter-cli starship

bash ~/dotfiles/install/install.bash

bash ~/dotfiles/install/linux/install-nvim.bash
bash ~/dotfiles/install/linux/install-helix.bash

bash ~/dotfiles/update/link.bash

echo -e ":PackerInstall"
echo -e ":TSInstall all"
