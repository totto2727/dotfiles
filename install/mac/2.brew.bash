#!/bin/bash

echo -e "\n""brew bundle"

chmod -R go-w "$(brew --prefix)"/share

brew bundle --file=~/dotfiles/static/package/Brewfile.brew

echo -e "\n""rust install"
rustup-init

echo -e "\n""font install"
fd -d 1 --type f . "$(brew --prefix sfmono-square)/share/fonts" | xargs open

echo "シェルを再起動してください"
