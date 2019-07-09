export PATH=${HOME}/.local/bin:${PATH}

export EIX_LIMIT="0"
export MPD_HOST="/run/mpd.socket"
export QT_STYLE_OVERRIDE="adwaita-dark"
export VDPAU_DRIVER="radeonsi"

export GNUPGHOME="~/.config/gnupg"
export GPG_TTY="$(tty)"

export PYTHONOPTIMIZE="2"
#export PYTHONOPTIMIZE="0"
export PYTHONUTF8="1"

export EDITOR="/usr/bin/nvim"
export LESSHISTFILE="/dev/null"
export LESS="-i -Q -S -Sm -F -R -M --shift 5"
#export LESSOPEN="|lesspipe %s"
export MAILPATH="/var/spool/mail/${USER}"
export PAGER="/usr/bin/less"
export USE_EDITOR="${EDITOR}"
export VISUAL="${EDITOR}"

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

export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/config"

LLVM="8"
CC="/usr/lib/llvm/${LLVM}/bin/clang-${LLVM}"
CXX="/usr/lib/llvm/${LLVM}/bin/clang++-${LLVM} -stdlib=libc++"
CPP="/usr/lib/llvm/${LLVM}/bin/clang-cpp"
AR="/usr/lib/llvm/${LLVM}/bin/llvm-ar"
NM="/usr/lib/llvm/${LLVM}/bin/llvm-nm"
RANLIB="/usr/lib/llvm/${LLVM}/bin/llvm-ranlib"
LD="/usr/bin/ld.lld" #LLVM lld

CFLAGS="-pipe -O2 -mtune=znver1 -march=znver1 -fomit-frame-pointer -flto=thin -finline-functions"
CXXFLAGS="$CFLAGS"
FFLAGS="$CFLAGS"
FCFLAGS="$CFLAGS"
LDFLAGS="$CFLAGS -Wl,--as-needed -Wl,--discard-all -Wl,--hash-style=gnu"

PS1="> "

