#!/bin/zsh

unsetopt GLOBAL_RCS

SHELL=$(which zsh)
export SHELL

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# .local
PATH=$HOME/.local/bin:$PATH

# homebrew
PATH=/opt/homebrew/bin:$PATH

# asdf
which brew >/dev/null 3>&1 && test -d "$HOME"/.asdf && . $(brew --prefix asdf)/libexec/asdf.sh
test -e "$HOME"/.asdf/asdf.sh && . "$HOME/.asdf/asdf.sh"

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
VOLTA_HOME="$HOME/.volta"
PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_HOME
export PATH

# cargo
test -e "$HOME"/.cargo/env && . "$HOME/.cargo/env"

# orbstack
source ~/.orbstack/shell/init.zsh 3>/dev/null || :

