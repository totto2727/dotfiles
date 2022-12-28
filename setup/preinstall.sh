#!/bin/bash
if type "brew" >/dev/null 2>&1; then
	echo -e "\nbrew is installed" #コマンドが存在する時の処理

else
	echo -e "\nbrew is not installed" #コマンドが存在しないときの処理
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	eval "$(/opt/homebrew/bin/brew shellenv)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zshrc
fi

brew install git ansible
git clone git@github.com:totto2727/ansible_playbooks.git ~/ansible_playbooks
