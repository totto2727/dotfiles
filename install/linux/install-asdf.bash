#!/bin/bash

source ~/dotfiles/static/script/make_link.bash
source ~/dotfiles/static/script/exist.bash

target=asdf
exist "$target" && echo "$target" is installed && exit 0

