#!/bin/bash

if [[ "$(uname)" == 'Darwin' ]]; then
	os='Mac'
elif [[ "$(expr substr "$(uname -s)" 1 5)" == 'Linux' ]]; then
	os='Linux'
elif [[ "$(expr substr "$(uname -s)" 1 10)" == 'MINGW32_NT' ]]; then
	os='Cygwin'
else
	echo "Your platform ($(uname -a)) is not supported."
	exit 1
fi

if [[ "$os" == "Mac" ]]; then
	chmod -R go-w "$(brew --prefix)"/share
	echo ln -s ~/Library/"Mobile Documents"/"com~apple~CloudDocs" ~/iCloud
fi

mkdir -p ~/.config

source ~/dotfiles/static/script/make_link.bash
source ~/dotfiles/static/script/exist.bash

# シンボリックリンクの生成と設定
## ディレクトリ
### git_config
test -d ~/git_config && make_link ~/git_config ~/.config/git

### git_config
mkdir -p ~/.ssh
test -d ~/ssh_config && make_link ~/dotfiles/ssh_config/config ~/.config/config
test -d ~/ssh_config && make_link ~/dotfiles/ssh_config/.git ~/.config/.git
test -d ~/ssh_config && make_link ~/dotfiles/ssh_config/.gitignore ~/.config/.gitignore

### nvim
exist nvim && make_link ~/dotfiles/.config/nvim ~/.config/nvim

### helix
exist helix && make_link ~/dotfiles/.config/helix ~/.config/helix

### gitui
exist gitui && mkdir -p ~/.config/gitui
exist gitui && make_link ~/dotfiles/.config/gitui/key_bindings.ron ~/.config/gitui/key_bindings.ron
#
### Bat
exist bat && make_link ~/dotfiles/.config/bat ~/.config/bat

### Karabiner
if [[ "$os" == "Mac" ]]; then
	make_link ~/dotfiles/.config/karabiner ~/.config/karabiner
fi

## ファイル
### zsh
exist zsh && make_link ~/dotfiles/.zshrc ~/.zshrc
exist zsh && make_link ~/dotfiles/.zprofile ~/.zprofile
exist zsh && make_link ~/dotfiles/.zshenv ~/.zshenv

make_link ~/dotfiles/.inputrc ~/.inputrc
# if [[ "$os" == "Linux" ]]; then
#	make_link ~/dotfiles/.bashrc ~/.bashrc
#	make_link ~/dotfiles/.profile ~/.profile
# fi

### asdf
exist asdf && make_link ~/dotfiles/.tool-versions ~/.tool-versions
exist asdf && make_link ~/dotfiles/.default-golang-pkgs ~/.default-golang-pkgs
exist asdf && make_link ~/dotfiles/.default-npm-packages ~/.default-npm-packages

### textlint
# make_link ~/dotfiles/.textlintrc ~/.textlintrc

### Tmux
exist tmux && make_link ~/dotfiles/.tmux.conf ~/.tmux.conf

### Starship
exist starship && make_link ~/dotfiles/.config/starship.toml ~/.config/starship.toml
