#!/bin/zsh

test -e /etc/zshrc && . /etc/zshrc
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
bindkey "^?" backward-delete-char

source ~/dotfiles/static/script/exist.bash || exit

exist starship && eval "$(starship init zsh)"
exist zoxide && eval "$(zoxide init zsh)"

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
  alias l="exa --group-directories-first --icons --ignore-glob='.DS_Store'"
  alias ll="l -alg"
  alias lt="l -T"
else
  alias l="ls"
  alias ll="l -al"
  alias lt="tree"
fi
chpwd() {
  l -a
}

if exist bat; then
  alias b="bat"
else
  alias b="cat"
fi

exist gitui && alias gui="gitui"
if exist git; then
  alias g="git"
  alias gs="git status"
  alias gb='git branch'
  alias gch="git checkout"
  alias gchb="git checkout -b"
  alias gmain="git checkout main"
  alias gtotto="git checkout totto2727"
  alias gc="git commit"
  alias gamend="git commit --amend"
  alias git-branch-sync="git fetch -p && git branch --merged | grep -v '*'| sed '/main/d' | sed 'remote/d' | xargs git branch -d"
fi

exist pbcopy && alias CLIPBOARD_COMMAND='pbcopy'
exist xsel && alias CLIPBOARD_COMMAND='xsel --input --clipboard'

if exist keychain; then
  test -e $HOME/.ssh/id_ed25519 && keychain -q --nogui $HOME/.ssh/id_ed25519
  source $HOME/.keychain/$HOST-sh
fi
