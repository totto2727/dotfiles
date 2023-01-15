#!/bin/bash

cd ~/helix || exit
git pull || exit
cargo install --locked --path helix-term

hx -g fetch
hx -g build
