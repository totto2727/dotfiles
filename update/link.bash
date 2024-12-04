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
test -d ~/git_config && make_link ~/git_config/config ~/.gitconfig

### git_config
echo -e "\n""SSH config link"
mkdir -p ~/.ssh
test -d ~/ssh_config && make_link ~/dotfiles/ssh_config/config ~/.config/config
test -d ~/ssh_config && make_link ~/dotfiles/ssh_config/.git ~/.config/.git
test -d ~/ssh_config && make_link ~/dotfiles/ssh_config/.gitignore ~/.config/.gitignore

### helix
echo -e "\n""helix config link"
exist helix && make_link ~/dotfiles/.config/helix ~/.config/helix

### Bat
echo -e "\n""bat config link"
exist bat && make_link ~/dotfiles/.config/bat ~/.config/bat

### Alacritty
echo -e "\n""alacritty config link"
exist bat && make_link ~/dotfiles/.config/alacritty ~/.config/alacritty

### Lazygit
echo -e "\n""lazygit config link"
exist bat && make_link ~/dotfiles/.config/lazygit ~/.config/lazygit

if [[ $(uname) = "Darwin" ]]; then
	USERNAME=$(whoami)
	FILEPATH="/Users/${USERNAME}/Library/Application Support/lazygit/config.yml"
	test -e "${FILEPATH}" && chown "$USERNAME" "${FILEPATH}"
fi

### mise
echo -e "\n""mise config link"
exist bat && make_link ~/dotfiles/.config/mise ~/.config/mise

## ファイル
### chrome
test -e ~/.local/bin/chrome || make_link ~/dotfiles/chrome ~/.local/bin/chrome

### docker-credential-gh
test -e ~/.local/bin/docker-credential-gh || make_link ~/dotfiles/.local/bin/docker-credential-gh ~/.local/bin/docker-credential-gh

## zsh
echo -e "\n""zsh config link"
exist zsh && make_link ~/dotfiles/.zshrc ~/.zshrc
exist zsh && make_link ~/dotfiles/.zprofile ~/.zprofile
exist zsh && make_link ~/dotfiles/.zshenv ~/.zshenv

### Starship
echo -e "\n""starship config link"
exist starship && make_link ~/dotfiles/.config/starship.toml ~/.config/starship.toml
