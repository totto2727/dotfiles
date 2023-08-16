#!/bin/bash

source ~/dotfiles/static/script/exist.bash

brew bundle --file=~/dotfiles/static/package/Brewfile.brew
brew update
brew upgrade

brew bundle dump -f --file "$HOME/dotfiles/static/package/Brewfile"
cat ~/dotfiles/static/package/Brewfile | rg -e '^(brew|tap)' | rg --pcre2 '^(?!.*cask).*$' >~/dotfiles/static/package/Brewfile.brew
cat ~/dotfiles/static/package/Brewfile | rg --pcre2 '(^cask)|(^tap (?=.*cask))' >~/dotfiles/static/package/Brewfile.cask
cat ~/dotfiles/static/package/Brewfile.cask | rg --pcre2 'font' >~/dotfiles/static/package/Brewfile.cask.font

sudo cp ~/dotfiles/install/mac/zprofile /etc/zprofile

test -e ~/dotfiles/install/install.bash && bash ~/dotfiles/install/install.bash

exist rustup && rustup update
exist cargo && cargo install-update --all

# exist go &&

exist pip3 && pip3 install --upgrade pip
exist pip3 && pip3 freeze | xargs pip install -U
exist pip3 && pip3 freeze > ~/dotfiles/static/package/requirements.txt

test -e ~/dotfiles/update/link.bash && bash ~/dotfiles/update/link.bash
test -e ~/dotfiles/update/theme.bash && bash ~/dotfiles/update/theme.bash

exist gh && gh extension upgrade --all
