#shells
#ZDOTDIR="${HOME}/.config/shell"
export BASHRC_CONFIG_DIR="${HOME}/.config/shell"

#path
export PATH=${PATH}:${HOME}/.local/bin

#gentoo
export EIX_LIMIT="0"

#gui
export GTK2_RC_FILES="${HOME}/.config/gtk-2.0/gtkrc-2.0"
export QT_STYLE_OVERRIDE="adwaita-dark"

#gpg
export GNUPGHOME="~/.config/gnupg"
export GPG_TTY="$(tty)"

#python
export PYTHONOPTIMIZE="2"
#export PYTHONOPTIMIZE="0"
export PYTHONUTF8="1"

#defaults
export EDITOR="/usr/bin/nvim"
export LESSHISTFILE="/dev/null"
export LESS="-i -Q -S -Sm -F -R -M --shift 5"
#export LESSOPEN="|lesspipe %s"
export MAILPATH="/var/spool/mail/${USER}"
export PAGER="/usr/bin/less"
export USE_EDITOR="${EDITOR}"
export VISUAL="${EDITOR}"

#other
export MPD_HOST="/run/mpd.socket"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/config"
export VDPAU_DRIVER="radeonsi"

#xdg
export XDG_CACHE_HOME="/tmp/${USER}/cache"
export XDG_RUNTIME_DIR="/tmp/${USER}"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:${HOME}/.local/share"

export XDG_DESKTOP_DIR="$HOME/.local/share/desktop"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_MUSIC_DIR="$HOME/media/music"
export XDG_PICTURES_DIR="$HOME/images"
export XDG_VIDEOS_DIR="$HOME/"
export XDG_TEMPLATES_DIR="$HOME/"
export XDG_PUBLICSHARE_DIR="$HOME/"

#LLVM="9"
#export CC="/usr/lib/llvm/${LLVM}/bin/clang-${LLVM}"
#export CXX="/usr/lib/llvm/${LLVM}/bin/clang++-${LLVM} -stdlib=libc++"
#export CPP="/usr/lib/llvm/${LLVM}/bin/clang-cpp"
#export AR="/usr/lib/llvm/${LLVM}/bin/llvm-ar"
#export NM="/usr/lib/llvm/${LLVM}/bin/llvm-nm"
#export RANLIB="/usr/lib/llvm/${LLVM}/bin/llvm-ranlib"
#export LD="/usr/bin/ld.lld" #LLVM lld

export PS1="> "

