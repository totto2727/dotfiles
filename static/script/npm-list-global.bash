cat ~/dotfiles/static/package/package.json | jq -r ".dependencies | to_entries[].key" | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g'

