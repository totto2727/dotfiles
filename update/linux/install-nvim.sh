#!/bin/bash
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl
type cargo >/dev/null 2>&1 && cargo install tree-sitter-cli || echo 'require rust' && exit

cd || exit
git clone https://github.com/neovim/neovim
cd neovim || exit

make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install

mkdir -p ~/.local/bin
ln -s -f ~/neovim/bin/nvim ~/.local/bin/nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

sudo apt install fzf
