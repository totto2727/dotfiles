#!/bin/bash

# 事前に鍵を生成してgithubに登録

if type "brew" >/dev/null 2>&1; then
	echo -e "\nbrew is installed" #コマンドが存在する時の処理

else
	echo -e "\nbrew is not installed" #コマンドが存在しないときの処理
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install git
git clone git@github.com/totto2727-org/dotfiles ~/dotfiles
