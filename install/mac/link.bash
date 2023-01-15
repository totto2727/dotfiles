#!/bin/bash

chmod -R go-w "$(brew --prefix)"/share
echo ln -s ~/Library/"Mobile Documents"/"com~apple~CloudDocs" ~/iCloud

mkdir -p ~/.config

source ~/dotfiles/static/script/make_link.bash

# シンボリックリンクの生成と設定
## ディレクトリ
### nvim
make_link ~/dotfiles/.config/nvim ~/.config/nvim

### helix
make_link ~/dotfiles/.config/helix ~/.config/helix

### gitui
mkdir -p ~/.config/gitui
make_link ~/dotfiles/.config/gitui/key_bindings.ron ~/.config/gitui/key_bindings.ron

### Karabiner
make_link ~/dotfiles/.config/karabiner ~/.config/karabiner

## ファイル
### zsh
make_link ~/dotfiles/.zshrc ~/.zshrc

### asdf
make_link ~/dotfiles/.tool-versions ~/.tool-versions

#### asdf-golang
make_link ~/dotfiles/.default-golang-pkgs ~/.default-golang-pkgs

### textlint
# make_link ~/dotfiles/.textlintrc ~/.textlintrc

### Tmux
make_link ~/dotfiles/.tmux.conf ~/.tmux.conf

### Starship
make_link ~/dotfiles/.config/starship.toml ~/.config/starship.toml

