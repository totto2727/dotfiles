#!/bin/bash

#source ~/dotfiles/static/script/make_link.bash
source ~/dotfiles/static/script/exist.bash

target=deno
exist "$target" && echo "$target" is installed && exit 0

if test "$(uname -i)" = 'x86_64'; then
	curl -fsSL https://deno.land/x/install/install.sh | sh
	mkdir -p ~/.local/bin
	ln -s -f ~/.deno/bin/deno ~/.local/bin/deno
elif test "$(uname -i)" = 'aarch64'; then
	exist "docker" || (echo "docker is required" && exit 0)
	DENO_VERSION=v1.27

	mkdir -p ~/deno
	git clone https://github.com/LukeChannings/deno-arm64 ~/deno-arm64
	cd ~/deno-arm64 || exit

	docker build -t deno-build-"$DENO_VERSION" --build-arg DENO_VERSION="$DENO_VERSION" --progress=plain --file ./Dockerfile.compile .
	DENO_BUILD_CONTAINER="$(docker create deno-build-"$DENO_VERSION" --name deno-build-"$DENO_VERSION")"

	rm ~/deno/deno
	docker cp "${DENO_BUILD_CONTAINER}:/deno/target/release/deno" ~/deno
	docker rm "$DENO_BUILD_CONTAINER"

	mkdir -p ~/.local/bin
	ln -s -f ~/deno/deno ~/.local/bin
fi
