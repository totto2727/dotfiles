#!/bin/zsh

test -e "$HOME"/.asdf/asdf.sh && . "$HOME"/.asdf/asdf.sh
test -d "$HOME"/.asdf/completions && fpath=("$HOME"/.asdf/completions $fpath)

test -d "$HOME"/.cargo && . "$HOME/.cargo/env"

SHELL=$(which zsh)
export SHELL

COLORTERM=truecolor
export COLORTERM

if type nvim >/dev/null 2>&1; then
	EDITOR="$(which nvim)"
  alias vi="nvim"
  alias vim="nvim"
else
	EDITOR="$(which vi)"
  alias nvim="vi"
fi
export EDITOR

alias CLIPBOARD_COMMAND='pbcopy'

if type starship >/dev/null 2>&1; then
	eval "$(starship init zsh)"
fi

