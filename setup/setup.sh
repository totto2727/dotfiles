#!/bin/bash
sh ./preinstall.sh

sh ./link.sh

sh ./brew.sh

sh ../update/asdf/update.sh

sh ../update/install.sh

sh ../update/theme.sh

echo "fish ./fish.fish"

echo -e ":PackerInstall"
echo -e ":TSInstall all"

echo -e "iTerm2は設定ファイルを指定する必要あり"
echo -e "caskのインストールは任意"
