#!/bin/bash
sh ~/dotfiles/update/linux/install-asdf.sh
bash ~/dotfiles/update/asdf/update.bash

sh ~/dotfiles/update/linux/install-rust.sh

sudo apt install fd-find ripgrep bat exa zoxide expect xclip xsel 

cargo install starship gitui git-delta sd bottom tree-sitter-cli

sh ~/dotfiles/update/install.sh

sh ~/dotfiles/update/linux/install-nvim.sh
sh ~/dotfiles/update/linux/install-helix.sh
