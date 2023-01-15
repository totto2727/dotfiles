#!/bin/bash

sudo apt update && sudo apt upgrade

bash ~/dotfiles/update/rust/update.bash

sh ~/dotfiles/update/linux/update-nvim.bash
sh ~/dotfiles/update/linux/update-helix.bash
