#!/bin/bash

source ~/dotfiles/static/script/exist.bash

target=npm
exist "$target" || (echo "$target" is not installed && exit 1)

npm list --location=global --depth=0 --json > ~/dotfiles/static/package/package.json
