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

alias ll='ls -l'
alias la='ls -a'
alias lt='exa --tree'
alias cat='batcat'
alias fd='fdfind'

alias aur='command ssh aur@aur.archlinux.org'

fzf_configure_bindings --history=\er --directory=\ef --git_log=\eg --variables=\e4
