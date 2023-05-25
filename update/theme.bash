#!/bin/bash

curl https://raw.githubusercontent.com/aereal/vim-colors-japanesque/master/colors/japanesque.vim >~/dotfiles/.config/nvim/colors/japanesque.vim

if test -d ~/git_config; then
	curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/delta/tokyonight_day.gitconfig >~/git_config/tokyonight_day.gitconfig
	curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/delta/tokyonight_moon.gitconfig >~/git_config/tokyonight_moon.gitconfig
	curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/delta/tokyonight_night.gitconfig >~/git_config/tokyonight_night.gitconfig
	curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/delta/tokyonight_storm.gitconfig >~/git_config/tokyonight_storm.gitconfig
fi

curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/iterm/tokyonight_day.itermcolors >~/dotfiles/.config/iterm/tokyonight_day.itermcolors
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/iterm/tokyonight_moon.itermcolors >~/dotfiles/.config/iterm/tokyonight_moon.itermcolors
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/iterm/tokyonight_night.itermcolors >~/dotfiles/.config/iterm/tokyonight_night.itermcolors
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/iterm/tokyonight_storm.itermcolors >~/dotfiles/.config/iterm/tokyonight_storm.itermcolors

mkdir -p ~/dotfiles/static/theme
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/tmux/tokyonight_day.tmux >~/dotfiles/static/theme/tokyonight_day.tmux
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/tmux/tokyonight_moon.tmux >~/dotfiles/static/theme/tokyonight_moon.tmux
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/tmux/tokyonight_night.tmux >~/dotfiles/static/theme/tokyonight_night.tmux
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/tmux/tokyonight_storm.tmux >~/dotfiles/static/theme/tokyonight_storm.tmux

curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_day.tmTheme >~/dotfiles/.config/bat/themes/tokyonight_day.tmTheme
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_moon.tmTheme >~/dotfiles/.config/bat/themes/tokyonight_moon.tmTheme
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme >~/dotfiles/.config/bat/themes/tokyonight_night.tmTheme
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_storm.tmTheme >~/dotfiles/.config/bat/themes/tokyonight_storm.tmTheme
which bat && bat cache --build
