#!/bin/bash
sh install-rust.sh

sudo apt install fd-find ripgrep bat exa zoxide expect xclip xsel 
cargo install starship gitui git-delta sd bottom tree-sitter-cli

sh install-nvim.sh
sh install-helix.sh
