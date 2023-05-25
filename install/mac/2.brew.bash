#!/bin/bash

chmod -R go-w "$(brew --prefix)"/share

brew bundle --file=~/dotfiles/static/package/Brewfile.brew

rustup-init

open "$(brew --prefix sfmono-square)/share/fonts"

echo "シェルを再起動してください"
