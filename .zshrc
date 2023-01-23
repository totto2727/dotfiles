#!/bin/zsh

# echo .zshrc

test -d "$HOME"/.asdf/completions && fpath=("$HOME"/.asdf/completions $fpath)

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
else
  alias l="ls"
  alias ll="l -al"
  alias lt="tree"
fi
chpwd() {
  l
}

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
