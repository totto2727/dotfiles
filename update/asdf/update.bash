#!/bin/bash

source ~/dotfiles/static/script/exist.bash

target=asdf
exist "$target" || (echo "$target" is not installed && exit 1)

packages=(
	nodejs
	python
	golang
)

is_installed() {
	local i
	local p
	p=$(asdf plugin list)
	for i in "${p[@]}"; do
		if [[ "$i" == "${1}" ]]; then
			return 0
		fi
	done
	return 1
}

for package in "${packages[@]}"; do
	if is_installed "$package"; then
		echo "${package} installed"
	else
		asdf plugin add "$package"
		asdf plugin update "$package"
		asdf install "$package"
	fi
done
