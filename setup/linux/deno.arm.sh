DENO_VERSION=v1.27

mkdir -p ~/deno
git clone https://github.com/LukeChannings/deno-arm64 ~/deno-arm64
cd ~/deno-arm64

docker build -t deno-build-${DENO_VERSION} --build-arg DENO_VERSION="${DENO_VERSION}" --progress=plain --file ./Dockerfile.compile .
DENO_BUILD_CONTAINER="$(docker create deno-build-${DENO_VERSION} --name deno-build-$DENO_VERSION)"

rm ~/deno/deno
docker cp "${DENO_BUILD_CONTAINER}:/deno/target/release/deno" ~/deno
docker rm "${DENO_BUILD_CONTAINER}"

mkdir -p ~/.local/bin
ln -s -f ~/deno/deno ~/.local/bin
