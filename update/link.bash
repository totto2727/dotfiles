#!/bin/bash

if [[ $(uname) = "Darwin" ]]; then
  echo -e "\n""mac link"
	chmod -R go-w "$(brew --prefix)"/share
	test -e ~/iCloud || echo ln -s ~/Library/"Mobile Documents"/"com~apple~CloudDocs" ~/iCloud
fi

source ~/dotfiles/static/script/make_link.bash
source ~/dotfiles/static/script/exist.bash

# シンボリックリンクの生成と設定
## ディレクトリ

echo -e "\n""mkdir ~/.config"
mkdir -p ~/.config

### git_config
echo -e "\n""Git config link"
test -d ~/git_config && make_link ~/git_config ~/.config/git

### git_config
echo -e "\n""SSH config link"
mkdir -p ~/.ssh
test -d ~/ssh_config && make_link ~/dotfiles/ssh_config/config ~/.config/config
test -d ~/ssh_config && make_link ~/dotfiles/ssh_config/.git ~/.config/.git
test -d ~/ssh_config && make_link ~/dotfiles/ssh_config/.gitignore ~/.config/.gitignore

### nvim
echo -e "\n""neovim config link"
exist nvim && make_link ~/dotfiles/.config/nvim ~/.config/nvim

### helix
echo -e "\n""helix config link"
exist helix && make_link ~/dotfiles/.config/helix ~/.config/helix

### Bat
echo -e "\n""bat config link"
exist bat && make_link ~/dotfiles/.config/bat ~/.config/bat

### Alacritty
echo -e "\n""alacritty config link"
exist bat && make_link ~/dotfiles/.config/alacritty ~/.config/alacritty

### Pipewire
if [[ $(uname) = "Linux" ]]; then
  echo -e "\n""pipewire config link"
  exist bat && make_link ~/dotfiles/.config/pipwwire ~/.config/pipewire
fi

## ファイル
### gitui
echo -e "\n""gitui config link"
exist gitui && mkdir -p ~/.config/gitui
exist gitui && make_link ~/dotfiles/.config/gitui/key_bindings.ron ~/.config/gitui/key_bindings.ron

### zsh
echo -e "\n""zsh config link"
exist zsh && make_link ~/dotfiles/.zshrc ~/.zshrc
exist zsh && make_link ~/dotfiles/.zprofile ~/.zprofile
exist zsh && make_link ~/dotfiles/.zshenv ~/.zshenv

### Starship
echo -e "\n""starship config link"
exist starship && make_link ~/dotfiles/.config/starship.toml ~/.config/starship.toml

### SSH Agent
if [[ $(uname) = "Linux" ]]; then
  echo -e "\n""ssh-agent config link"
  mkdir -p ~/.config/systemd/user/
  make_link ~/dotfiles/.config/user/ssh-agent.service ~/.config/user/ssh-agent.service
fi

if [[ $(uname) = "Linux" ]]; then
  systemctl --user daemon-reload
  systemctl --user enable --now ssh-agent
fi
