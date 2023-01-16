#!/bin/zsh

test -e "$HOME"/.asdf/asdf.sh && . "$HOME"/.asdf/asdf.sh
test -d "$HOME"/.asdf/completions && fpath=("$HOME"/.asdf/completions $fpath)

test -e "$HOME"/.cargo/env && . "$HOME/.cargo/env"

shell_executed=$(echo $0 | sed -e 's/-//g')
SHELL=$(which $shell_executed)
export SHELL

COLORTERM=truecolor
export COLORTERM

chpwd() {
	exa -a --icons || ls -a
}

source ~/dotfiles/static/script/exist.bash || exit

exist brew && PATH=$(brew --prefix)/bin:$PATH
export PATH

if exist nvim; then
	EDITOR="$(which nvim)"
  alias vi="nvim"
  alias vim="nvim"
  alias v="nvim"
else
	EDITOR="$(which vi)"
  alias nvim="vi"
  alias v="vi"
fi
export EDITOR

exist pbcopy && alias CLIPBOARD_COMMAND='pbcopy'

exist starship && eval "$(starship init $shell_executed)"
exist zoxide && eval "$(zoxide init $shell_executed)"

