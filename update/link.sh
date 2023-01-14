#!/bin/bash
mkdir -p ~/.config

make_link() {
	to=${1}
	from=${2}

	if test -L "$from"; then
		unlink "$from"
	elif test -d "$from"; then
		rm -r -f "$from"
	elif test -e "$from"; then
		rm "$from"
	fi
	ln -v -s "$to" "$from"
}
