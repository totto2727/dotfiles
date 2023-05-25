#!/bin/bash

source ~/dotfiles/static/script/exist.bash

exist cargo && cargo install cargo-update

# exist go && go install 

exist pip3 && pip3 install -r ~/dotfiles/static/package/requirements.txt

