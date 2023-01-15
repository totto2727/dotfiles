#!/bin/bash

source ~/dotfiles/static/script/exist.bash

target=cargo
exist "$target" || (echo "$target" is not installed && exit 1)

target=rustup
exist "$target" || (echo "$target" is not installed && exit 1)

rustup update

cargo install-update --all
