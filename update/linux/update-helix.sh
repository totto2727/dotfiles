#!/bin/bash

cd ~/helix || exit
git pull || exit
cargo install --path helix-term

hx -g fetch
hx -g build
