brew bundle dump -f --file "~/dotfiles/update/brew/Brewfile"
cat ~/dotfiles/update/brew/Brewfile | rg -e '^(brew|tap)' | rg --pcre2 '^(?!.*cask).*$' > ~/dotfiles/update/brew/Brewfile.brew
cat ~/dotfiles/update/brew/Brewfile | rg --pcre2 '(^cask)|(^tap (?=.*cask))' > ~/dotfiles/update/brew/Brewfile.cask
cat ~/dotfiles/update/brew/Brewfile.cask | rg --pcre2 'font' > ~/dotfiles/update/brew/Brewfile.cask.font
