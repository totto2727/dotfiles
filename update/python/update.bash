#!/bin/bash

source ~/dotfiles/static/script/exist.bash

target=pip
exist "$target" || (echo "$target" is not installed && exit 1)

pip install --upgrade pip
pip install --upgrade -r ~/dotfiles/static/package/requirements.txt

conda update --all
