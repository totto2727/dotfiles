# https://github.com/basecamp/omakub/blob/master/install/terminal/app-neovim.sh

git clone https://github.com/LazyVim/starter ~/.config/nvim

sed -i 's/checker = { enabled = true }/checker = { enabled = true, notify = false }/g' ~/.config/nvim/lua/config/lazy.lua

mkdir -p $PWD/lua/config
mkdir -p $PWD/lua/plugins
mkdir -p $PWD/plugin/after

curl -L https://raw.githubusercontent.com/basecamp/omakub/refs/heads/master/configs/neovim/transparency.lua > ~/.config/nvim/plugin/after/transparency.lua
curl -L https://raw.githubusercontent.com/basecamp/omakub/refs/heads/master/themes/tokyo-night/neovim.lua > ~/.config/nvim/lua/plugins/theme.lua
curl -L https://raw.githubusercontent.com/basecamp/omakub/refs/heads/master/configs/neovim/lazyvim.json > ~/.config/nvim/lazyvim.json
