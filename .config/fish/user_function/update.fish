function update
    echo -e "\nasdf"
    bash ~/dotfiles/update/asdf/update.bash

    echo -e "\nbrew"
    brew update
    brew upgrade
    sh ~/dotfiles/update/brew/update-list.sh

    echo -e "\nTheme"
    sh ~/dotfiles/update/theme.sh

    echo -e "\nfisher"
    fisher update
    cp ~/dotfiles/.config/fish/fish_plugins ~/dotfiles/.config/fish/fish_plugins.backup

    echo -e "\nfish_update_completions"
    fish_update_completions

    echo -e "\npython"
    sh ~/dotfiles/update/python/update.sh

    # 以下手動更新
    echo -e "\nnpm global varsion"
    sh ~/dotfiles/update/npm/update.sh

    echo -e "\nvi -c PackerUpdate -c TSUpdate"
end
