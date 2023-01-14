#!/bin/bash
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
		if [ "$i" = "${1}" ]; then
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
	fi
done

asdf plugin update --all

asdf install
