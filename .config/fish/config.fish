if status is-interactive
    set fish_greeting
end

#alias ssh='kitty +kitten ssh'
alias se='sudoedit'

#alias ssh_vps='kitty +kitten ssh den@194.87.248.37 -p 2274'
alias ssh_vps="ssh den@194.87.248.37 -p 2274"

set old_vps 'denis@351y.l.time4vps.cloud'
set finDB '/home/den/docs/finance/finance.sqlite'

alias ga='git add .'
alias gcmt='git commit'
alias recmt='git commit -a -m (git show -s --format=%s)'
alias gcmT='git commit --amend'
alias gps='git push'
alias gpl='git pull'
alias gst='git status'
alias gchk='git checkout'

alias ll='ls -l'
alias la='ls -a'
alias lt='exa --tree'
alias tree='exa --tree'
alias cat='bat'

alias aur='command ssh aur@aur.archlinux.org'

function config 
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end;

abbr -a msp music sync phone
abbr -a msy music sync yandex
abbr -a mdl music dl

fzf_configure_bindings --history=\er --directory=\ef --git_log=\eg --variables=\e4
