# alias
## NeoVim
if type -q nvim
    alias vi nvim
    alias vim nvim
    alias vl 'nvim -R -'
end

## cat関係
if type -q bat
    alias cat "bat -pp"
end

## ls関係
if type -q exa
    alias ls exa
    alias ll "exa --icons -al --group-directories-first --sort=name --git "
    alias lt "exa --icons -a -T -L 5 --ignore-glob='node_modules|.git' --git-ignore"
end

## SSHの簡略化
abbr -g -a ssh-dev "ssh dev"
abbr -g -a ssh-add-key "ssh-add ~/.ssh/keys/"
abbr -g -a ssh-add-dev_old "ssh-add ~/.ssh/keys/totto2727.rsa"
abbr -g -a ssh-add-dev "ssh-add ~/.ssh/keys/id_ed25519"
abbr -g -a ssh-shutdown-dev "ssh -t dev sudo shutdown now"
abbr -g -a ssh-suspend-dev "ssh -t dev sudo systemctl suspend"
abbr -g -a ssh-wakeonlan-dev "wakeonlan d4:3d:7e:f6:41:f6"
abbr -g -a ssh-wakeonlan-remote-dev "eval (wakeonlan -i=(dig dev.totto.page +short) d4:3d:7e:f6:41:f6)"

## Mac
abbr -g -a mac-sleep "pmset sleepnow"

## Ngrok
abbr -g -a ngrok-start "ngrok http --region jp"

## dnsmasq
abbr -g -a dns-clear "sudo killall -HUP mDNSResponder"

## Git
abbr -g -a gui gitui
abbr -g -a gs "git status"
abbr -g -a gd "git diff"
abbr -g -a gsw "git switch"
abbr -g -a ga "git add"
abbr -g -a gc "git commit"
abbr -g -a gca "git commit --amend"
abbr -g -a gr "git reset"
abbr -g -a gR "git restore"
abbr -g -a grm "git rm --cached"
abbr -g -a gl "git log --graph"
abbr -g -a glo "git log --graph --oneline"
abbr -g -a gls "git log --graph --stat"

alias fish_paths 'echo -e $PATH | sed "s/ /\n/g"'
abbr -g -a ta "tmux attach"
abbr -g -a td "tmux dettach"
