#!/bin/bash

source ~/dotfiles/static/script/exist.bash

echo -e "\n""cargo install"
exist cargo && cargo install cargo-update

echo -e "\n""pip install"
exist pip && pip install pip-review
exist pip && pip install -r ~/dotfiles/static/package/requirements.txt

