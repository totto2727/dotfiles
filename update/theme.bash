#!/bin/bash

curl https://raw.githubusercontent.com/aereal/vim-colors-japanesque/master/colors/japanesque.vim >~/dotfiles/.config/nvim/colors/japanesque.vim

if test -d ~/git_config; then
  echo -e "\n""git config theme"
  curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/delta/tokyonight_day.gitconfig >~/git_config/tokyonight_day.gitconfig
  curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/delta/tokyonight_moon.gitconfig >~/git_config/tokyonight_moon.gitconfig
  curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/delta/tokyonight_night.gitconfig >~/git_config/tokyonight_night.gitconfig
  curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/delta/tokyonight_storm.gitconfig >~/git_config/tokyonight_storm.gitconfig
fi

echo -e "\n""bat theme"
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_day.tmTheme >~/dotfiles/.config/bat/themes/tokyonight_day.tmTheme
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_moon.tmTheme >~/dotfiles/.config/bat/themes/tokyonight_moon.tmTheme
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme >~/dotfiles/.config/bat/themes/tokyonight_night.tmTheme
curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_storm.tmTheme >~/dotfiles/.config/bat/themes/tokyonight_storm.tmTheme
which bat && bat cache --build
