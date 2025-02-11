#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# The next line updates PATH for CLI.
if [ -f '/home/den/yandex-cloud/path.bash.inc' ]; then source '/home/den/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/den/yandex-cloud/completion.bash.inc' ]; then source '/home/den/yandex-cloud/completion.bash.inc'; fi

