#!/bin/zsh
. ~/dotfiles/.shellrc

SHELL=$(which zsh)
export SHELL

test BREW_INSTALLED && test -d "$(brew --prefix asdf)" && fpath=("$(brew --prefix asdf)"/completions $fpath)
test -d "$HOME"/.asdf/completions && fpath=("$HOME"/.asdf/completions $fpath)

if type starship >/dev/null 2>&1; then
	eval "$(starship init zsh)"
fi

