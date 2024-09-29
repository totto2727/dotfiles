#!/bin/bash

source ~/dotfiles/static/script/exist.bash

echo -e "\n""mise update"
exist mise && mise install && mise upgrade

echo -e "\n""link update"
test -e ~/dotfiles/update/link.bash && bash ~/dotfiles/update/link.bash

echo -e "\n""theme update"
test -e ~/dotfiles/update/theme.bash && bash ~/dotfiles/update/theme.bash

echo -e "\n""gh extentions update"
exist gh && gh extension upgrade --all

echo -e "\n""neovim update"
echo -e ":PackerUpdate"
echo -e ":TSUpdate all"

