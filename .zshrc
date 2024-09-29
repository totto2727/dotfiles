#!/bin/zsh

# グローバルなzshrcのロード
test -e /etc/zshrc && . /etc/zshrc

# 色関係の設定
COLORTERM=truecolor
export COLORTERM
autoload -Uz colors && colors

# 補完の有効化
autoload -Uz compinit && compinit

# 入力はEmacsモード
bindkey -e 

# 基本的な設定
setopt nonomatch
setopt share_history
setopt histignorealldups
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# 誤りの自動訂正
# 邪魔になることが多いので無効化
# setopt correct
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# パターンを用いた履歴検索の有効
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# 上下キーでいい感じに入力補完してくれる
# https://zenn.dev/naoki_oshiumi/articles/c7a9a727b3e784
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "^?" backward-delete-char

source ~/dotfiles/static/script/exist.bash || exit

# ロードが必要なコマンド
exist starship && eval "$(starship init zsh)"
exist zoxide && eval "$(zoxide init zsh)"
exist ghr && source <(ghr shell bash)
exist ghr && source <(ghr shell bash --completion)

# PATHの表示
alias path-list='echo "$PATH" | sd ":" "\n"'

# Vim関係のエイリアス
if exist nvim; then
  EDITOR="$(which nvim)"
  alias VI="nvim"
elif exist vim; then
  EDITOR="$(which vim)"
  alias VI="vim"
else
  EDITOR="$(which vi)"
  alias VI="vi"
fi
export EDITOR

# Helixの有効化
exist hx && alias HX="hx"

# lsコマンドのエイリアス
if exist eza; then
  alias l="eza --group-directories-first --icons --ignore-glob='.DS_Store'"
  alias ll="l -alg"
  alias lt="l -T"
else
  alias l="ls"
  alias ll="l -al"
  alias lt="tree"
fi
## 遷移時のディレクトリ内容表示
chpwd() {
  l -a
}

# catコマンドのエイリアス
if exist bat; then
  alias C="bat"
else
  alias C="cat"
fi

# Git CUIのエイリアス
exist gitui && alias GUI="gitui"
exist ghr && exist fzf && alias REP='ghr cd $(ghr list | fzf)'
exist ghr && exist fzf && exist code && alias REPC='ghr open $(ghr list | fzf) code'

# Gitのエイリアス
if exist git; then
  alias GST="git status"
  alias GB='git branch'
  alias GSW="git switch"
  alias GSWC="git switch -c"
  alias GC="git commit"
  alias GCA="git commit --amend"
  alias GPUSH="git push"
  alias GPUSHF="git push --force-with-lease --force-if-includes"
  alias GR="git rebase"
  alias GRI="git rebase -i"
  alias GF="git fetch -p"
  alias GP="git pull -p"
  alias GSYNC="git pull && git push"
  alias g-branch-sync="git fetch -p && git branch --merged | grep -v '*'| sed -e '/main/d' -e '/master/d' -e '/prod/d' -e '/production/d' -e '/staging/d' -e '/stg/d' -e '/develop/d' -e '/dev/d' -e '/remote/d' | xargs git branch -d"
  alias g-pr-commit-log='(){git log --no-merges --pretty=format:"- **%s**%n" $1..$(git rev-parse --abbrev-ref @) | tac | sd "\n\n" "\n"}'
fi

# GitHub CLIのエイリアス
if exist gh; then
  alias gh-pr-create="gh pr create -a '@me'"
  alias gh-poi="gh poi"
fi

# コピー周り
exist pbcopy && alias CLIPBOARD_COMMAND='pbcopy'
exist xsel && alias CLIPBOARD_COMMAND='xsel --input --clipboard'

# LinuxのSSH周り
if [[ $(uname) = "Linux" ]]; then
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi

if exist keychain; then
  test -e $HOME/.ssh/id_ed25519 && keychain -q --nogui $HOME/.ssh/id_ed25519
  source $HOME/.keychain/$HOST-sh
fi

# bun completions
if [ -s "/Users/h_tsuchida/.bun/_bun" ]; then
  source "/Users/h_tsuchida/.bun/_bun"
fi

# deno completions
if [ -s "/Users/h_tsuchida/.deno/_deno" ]; then
  eval "$(deno completions zsh)"
fi
