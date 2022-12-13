#!/bin/bash
OS=$(uname)

if test "$OS" = Darwin; then
	chmod -R go-w "$(brew --prefix)"/share
	echo ln -s ~/Library/"Mobile Documents"/"com~apple~CloudDocs" ~/iCloud
fi

mkdir -p ~/.config

make_link() {
	to=${1}
	from=${2}

  if test -L "$from"; then
    unlink "$from"
	elif test -d "$from"; then
    rm -r -f "$from"
	elif test -e "$from"; then
		rm "$from"
	fi
	ln -v -s "$to" "$from"
}

# シンボリックリンクの生成と設定
## ディレクトリ
### ssh
if ! test -e ~/.ssh/config; then
	cd || exit
	sh ~/dotfiles/setup/ssh.sh
fi
### Git
cd || exit
test -d ~/git_config || git clone git@github.com:totto2727/git_config.git
make_link ~/git_config ~/.config/git

### nvim
make_link ~/dotfiles/.config/nvim ~/.config/nvim

### helix
make_link ~/dotfiles/.config/helix ~/.config/helix

### gitui
mkdir -p ~/.config/gitui
make_link ~/dotfiles/.config/gitui/key_bindings.ron ~/.config/gitui/key_bindings.ron

### VSCode
# ln -v -s ~/dotfiles/vscode/settings.json ~/Library/"Application Support"/Code/User/settings.json
# sh ~/dotfiles/vscode/extention.sh

## ファイル
### profile
make_link ~/dotfiles/.profile ~/.profile

### bash
make_link ~/dotfiles/.bashrc ~/.bashrc

### zsh
make_link ~/dotfiles/.zshrc ~/.zshrc

### textlint
make_link ~/dotfiles/.textlintrc ~/.textlintrc

### Tmux
make_link ~/dotfiles/.tmux.conf ~/.tmux.conf

### Starship
make_link ~/dotfiles/.config/starship.toml ~/.config/starship.toml

## Mac
if test "$OS" = Darwin; then
	### Karabiner
	make_link ~/dotfiles/.config/karabiner ~/.config/karabiner
elif test "$OS" = Linux; then
	### .inputrc
	make_link ~/dotfiles/.inputrc ~/.inputrc
fi
