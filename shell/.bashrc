[[ $- != *i* ]] && return

source "/etc/profile"
source "${HOME}/.profile"
source "${HOME}/.alias"

shopt -s autocd

PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "

