#!/bin/bash

source ~/dotfiles/static/script/make_link.bash
source ~/dotfiles/static/script/exist.bash

target=hx
exist "$target" && echo "$target" is installed && exit 0

target=tree-tree-sitter
exist "$target" && echo "$target" is installed || cargo install tree-sitter-cli || (echo 'rust is required' && exit 1)

cd || exit
git clone https://github.com/helix-editor/helix
cd ~/helix || exit
cargo install --path helix-term

rm -r ~/.config/helix/runtime
ln -s -f ~/helix/runtime/ ~/.config/helix/runtime

hx -g fetch
hx -g build

make_link ~/dotfiles/.config/helix ~/.config/helix
