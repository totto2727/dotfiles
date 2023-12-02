#!/bin/bash

echo -e "\n""change default shell"

source ~/dotfiles/static/script/exist.bash
exist brew || (echo brew is not installed && exit 1)

sudo cp ~/dotfiles/install/mac/zprofile /etc/zprofile
sudo chmod 444 /etc/zprofile
sudo chown root:wheel /etc/zprofile

bash_path=$(brew --prefix)/bin/bash
bash_exist=$(grep -q "$bash_path" /etc/shells)
test "$bash_exist" || (echo "$bash_path" | sudo tee -a /etc/shells)

zsh_path=$(brew --prefix)/bin/zsh
zsh_exist=$(grep -q "$zsh_path" /etc/shells)
test "$zsh_exist" || (echo "$zsh_path" | sudo tee -a /etc/shells)

chsh -s "$zsh_path"
