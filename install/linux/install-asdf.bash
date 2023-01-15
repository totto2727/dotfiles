#!/bin/bash

source ~/dotfiles/static/script/make_link.bash
source ~/dotfiles/static/script/exist.bash

exist asdf && echo asdf was installed && exit 0

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
make_link ~/dotfiles/.tool-versions
