#!/bin/bash
if type "brew" >/dev/null 2>&1; then
	echo -e "\nbrew is installed" #コマンドが存在する時の処理

else
	echo -e "\nbrew is not installed" #コマンドが存在しないときの処理
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	OS=$(uname)
	if test "$OS" = Linux; then
		test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
		test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

	elif test "$OS" = Darwin; then
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi
fi
