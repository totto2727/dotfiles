#!/bin/zsh

test -e "$HOME"/.asdf/asdf.sh && . "$HOME"/.asdf/asdf.sh
test -d "$HOME"/.asdf/completions && fpath=("$HOME"/.asdf/completions $fpath)

test -e "$HOME"/.cargo/env && . "$HOME/.cargo/env"

if test -e "$(asdf where python)/bin/conda"; then 
  __conda_setup="$("$(asdf which conda)" 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "$(asdf where python)/etc/profile.d/conda.sh" ]; then
      . "$(asdf where python)/etc/profile.d/conda.sh"
    else
      export PATH="$(asdf where python)/bin:$PATH"
    fi
  fi
fi
unset __conda_setup

shell_executed=$(echo $0 | sed -e 's/-//g')
if [[ $shell_executed = "zsh"  ]] || [[ $shell_executed = ".zshrc" ]]; then
  shell_executed="zsh"
else
  shell_executed="bash"
fi
SHELL=$(which $shell_executed)
export SHELL

COLORTERM=truecolor
export COLORTERM

chpwd() {
	exa -a --icons || ls -a
}

if [[ $shell_executed = "zsh" ]]; then
  autoload -Uz compinit && compinit
fi

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

if exist hx; then
  alias h="hx"
fi

if exist exa; then
  alias ll="exa -al --icons"
  alias l="exa --icons"
else
  alias ll="ls -al"
  alias l="ls"
fi

if exist bat; then
  alias b="bat"
else
  alias b="cat"
fi

exist pbcopy && alias CLIPBOARD_COMMAND='pbcopy'

exist starship && eval "$(starship init $shell_executed)"
exist zoxide && eval "$(zoxide init $shell_executed)"
