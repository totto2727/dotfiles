#!/bin/zsh

if [ $(uname) = "Darwin" ]; then
  unsetopt GLOBAL_RCS
fi

SHELL=$(which zsh)
export SHELL

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# .local
PATH="$HOME/.local/bin:$PATH"

# homebrew
if [ -d /opt/homebrew/bin ]; then
  PATH="/opt/homebrew/bin:$PATH"
  PATH="/opt/homebrew/sbin:$PATH"
fi

# go
if type go > /dev/null; then
  GOPATH="$(go env GOPATH)"
  GOBIN="${GOPATH}/bin"
  PATH="${GOBIN}:${PATH}"
  export GOPATH
  export GOBIN
  export PATH
fi

# volta
if [ -d "$HOME/.volta" ]; then
  VOLTA_HOME="$HOME/.volta"
  PATH="$VOLTA_HOME/bin:$PATH"
  export VOLTA_HOME
  export PATH
  export VOLTA_FEATURE_PNPM=1
fi

# bun
if [ -d "$HOME/.bun" ]; then
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# cargo
if [ -e "$HOME/.cargo/env" ]; then
. "$HOME/.cargo/env"
fi

# orbstack
if [ -e "$HOME/.orbstack/shell/init.zsh" ]; then
  source "$HOME/.orbstack/shell/init.zsh" 3>/dev/null || :
fi

export GPG_TTY=$(tty)
