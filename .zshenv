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

# mise
if type mise > /dev/null; then
  eval "$(mise activate zsh)"
  export PATH="$HOME/.local/share/mise/shims:$PATH"
fi

# cargo
if [ -e "$HOME/.cargo/env" ]; then
. "$HOME/.cargo/env"
fi

# orbstack
if [ -e "$HOME/.orbstack/shell/init.zsh" ]; then
  source "$HOME/.orbstack/shell/init.zsh" 3>/dev/null || :
fi

# postgres utils
if [ -d "/opt/homebrew/opt/libpq/bin" ]; then
  PATH="/opt/homebrew/opt/libpq/bin:$PATH"
  export PATH
fi

export GPG_TTY=$(tty)
