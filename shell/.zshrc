#https://github.com/vaeth/zshrc-mv/blob/master/zshrc
emulate sh -c "source /etc/profile"
emulate sh -c "source ${HOME}/.profile"
source /usr/share/zsh/site-contrib/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

#shell settings
export MAILPATH="/var/spool/mail/${USER}"
export PAGER="/usr/bin/less"
export LESS="-i -Q -S -Sm -F -R -M --shift 5"
#export LESSOPEN="|lesspipe %s"
export LESSHISTFILE="/dev/null"
export EDITOR="/usr/bin/nvim"
export USE_EDITOR="$EDITOR"
export VISUAL="$EDITOR"

#zsh specific
export REPORTTIME="2"

#gentoo
export EIX_LIMIT="0"

#other
export MPD_HOST="/tmp/mpd.socket"
export XDG_CACHE_HOME="/tmp/${USER}/cache"
export XDG_RUNTIME_DIR="/tmp/${USER}"
export VDPAU_DRIVER="radeonsi"
export PATH=${HOME}/.local/bin:${PATH}

CC="/usr/lib/llvm/7/bin/clang"
CXX="/usr/lib/llvm/7/bin/clang++ -stdlib=libc++"
CPP="/usr/lib/llvm/7/bin/clang-cpp"
AR="/usr/lib/llvm/7/bin/llvm-ar"
NM="/usr/lib/llvm/7/bin/llvm-nm"
RANLIB="/bin/true"
LD="/usr/bin/ld.lld" #LLVM lld

CFLAGS="-pipe -O2 -mtune=znver1 -march=znver1 -fomit-frame-pointer -flto=thin -finline-functions"
CXXFLAGS="$CFLAGS"
FFLAGS="$CFLAGS"
FCFLAGS="$CFLAGS"
LDFLAGS="$CFLAGS -Wl,--as-needed -Wl,--discard-all -Wl,--hash-style=gnu"

# z settings
# Completion System (man zshcompsys):
zstyle ":completion:*" completer _ignored _approximate
zstyle ":completion:*" completions 1
zstyle ":completion:*" glob 1
zstyle ":completion:*" list-colors ""
zstyle ":completion:*" max-errors 5 numeric
zstyle ":completion:*" substitute 1
zstyle ":compinstall" filename "${HOME}/.zshrc"
zstyle ":completion:*:descriptions" format "%U%B%d%b%u"
zstyle ":completion:*:warnings" format "%BNo matches for: %d%b"
zstyle ":completion:*" menu select
zstyle ":completion::complete:*" use-cache 1
zstyle ":completion:*:*:-command-:*:*" ignored-patterns "_*"

# colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) #([0-9a-z/-]# #[0-9:]# #)*=01;32=01;36=01;33'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=00;36'
zstyle ':completion:*:*:*:*:users' list-colors '=*=01;35'
zstyle ':completion:*:*:*:*:modules' list-colors '=*=01;35'
zstyle ':completion:*:*:*:*:interfaces' list-colors '=*=01;35'
zstyle ':completion:*:*:*:*:packages' list-colors '=*=01;32'
zstyle ':completion:*:*:*:*:categories' list-colors '=*=00;32'
zstyle ':completion:*:*:*:*:useflags' list-colors '=*=01;35'
zstyle ':completion:*:reserved-words' list-colors '=*=01;32'
zstyle ':completion:*:aliases' list-colors '=*=01;32'
zstyle ':completion:*:parameters' list-colors '=*=01;36'

# Restrict cd selections:
zstyle ':completion:*:cd:*' tag-order local-directories # directory-stack named-directories path-directories

#dirs
setopt AUTO_CD
setopt AUTO_PUSHD
setopt CDABLE_VARS
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
#comp
setopt AUTO_LIST
setopt AUTO_NAME_DIRS
setopt AUTO_PARAM_SLASH
setopt COMPLETE_ALIASES
setopt GLOB_COMPLETE
setopt LIST_AMBIGUOUS
setopt LIST_PACKED
setopt LIST_ROWS_FIRST
setopt LIST_TYPES
setopt MENU_COMPLETE
#expan
setopt EXTENDED_GLOB
setopt GLOB
setopt GLOB_DOTS
setopt MARK_DIRS
setopt NOMATCH
setopt NUMERIC_GLOB_SORT
setopt WARN_CREATE_GLOBAL
#hist
setopt APPEND_HISTORY
setopt HIST_ALLOW_CLOBBER
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
#i/o
setopt CORRECT_ALL
setopt PATH_DIRS
#job
setopt AUTO_CONTINUE
setopt NOTIFY

bindkey -v

autoload -Uz compinit promptinit
compinit
#compinit -D # -u -C
promptinit; prompt gentoo

HISTSIZE="1000"
SAVEHIST="1000"
SAVEHIST="$HISTSIZE"
HISTFILE="${HOME}/.history"

if [ "$EUID" -eq 0 ]; then
	PS1="%F{1}%B%n%b%f %d %B#%b "
