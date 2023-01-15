#!/bin/bash

source ~/dotfiles/static/script/make_link.bash
source ~/dotfiles/static/script/exist.bash

target=asdf
exist "$target" && echo "$target" is installed && exit 0

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
make_link ~/dotfiles/.tool-versions ~/.tool-versions
make_link ~/dotfiles/.default-golang-pkgs ~/.default-golang-pkgs
