#!/bin/bash

source ~/dotfiles/static/script/make_link.bash

sudo apt install fd-find ripgrep bat exa zoxide expect xclip xsel
snap install starship
make_link ~/dotfiles/.config/starship.toml ~/.config/starship.toml

bash ~/dotfiles/install/linux/install-asdf.bash && source ~/.asdf/asdf.sh && bash ~/dotfiles/update/asdf/update.bash

bash ~/dotfiles/install/linux/install-rust.sh && source ~/.cargo/env && cargo install starship gitui git-delta sd bottom tree-sitter-cli
make_link ~/dotfiles/.config/gitui/key_bindings.ron ~/.config/gitui/key_bindings.ron

bash ~/dotfiles/install/install.bash

bash ~/dotfiles/install/linux/install-nvim.bash
bash ~/dotfiles/install/linux/install-helix.bash
