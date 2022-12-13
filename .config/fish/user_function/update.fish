function update
    echo -e "\nasdf"
    asdf plugin update --all

    echo -e "\nbrew"
    brew update
    brew upgrade
    sh ~/dotfiles/update/brew/brew-bundle.sh

    curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/fish/tokyonight_day.fish >~/dotfiles/.config/fish/user_colors/tokyonight_day.fish
    curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/fish/tokyonight_night.fish >~/dotfiles/.config/fish/user_colors/tokyonight_night.fish
    curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/fish/tokyonight_storm.fish >~/dotfiles/.config/fish/user_colors/tokyonight_storm.fish
    curl https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/fish/tokyonight_moon.fish >~/dotfiles/.config/fish/user_colors/tokyonight_moon.fish

    curl https://raw.githubusercontent.com/aereal/vim-colors-japanesque/master/colors/japanesque.vim >~/dotfiles/.config/nvim/colors/japanesque.vim

    echo -e "\nfisher"
    fisher update
    cp ~/dotfiles/.config/fish/fish_plugins ~/dotfiles/.config/fish/fish_plugins.backup

    echo -e "\nfish_update_completions"
    fish_update_completions

    echo -e "\npip"
    pip install --upgrade pip
    pip list -o | tail -n +3 | awk '{ print $1 }' | xargs pip install -U
    sh ~/dotfiles/update/pip/update-pip-global.sh

    # 以下手動更新
    echo -e "\nnpm global varsion"
    echo -e "$(npx npm-check-updates -g) && sh ~/dotfiles/update/npm/update-npm-global.sh"

    echo -e "\nvi -c PackerUpdate -c TSUpdate"
end
