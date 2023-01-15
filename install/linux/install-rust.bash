#!/bin/bash

type 

sudo apt install gcc libssl-dev pkg-config make cmake build-essential
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
cargo install cargo-update
