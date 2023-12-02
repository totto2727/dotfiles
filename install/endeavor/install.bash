#!/bin/bash

source ~/dotfiles/static/script/exist.bash

echo -e "\n""configs clone"

test -d ~/git_config || git clone git@github.com:totto2727/git_config.git ~/git_config
test -d ~/ssh_config || git clone git@github.com:totto2727/ssh_config.git ~/ssh_config

echo -e "\n""yay install"

yay
yay -S --needed - < ~/dotfiles/static/package/yay-endeavor-private.txt

echo -e "\n""rust install"

rustup default stable

test -e ~/dotfiles/install/install.bash && bash ~/dotfiles/install/install.bash

echo -e "\n""link create"

test -e ~/dotfiles/update/link.bash && bash ~/dotfiles/update/link.bash

echo -e "\n""theme install"

test -e ~/dotfiles/update/theme.bash && bash ~/dotfiles/update/theme.bash

echo -e "\n""gh extentions install"

exist gh && gh extension install seachicken/gh-poi

echo -e "\n""neovim install"

echo -e ":PackerInstall"
echo -e ":TSInstall all"
