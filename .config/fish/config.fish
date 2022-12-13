# environment
set -l os $(uname)
set -gx SHELL $(which fish)
set -gx DOTNET_ROOT ~/.dotnet
fish_add_path ~/.dotnet
fish_add_path ~/.dotnet/tools
fish_add_path ~/.cargo/bin

if test $os = Darwin
    test -d /opt/homebrew && eval $(/opt/homebrew/bin/brew shellenv)
else if test $os = Linux
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if type -q brew
    test -d $(brew --prefix asdf) && source $(brew --prefix asdf)/libexec/asdf.fish
end

test -d ~/.config/fish/user_function && find ~/.config/fish/user_function -name '*.fish' | while read file
    source $file
end

test -e ~/.config/fish/alias.fish && source ~/.config/fish/alias.fish

if status is-interactive
    fish_vi_key_bindings
    fish_vi_cursor

    bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"

    if type -q brew
        if test -d (brew --prefix)"/share/fish/completions"
            set -gx fish_complete_path $fish_complete_path $(brew --prefix)/share/fish/completions
        end

        if test -d (brew --prefix)"/share/fish/vendor_completions.d"
            set -gx fish_complete_path $fish_complete_path $(brew --prefix)/share/fish/vendor_completions.d
        end
    end

    if type -q nvim
        set -gx EDITOR $(which nvim)
    else if type -q vi
        set -gx EDITOR $(which vi)
    end

    type -q starship && starship init fish | source
    type -q zoxide && zoxide init fish | source
    type -q mcflt && mcfly init fish | source
end

# test -e ~/.config/fish/user_colors/tokyonight_day.fish && source ~/.config/fish/user_colors/tokyonight_day.fish
test -e ~/.config/fish/user_colors/tokyonight_night.fish && source ~/.config/fish/user_colors/tokyonight_night.fish
#test -e ~/.config/fish/user_colors/tokyonight_moon.fish && source ~/.config/fish/user_colors/tokyonight_moon.fish
#test -e ~/.config/fish/user_colors/tokyonight_storm.fish && source ~/.config/fish/user_colors/tokyonight_storm.fish
