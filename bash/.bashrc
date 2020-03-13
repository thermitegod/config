[[ $- != *i* ]] && return

source "/etc/profile"
source "${XDG_CONFIG_HOME}/shell/profile"
source "${XDG_CONFIG_HOME}/shell/alias"

shopt -s autocd

HISTFILE="${XDG_DATA_HOME}/bash/history"

PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] >>>>  "

