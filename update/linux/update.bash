#!/bin/bash

sudo apt update && sudo apt upgrade

bash ~/dotfiles/update/rust/update.bash

bash ~/dotfiles/update/linux/update-nvim.bash
bash ~/dotfiles/update/linux/update-helix.bash

bash ~/dotfiles/update/update.bash