else
	PS1="%F{1}%B%n%b%f %d %B>%b "
fi

if [ -n "$SSH_CLIENT" ]; then
	if [ "$EUID" -eq 0 ]; then
		PS1="%F{1}%B%n@%M%b%f %d %B#%b "
	else
		PS1="%F{1}%B%n@%M%b%f %d %B>%b "
	fi
fi

#files
alias chgrp="chgrp -v --preserve-root"
alias chmod="chmod -v --preserve-root"
alias chown="chown -v --preserve-root"
alias rm="rm -I --preserve-root"
alias cp="cp -iv"
alias mv="mv -iv"
alias ln="ln -ivs"
alias mkdir="mkdir -pv"

#net
alias wget="wget --hsts-file=/tmp/wget-hsts"
alias ports="netstat -tulanp"
alias rss="newsboat"
alias neomutt="neomutt -F ${HOME}/.config/mutt/muttrc"
alias weechat="weechat -d ${HOME}/.config/weechat"
alias flexget="flexget --logfile=/dev/null"
alias tb="nc termbin.com 9999"

#toolchain
alias make="nice -19 make -j$(($(nproc)+1)) -l$(($(nproc)+1))"
alias gdb="gdb -q"
alias strip="strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag"

#misc
alias ffmpeg="ffmpeg -hide_banner"
alias ffprobe="ffprobe -hide_banner"
alias ffplay="ffplay -hide_banner"
alias alsamixer="alsamixer -c 1"
alias bc="bc -q"
alias su="doas su"
alias sudo="doas"
alias lxd="LD_LIBRARY_PATH=/usr/lib/lxd lxd"
alias calcurse="calcurse --directory ${HOME}/.config/calcurse"

#information
alias dmesg="dmesg --kernel --color=always"
alias ls="ls --all -v --color=auto --group-directories-first --classify --file-type"
alias ll='ls -l --time-style=+"%Y-%m-%d %H:%M:%S"'
alias df="df -hTP"
alias du="du -k --one-file-system --total"
alias mountt="mount|column -t"
alias grep="grep --color=auto --ignore-case"
alias egrep="egrep --color=auto --ignore-case"
alias fgrep="fgrep --color=auto --ignore-case"
alias pcregrep="pcregrep --color=auto --ignore-case"
alias gtop="radeontop"
alias mime-type="file -b --mime-type"
alias mime-encode="file -b --mime-encoding"
alias file-perm="stat -c %a"
alias dir="dir --almost-all --color=auto"
alias we="curl wttr.in/86005"
alias diff="diff -Naur"
alias cdiff="colordiff"
alias time='/usr/bin/time -f "\nTIME\t%E\nCPU\t%P\nRAM\t%Mk"'
alias ktime='/usr/bin/time -f "\nTIME\t%E\nUSER\t%U\nKERN\t%S\nCPU\t%P\nRAM\t%Mk"'
alias auditlog="doas tail -f /var/log/audit/audit.log"
alias del="printf 'COMMAND     PID       USER   FD   TYPE DEVICE  SIZE/OFF   NODE NAME\n';doas lsof /|\egrep --color=auto 'DEL|deleted'"
alias delc="doas lsof /|\egrep 'DEL|deleted'|wc -l"
alias todo="grep --color=auto --ignore-case todo *"

#other
#alias neofetch="neofetch --backend w3m --source ${HOME}/images/face/082.jpg"
#alias anime-rss="flexget --logfile /dev/null execute --tasks Anime --disable-tracking"
alias 2to3="2to3 -f all -f buffer -f idioms -f set_literal -f ws_comma -j 128"

#git
alias gaa="git add ."
alias gcm="git commit -m"
alias gca="git commit --amend"
alias grl="git reflog"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --branches"

#kernel
alias mcc="make menuconfig"
alias msc="make syncconfig"

#gentoo
alias update="emerge --deep --verbose --changed-use --newuse --changed-deps=y --with-bdeps=y --jobs --update @world"
alias emerge-check="emerge --deep --verbose --changed-use --newuse --changed-deps=y --with-bdeps=y --jobs @world"
alias quickpkg="quickpkg --include-config=y"
alias smart-live-rebuild="smart-live-rebuild -f '!zfs'"
alias eqf="equery f"
alias equ="equery u -i"
alias eqh="equery h"
alias eqa="equery a --overlay-tree"
alias eqb="equery b"
alias eql="equery l"
alias eqd="equery d"
alias eqg="equery g"
alias eqc="equery c"
alias eqk="equery k"
alias eqm="equery m"
alias eqy="equery y"
alias eqs="equery s"
alias eqss="equery s --bytes"
alias eqw="equery w"

#openrc
alias rc-status="rc-status -a"

#on/off
alias halt="sync && /sbin/halt"
alias poweroff="sync && /sbin/poweroff"
alias reboot="sync && /sbin/reboot"

#misc
#ntpctl -s all

#functions
spell(){ echo "$@" | aspell -a | sed '1d;$d'; }
mkcd(){ mkdir -p "${1}";cd "${1}"; }

