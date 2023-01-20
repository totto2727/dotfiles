#!/bin/bash
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# asdf
test -e "$HOME"/.asdf/asdf.sh && . "$HOME"/.asdf/asdf.sh

# anaconda
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

# rust
test -e "$HOME"/.cargo/env && . "$HOME/.cargo/env"

# Last
# if running bash
if [ "$BASH_VERSION" != "" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi
