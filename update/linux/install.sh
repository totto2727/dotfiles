#!/bin/bash
source ~/dotfiles/update/link.sh

bash ~/dotfiles/update/asdf/update.bash

bash ~/dotfiles/update/linux/install-rust.sh

sudo apt install fd-find ripgrep bat exa zoxide expect xclip xsel 

cargo install starship gitui git-delta sd bottom tree-sitter-cli
make_link ~/dotfiles/.config/gitui ~/.config/gitui 
make_link ~/dotfiles/.config/starship.toml ~/.config/starship.toml

bash ~/dotfiles/update/install.sh

bash ~/dotfiles/update/linux/install-nvim.sh
