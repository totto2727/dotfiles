#!/bin/bash

chmod -R go-w "$(brew --prefix)"/share

brew bundle --file=~/dotfiles/static/package/Brewfile.brew

open "$(brew --prefix sfmono-square)/share/fonts"
