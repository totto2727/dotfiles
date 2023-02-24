#!/bin/bash

# Android Studioインストール時にコマンドラインツールを追加する
# インストール後であればSDK ManagerのSDK Toolsからインストール可能

# パスはバージョンアップ毎に適宜修正
# 以下を.zshrcに追加
# STUDIO_HOME="Android Studioのパス"
# if test -d $STUDIO_HOME; then
#   JAVA_HOME=$STUDIO_HOME/Contents/jre/Contents/Home
#   export JAVA_HOME
#   PATH=$JAVA_HOME/bin:$HOME/.local/bin:$PATH
#   export PATH
# fi

# $STUDIO_HOME/Contents
if ! "$STUDIO_HOME"; then
	# shellcheck disable=2016
	echo 'Not Fonund $STUDIO_HOME'
fi

# studioコマンドが実行できない場合コメントアウト
# mkdir -p ~/.local/bin
# ln -s $STUDIO_HOME/Contents/MacOS/studio ~/.local/bin

which flutter && flutter config --android-studio-dir "$STUDIO_HOME"
sudo ln -s "$STUDIO_HOME/Contents/jbr" "$STUDIO_HOME/Contents/jre"
export JAVA_HOME="$STUDIO_HOME/Contents/jre/Contents/Home"

flutter doctor --android-licenses
