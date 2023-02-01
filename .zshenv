#!/bin/zsh

# echo .zshenv

SHELL=$(which zsh)
export SHELL

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

case ${OSTYPE} in
  darwin*)
    PATH=/opt/homebrew/bin:$PATH
    ;;
  linux*)
    PATH=$HOME/.local/bin:/snap/bin:$HOME/bin:$PATH
    ;;
esac
export PATH

test -d "$HOME"/.asdf && . $(brew --prefix asdf)/libexec/asdf.sh
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

