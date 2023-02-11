#!/bin/bash

source ~/dotfiles/static/script/exist.bash

target=npm
exist "$target" || (echo "$target" is not installed && exit 1)

echo "$(npx npm-check-updates -g) && bash ~/dotfiles/update/npm/update-list.bash"
