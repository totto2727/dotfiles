#!/bin/bash

source ~/dotfiles/static/script/make_link.bash
source ~/dotfiles/static/script/exist.bash

target=rustup
exist "$target" && echo "$target" is installed && exit 0

sudo apt install gcc libssl-dev pkg-config make cmake build-essential
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source ~/.cargo/env
cargo install cargo-update
