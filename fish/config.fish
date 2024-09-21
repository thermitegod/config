# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

set -gx LLVM_VER "19"

# set PATH with only the real paths on usr-merged system, ignoring symlinks.
set -gx PATH /usr/bin /usr/local/bin /usr/lib/llvm/$LLVM_VER/bin $HOME/.local/bin $HOME/.local/share/cargo/bin

#####################
### Fish Settings ###
#####################

# Disable greeting/help message
set fish_greeting

# Show whole path name
set fish_prompt_pwd_dir_length 0

#################
### Variables ###
#################

set -gx DEFAULT_COMPILER "clang"
# set -gx DEFAULT_COMPILER "gcc"

# Compiler - from /etc/portage/make.conf
if test $DEFAULT_COMPILER = "clang"
    set -gx CC "/usr/lib/llvm/$LLVM_VER/bin/clang"
    set -gx CXX "/usr/lib/llvm/$LLVM_VER/bin/clang++"
    # set -gx CXX "/usr/lib/llvm/$LLVM_VER/bin/clang++ -stdlib=libc++"
    set -gx LD "/usr/lib/llvm/$LLVM_VER/bin/ld.lld"

    # LLVM-provided binutils
    set -gx AR "/usr/lib/llvm/$LLVM_VER/bin/llvm-ar"
    set -gx AS "/usr/lib/llvm/$LLVM_VER/bin/clang -c"
    set -gx CPP "/usr/lib/llvm/$LLVM_VER/bin/clang-cpp"
    set -gx NM "/usr/lib/llvm/$LLVM_VER/bin/llvm-nm"
    set -gx STRIP "/usr/lib/llvm/$LLVM_VER/bin/llvm-strip"
    set -gx RANLIB "/usr/lib/llvm/$LLVM_VER/bin/llvm-ranlib"
    set -gx OBJCOPY "/usr/lib/llvm/$LLVM_VER/bin/llvm-objcopy"
    set -gx STRINGS "/usr/lib/llvm/$LLVM_VER/bin/llvm-strings"
    set -gx OBJDUMP "/usr/lib/llvm/$LLVM_VER/bin/llvm-objdump"
    set -gx READELF "/usr/lib/llvm/$LLVM_VER/bin/llvm-readelf"
    set -gx ADDR2LINE "/usr/lib/llvm/$LLVM_VER/bin/llvm-addr2line"
else
    set -gx CC "/usr/bin/gcc"
    set -gx CXX "/usr/bin/g++"
    set -gx LD "/usr/bin/ld.bfd"

    # binutils
    set -gx AR "/usr/bin/ar"
    set -gx AS "/usr/bin/as"
    set -gx CPP "/usr/bin/cpp"
    set -gx NM "/usr/bin/nm"
    set -gx STRIP "/usr/bin/strip"
    set -gx RANLIB "/usr/bin/ranlib"
    set -gx OBJCOPY "/usr/bin/objcopy"
    set -gx STRINGS "/usr/bin/strings"
    set -gx OBJDUMP "/usr/bin/objdump"
    set -gx READELF "/usr/bin/readelf"
    set -gx ADDR2LINE "/usr/bin/addr2line"
end

# XDG
set -gx XDG_CACHE_HOME "/tmp/users/$USER"
set -gx XDG_RUNTIME_DIR "/run/user/$(id -u)"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_DIRS "/usr/local/share:/usr/share:$HOME/.local/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"

set -gx XDG_DESKTOP_DIR "$HOME/.local/share/desktop"
set -gx XDG_DOWNLOAD_DIR "$HOME/downloads"
set -gx XDG_DOCUMENTS_DIR "$HOME/documents"
set -gx XDG_MUSIC_DIR "$HOME/music"
set -gx XDG_PICTURES_DIR "$HOME/pictures"
set -gx XDG_VIDEOS_DIR "$HOME/videos"
set -gx XDG_TEMPLATES_DIR "$HOME/"
set -gx XDG_PUBLICSHARE_DIR "$HOME/"

