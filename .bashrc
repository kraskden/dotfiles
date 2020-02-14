#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias fm='kitty -e ranger $@'
alias netspeed='speedometer -r wlp0s20f3'
PS1='[\u@\h \W]\$ '
