if status is-interactive
    set fish_greeting
end

alias ssh='kitty +kitten ssh'
alias se='sudoedit'

set vps 'denis@351y.l.time4vps.cloud'

alias ga='git add .'
alias gcmt='git commit'
alias gcmT='git commit --amend'
alias gps='git push'
alias gpl='git pull'
alias gst='git status'

fzf_configure_bindings --history=\er --directory=\ef --git_log=\eg --variables=\e4
