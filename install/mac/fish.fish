rm -r ~/.config/fish
ln -v -s ~/dotfiles/.config/fish ~/.config/fish

echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
set -x SHELL $(which fish)

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
cat ~/dotfiles/.config/fish/fish_plugins.backup | fisher install

fish_vi_key_bindings
