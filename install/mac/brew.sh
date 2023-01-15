#!/bin/bash
if test "$(uname)" = Darwin; then
	chmod -R go-w "$(brew --prefix)"/share
fi

brew bundle --file=~/dotfiles/brew/Brewfile.brew

open "$(brew --prefix sfmono-square)/share/fonts"
