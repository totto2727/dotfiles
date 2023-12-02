mkdir -p "$HOME/.ssh/keys/"
ssh-keygen -t ed25519 -f "$HOME/.ssh/keys/main"
echo "git clone git@github.com:totto2727-org/dotfiles.git" "$HOME/dotfiles"