# GUI
# set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
set -gx QT_STYLE_OVERRIDE "adwaita-dark"

# GPG
set -gx GNUPGHOME "$XDG_CONFIG_HOME/gnupg"
set -gx GPG_TTY "$(tty)"

# Python
# set -gx PYTHONOPTIMIZE "2"
set -gx PYTHONUTF8 "1"

# Defaults
set -gx EDITOR "$(command -v nvim)"
set -gx LESSHISTFILE "/dev/null"
set -gx LESS "-i -Q -S -Sm -F -R -M --shift 5"
set -gx MAILPATH "/var/spool/mail/$USER"
set -gx PAGER "$(command -v less)"
set -gx USE_EDITOR "$EDITOR"
set -gx VISUAL "$EDITOR"

# Other
set -gx MPD_HOST "$XDG_RUNTIME_DIR/mpd.socket"
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/config"
set -gx VDPAU_DRIVER "radeonsi"

# tmux
set -gx TMUX_TMPDIR "$XDG_RUNTIME_DIR"

# rust
set -gx RUSTFLAGS '-C target-cpu=native'
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"

# zstd
set -gx ZSTD_NBTHREADS "$(nproc)"

# timezone
# https://blog.packagecloud.io/set-environment-variable-save-thousands-of-system-calls/
# set -gx TZ ":/etc/timezone"
set -gx TZ "America/Phoenix"

#################
### LS_COLORS ###
#################

# Copied from /etc/DIR_COLOR
set -gx LS_COLORS '*.7z=01;31:*.ace=01;31:*.alz=01;31:*.apk=01;31:*.arc=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cpio=01;31:*.crate=01;31:*.deb=01;31:*.drpm=01;31:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.egg=01;31:*.esd=01;31:*.gz=01;31:*.jar=01;31:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.pyz=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.udeb=01;31:*.war=01;31:*.whl=01;31:*.wim=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:*.avif=01;35:*.jpg=01;35:*.jxl=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.cfg=00;32:*.conf=00;32:*.diff=00;32:*.doc=00;32:*.ini=00;32:*.log=00;32:*.patch=00;32:*.pdf=00;32:*.ps=00;32:*.tex=00;32:*.txt=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90'

#################
###  Aliases  ###
#################

# file coreutils
function chgrp \
        --wraps chgrp
    command chgrp -v --preserve-root $argv
end

function chmod \
        --wraps chmod
    command chmod -v --preserve-root $argv
end

function chown \
        --wraps chown
    command chown -v --preserve-root $argv
end

function rm \
        --wraps rm
    command rm -v -I --preserve-root $argv
end

function cp \
        --wraps cp
    command cp -iva $argv
end

function mv \
        --wraps mv
    command mv -iv $argv
end

function ln \
        --wraps ln
    command ln -ivs $argv
end

function mkdir \
        --wraps mkdir
    command mkdir -pv $argv
end

# net
function wget \
        --wraps wget
    command wget --hsts-file=$XDG_CACHE_HOME/wget-hsts $argv
end

function ports
    command netstat -tulanp
end

function weechat \
        --wraps weechat
    command weechat -d $XDG_CONFIG_HOME/weechat $argv
end

# toolchain
function make \
        --wraps make
    command nice -19 make -j(math (command nproc) x 2 + 2) -l(math (command nproc) + 1) $argv
end

function lldb \
        --wraps lldb
    command lldb --source $XDG_CONFIG_HOME/lldb/lldbinit $argv
end

# kernel
function kmake \
        --wraps make
    # uses fish wrapper function
    make CC=$CC LD=$LD LLVM=1 LLVM_IAS=1 $argv
end

function mcc
    # uses fish wrapper function
    kmake menuconfig
end

function msc
    # uses fish wrapper function
    kmake syncconfig
end

# misc
function su \
        --wraps su
    command doas su $argv
end

function tmux \
        --wraps tmux
    command tmux -f $XDG_CONFIG_HOME/tmux/config $argv
end

