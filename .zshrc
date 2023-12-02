#!/bin/zsh

test -e /etc/zshrc && . /etc/zshrc

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
exist ghr && source <(ghr shell bash)
exist ghr && source <(ghr shell bash --completion)

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
exist ghr && exist fzf && alias rep='ghr cd $(ghr list | fzf)'
exist ghr && exist fzf && exist code && alias repc='ghr open $(ghr list | fzf) code'

if exist git; then
  alias g="git"
  alias gs="git status"
  alias gb='git branch'
  alias gch="git checkout"
  alias gchb="git checkout -b"
  alias gmain="git checkout main"
  alias gmaster="git checkout master"
  alias gstaging="git checkout staging"
  alias gdevelopment="git checkout development"
  alias gdev="git checkout dev"
  alias gtotto="git checkout totto2727"
  alias gc="git commit"
  alias gca="git commit --amend"
  alias gpush="git push"
  alias gpushf="git push --force-with-lease --force-if-includes"
  alias gpull="git pull"
  alias gsync="git pull && git push"
  alias git-branch-sync="git fetch -p && git branch --merged | grep -v '*'| sed -e '/main/d' -e '/master/d' -e '/prod/d' -e '/production/d' -e '/staging/d' -e '/stg/d' -e '/develop/d' -e '/dev/d' -e '/remote/d' | xargs git branch -d"
fi

if exist gh; then
  alias gh-pr-create="gh pr create -a '@me'"
fi

exist pbcopy && alias CLIPBOARD_COMMAND='pbcopy'
exist xsel && alias CLIPBOARD_COMMAND='xsel --input --clipboard'

if exist keychain; then
  test -e $HOME/.ssh/id_ed25519 && keychain -q --nogui $HOME/.ssh/id_ed25519
  source $HOME/.keychain/$HOST-sh
fi

if exist volta; then
  alias vode="volta run node"
  alias vpm="volta run npm"
fi

# bun completions
if [ -s "/Users/h_tsuchida/.bun/_bun" ]; then
  && source "/Users/h_tsuchida/.bun/_bun"
fi

