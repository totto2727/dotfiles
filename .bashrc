#!/bin/bash
[ "$PS1" = "" ] && return

if [ "$(uname)" = 'Linux' ]; then
	. "$HOME/dotfiles/.ubunturc"
fi

# Env

## asdf
test -e "$HOME"/.asdf/asdf.sh && . "$HOME"/.asdf/asdf.sh
test -e "$HOME"/.asdf/completions/asdf.bash && . "$HOME"/.asdf/completions/asdf.bash

## Shell
SHELL=$(which bash)
export SHELL
COLORTERM=truecolor
export COLORTERM

## Editor
if type nvim >/dev/null 2>&1; then
	EDITOR="$(which nvim)"
	alias vi="nvim"
	alias vim="nvim"
else
	EDITOR="$(which vi)"
	alias nvim="vi"
fi
export EDITOR

## SSH Agent
agent="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
	case $SSH_AUTH_SOCK in
	/tmp/*/agent.[0-9]*)
		ln -snf "$SSH_AUTH_SOCK" "$agent" && export SSH_AUTH_SOCK=$agent
		;;
	esac
elif [ -S "$agent" ]; then
	export SSH_AUTH_SOCK=$agent
else
	echo "no ssh-agent"
fi

# init
## Starship
type starship >/dev/null 2>&1 && eval "$(starship init bash)"

## Z
if type zoxide >/dev/null 2>&1; then
	eval "$(zoxide init bash)"
fi

# alias
# clipbooard
if type pbcopy >/dev/null 2>&1; then
	alias CLIPBOARD_COMMAND='pbcopy'
elif type xsel >/dev/null 2>&1; then
	alias CLIPBOARD_COMMAND='xsel --input --clipboard'
fi

alias glances='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host --network host -it nicolargo/glances:latest-full'
alias ta='tmux attach'
alias td='tmux detach'
alias generate_dotenv_template='npx gen-env-template'
alias bat='batcat'
alias fd="fdfind"
alias caddyrun='caddy start --config ~/dotfiles/static/quic/Caddyfile'

function tmux-popup() {
	width='80%'
	height='80%'
	session=$(tmux display-message -p -F "#{session_name}")
	if [[ "$session" == *"popup"* ]]; then
		tmux detach-client
	else
		tmux popup -d '#{pane_current_path}' -xC -yC -w"$width" -h"$height" -E "tmux attach -t popup || tmux new -s popup"
	fi
}
