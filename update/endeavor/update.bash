#!/bin/bash

source ~/dotfiles/static/script/exist.bash

echo -e "\n""yay update"
yay

echo -e "\n""other update"
test -e ~/dotfiles/update/update.bash && bash ~/dotfiles/update/update.bash

