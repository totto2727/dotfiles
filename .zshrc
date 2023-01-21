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

SHELL=$(which zsh)
export SHELL

COLORTERM=truecolor
export COLORTERM

autoload -Uz compinit && compinit
autoload -Uz colors && colors

bindkey -v
setopt nonomatch
setopt share_history
setopt histignorealldups
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

source ~/dotfiles/static/script/exist.bash || exit

exist brew && PATH=$(brew --prefix)/bin:$PATH
export PATH

if exist nvim; then
	EDITOR="$(which nvim)"
  alias v="nvim"
  alias vi="nvim"
  alias vim="nvim"
else
	EDITOR="$(which vi)"
  alias v="vi"
  alias nvim="vi"
fi
export EDITOR

exist hx && alias h="hx"

if exist exa; then
  alias l="exa -g --group-directories-first --icons"
  alias ll="l -al"
  alias lt="l -T"
  chpwd() {
    exa -a --icons
  }
else
  alias l="ls"
  alias ll="l -al"
  alias lt="tree"
  chpwd() {
    ls -a
  }
fi

if exist bat; then
  alias b="bat"
else
  alias b="cat"
fi

exist gitui && alias gui="gitui"

exist pbcopy && alias CLIPBOARD_COMMAND='pbcopy'
exist xsel && alias CLIPBOARD_COMMAND='xsel --input --clipboard'

exist starship && eval "$(starship init zsh)"
exist zoxide && eval "$(zoxide init zsh)"
