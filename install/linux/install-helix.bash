#!/bin/bash
type tree-sitter >/dev/null 2>&1 || cargo install tree-sitter-cli || (echo 'require rust' && exit)

echo installed cargo and tree-sitter

cd || exit
git clone https://github.com/helix-editor/helix
cd ~/helix || exit
cargo install --path helix-term

rm -r ~/.config/helix/runtime
ln -s -f ~/helix/runtime/ ~/.config/helix/runtime

hx -g fetch
hx -g build
