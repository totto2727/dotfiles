#!/bin/bash

if [[ "$os" == "Mac" ]]; then
	chmod -R go-w "$(brew --prefix)"/share
	test -e ~/iCloud || echo ln -s ~/Library/"Mobile Documents"/"com~apple~CloudDocs" ~/iCloud
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
make_link ~/dotfiles/.config/karabiner ~/.config/karabiner

## ファイル
### zsh
exist zsh && make_link ~/dotfiles/.zshrc ~/.zshrc
exist zsh && make_link ~/dotfiles/.zprofile ~/.zprofile
exist zsh && make_link ~/dotfiles/.zshenv ~/.zshenv

make_link ~/dotfiles/.inputrc ~/.inputrc

### asdf
exist asdf && make_link ~/dotfiles/.tool-versions ~/.tool-versions

### textlint
# make_link ~/dotfiles/.textlintrc ~/.textlintrc

### Tmux
exist tmux && make_link ~/dotfiles/.tmux.conf ~/.tmux.conf

### Starship
exist starship && make_link ~/dotfiles/.config/starship.toml ~/.config/starship.toml
