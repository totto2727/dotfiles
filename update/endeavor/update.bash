#!/bin/bash

source ~/dotfiles/static/script/exist.bash

echo -e "\n""yay update"
yay
yay -Qeq > ~/dotfiles/static/package/yay-endeavor-private_.txt
diff -s ~/dotfiles/update/endeavor/yay-endeavor-private-default.txt ~/dotfiles/static/package/yay-endeavor-private_.txt | grep -E '^>' | perl -pe 's/^>\s//g' > ~/dotfiles/static/package/yay-endeavor-private.txt
rm ~/dotfiles/static/package/yay-endeavor-private_.txt

echo -e "\n""other update"
test -e ~/dotfiles/update/update.bash && bash ~/dotfiles/update/update.bash

