emulate sh -c "source /etc/profile"
emulate sh -c "source ${HOME}/.profile"
emulate sh -c "source ${HOME}/.alias"
source /usr/share/zsh/site-contrib/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

#zsh specific
export REPORTTIME="2"

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
setopt AUTO_CD AUTO_PUSHD CDABLE_VARS PUSHD_IGNORE_DUPS PUSHD_MINUS PUSHD_SILENT PUSHD_TO_HOME
#comp
setopt AUTO_LIST AUTO_NAME_DIRS AUTO_PARAM_SLASH COMPLETE_ALIASES GLOB_COMPLETE LIST_AMBIGUOUS LIST_PACKED LIST_ROWS_FIRST LIST_TYPES MENU_COMPLETE
#expan
setopt EXTENDED_GLOB GLOB GLOB_DOTS MARK_DIRS NOMATCH NUMERIC_GLOB_SORT WARN_CREATE_GLOBAL
#hist
setopt APPEND_HISTORY HIST_ALLOW_CLOBBER HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS HIST_VERIFY
#i/o
setopt CORRECT_ALL PATH_DIRS
#job
setopt AUTO_CONTINUE NOTIFY

bindkey -v

autoload -Uz compinit promptinit
compinit
#compinit -D # -u -C
promptinit; prompt gentoo

HISTSIZE="10000"
SAVEHIST="$HISTSIZE"
HISTFILE="${HOME}/.history"

if [ "$EUID" -eq 0 ];then
	PS1="%F{1}%B%n%b%f %d %B#%b "
else
	PS1="%F{1}%B%n%b%f %d %B>%b "
fi

if [ -n "$SSH_CLIENT" ];then
	if [ "$EUID" -eq 0 ];then
		PS1="%F{1}%B%n@%M%b%f %d %B#%b "
	else
		PS1="%F{1}%B%n@%M%b%f %d %B>%b "
	fi
fi

#functions
spell(){ echo "$@"|aspell -a|sed '1d;$d'; }
mkcd(){ mkdir -p "${1}";cd "${1}"; }