function mkcd \
        --wraps mkdir
    # uses fish wrapper function
    mkdir $argv
    command cd $argv
end

# information
function dmesg \
        --wraps dmesg
    command dmesg --kernel --color=always $argv
end

function ls \
        --wraps ls
    command ls --all -v --color=auto --group-directories-first --classify --file-type $argv
end

function ll \
        --wraps ls
    # uses 'ls' wrapper function
    ls -l --time-style=+"%Y-%m-%d %H:%M:%S" $argv
end

function df \
        --wraps df
    command df -hTP $argv
end

function du \
        --wraps du
    command du -k --one-file-system --total $argv
end

function grep \
        --wraps grep
    command grep --color=auto --binary-files=without-match $argv
end

function mime-type \
        --wraps file
    command file -b --mime-type $argv
end

function mime-encode \
        --wraps file
    command file -b --mime-encoding $argv
end

function file-perm \
        --wraps stat
    command stat -c %a $argv
end

function dir \
        --wraps dir
    command dir --almost-all --color=auto $argv
end

function we
    command curl wttr.in/86005
end

function diff \
        --wraps diff
    command diff -Naur $argv
end

function del
    printf 'COMMAND     PID       USER   FD   TYPE DEVICE  SIZE/OFF   NODE NAME\n'
    command doas lsof / 2>/dev/null | command grep -E --color=auto 'DEL|deleted'
end

function delc
    command doas lsof / 2>/dev/null | command grep -E 'DEL|deleted' | command wc -l
end

function ncdu \
        --wraps ncdu
    command ncdu -x -rr $argv
end

function uname \
        --wraps uname
    command uname -a
end

# git
function gaa
    command git add .
end

function gcm
    command git commit -m $argv
end

function gca
    command git commit --amend
end

function grl
    command git reflog
end

function glg
    command git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --branches
end

function glgpg
    command git log --show-signature -1
end

function git-gc
    command git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc
    command git gc --aggressive
end

function ggg
    command git commit --amend --reset-author --no-edit
    command git rebase --continue
end

# gentoo
function emerge \
        --wraps emerge
    # Some packages break during build/install when this is not set to '0'
    # set -f PYTHONOPTIMIZE 0

    # unset custom toolchain, let portage set everything
    set -f CC ""
    set -f CXX ""
    set -f LD ""
    set -f AR ""
    set -f AS ""
    set -f CPP ""
    set -f NM ""
    set -f STRIP ""
    set -f RANLIB ""
    set -f OBJCOPY ""
    set -f STRINGS ""
    set -f OBJDUMP ""
    set -f READELF ""
    set -f ADDR2LINE ""

    command emerge --ask --verbose --nospinner $argv
end

function update
    # uses 'emerge' wrapper function
    emerge --deep --changed-use --newuse --changed-deps=y --with-bdeps=y --jobs --update @world $argv
end

function emerge-check
    # uses 'emerge' wrapper function
    emerge --deep --changed-use --newuse --changed-deps=y --with-bdeps=y --jobs @world
end

function quickpkg \
        --wraps quickpkg
    command quickpkg --include-config=y $argv
end

function eix \
        --wraps eix
    set -l EIX_LIMIT "0"
    command eix $argv
end

function smart-live-rebuild \
        --wraps smart-live-rebuild
    command smart-live-rebuild -f '!zfs' $argv
end

function eqf
    command equery f $argv
end

function equ
    command equery u -i $argv
end

function eqh
    command equery h $argv
end

function eqa
    command equery a --overlay-tree $argv
end

function eqb
    command equery b $argv
end

function eql
    command equery l $argv
end

function eqd
    command equery d $argv
end

function eqg
    command equery g $argv
end

function eqk
    command equery k $argv
end

function eqm
    command equery m $argv
end

function eqy
    command equery y $argv
end

function eqs
    command equery s $argv
end

function eqss
    command equery s --bytes $argv
end

function eqsss
    eqs $argv
    eqss $argv
end

function eqw
    command equery w $argv
end

function etcat
    command equery l -o -p $argv
end
