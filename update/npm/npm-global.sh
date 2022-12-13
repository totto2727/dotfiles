cat ~/dotfiles/update/npm/package.json | jq -r ".dependencies | to_entries[].key" | sd '\n' ' '

