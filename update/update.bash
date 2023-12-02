#!/bin/bash

source ~/dotfiles/static/script/exist.bash

echo -e "\n""rust update"
exist rustup && rustup update
exist cargo && cargo install cargo-update
exist cargo && cargo install-update --all

echo -e "\n""pip update"
exist pip && pip install -r ~/dotfiles/static/package/requirements.txt
exist pip && pip install pip-review
exist pip && pip install --upgrade pip
exist pip && pip-review --auto
exist pip && pip list --format=freeze > ~/dotfiles/static/package/requirements.txt

echo -e "\n""link update"
test -e ~/dotfiles/update/link.bash && bash ~/dotfiles/update/link.bash

echo -e "\n""theme update"
test -e ~/dotfiles/update/theme.bash && bash ~/dotfiles/update/theme.bash

echo -e "\n""gh extentions update"
exist gh && gh extension upgrade --all

echo -e "\n""neovim update"
echo -e ":PackerUpdate"
echo -e ":TSUpdate all"

