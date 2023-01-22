#!/bin/bash

#source ~/dotfiles/static/script/make_link.bash
source ~/dotfiles/static/script/exist.bash

target=zsh
exist "$target" && echo "$target" is installed && exit 0

grep -q "$(which zsh)" /etc/shells || (echo "$(which zsh)" | sudo tee -a /etc/shells)

sudo chsh -s "$(which zsh)"
chsh -s "$(which zsh)"
