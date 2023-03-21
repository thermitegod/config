#if status is-interactive
#    # Commands to run in interactive sessions can go here
#end

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

#xdg
set -x XDG_CACHE_HOME "/tmp/users/$USER"
set -x XDG_RUNTIME_DIR "/run/user/$(id -u)"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_DIRS "/usr/local/share:/usr/share:$HOME/.local/share"

set -x XDG_DESKTOP_DIR "$HOME/.local/share/desktop"
set -x XDG_DOWNLOAD_DIR "$HOME/downloads"
set -x XDG_DOCUMENTS_DIR "$HOME/documents"
set -x XDG_MUSIC_DIR "$HOME/media/music"
set -x XDG_PICTURES_DIR "$HOME/images"
set -x XDG_VIDEOS_DIR "$HOME/"
set -x XDG_TEMPLATES_DIR "$HOME/"
set -x XDG_PUBLICSHARE_DIR "$HOME/"

#path
set -x PATH "$PATH:$HOME/.local/bin:$HOME/.local/share/cargo/bin"

#gentoo
set -x EIX_LIMIT "0"

#gui
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
set -x QT_STYLE_OVERRIDE "adwaita-dark"

#gpg
set -x GNUPGHOME "$XDG_CONFIG_HOME/gnupg"
set -x GPG_TTY "$(tty)"

#python
set -x PYTHONOPTIMIZE "2"
#set -x PYTHONOPTIMIZE "0"
set -x PYTHONUTF8 "1"

#defaults
set -x EDITOR "/usr/bin/nvim"
set -x LESSHISTFILE "/dev/null"
set -x LESS "-i -Q -S -Sm -F -R -M --shift 5"
set -x MAILPATH "/var/spool/mail/$USER"
set -x PAGER "/usr/bin/less"
set -x USE_EDITOR "$EDITOR"
set -x VISUAL "$EDITOR"

#other
set -x MPD_HOST "$XDG_RUNTIME_DIR/mpd.socket"
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/config"
set -x VDPAU_DRIVER "radeonsi"

#tmux
set -x TMUX_TMPDIR "$XDG_RUNTIME_DIR"

#rust
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"

#zstd
set -x ZSTD_NBTHREADS "$(nproc)"


#################
###   Alias   ###
#################

# file coreutils
function chgrp
    /usr/bin/chgrp -v --preserve-root $argv
end
function chmod
    /usr/bin/chmod -v --preserve-root $argv
end
function chown
    /usr/bin/chown -v --preserve-root $argv
end
function rm
    /usr/bin/rm -v -I --preserve-root $argv
end
function cp
    /usr/bin/cp -iva $argv
end
function mv
    /usr/bin/mv -iv $argv
end
function ln
    /usr/bin/ln -ivs $argv
end
function mkdir
    /usr/bin/mkdir -pv $argv
end

#net
function wget
    /usr/bin/wget --hsts-file=/tmp/wget-hsts $argv
end
function ports
    /usr/bin/netstat -tulanp
end
function weechat
    /usr/bin/weechat -d $XDG_CONFIG_HOME/weechat $argv
end
function flexget
    $HOME/.local/bin/flexgetflexget --logfile /dev/null $argv
end

#toolchain
function make
    # nice -19 make -j$(($(nproc)*2+1)) -l$(($(nproc)+1))
    /usr/bin/nice -19 make -j $argv
end

#kernel
function kmake
    /usr/bin/make CC=clang LD=ld.lld LLVM=1 LLVM_IAS=1 $argv
end
function mcc
    kmake menuconfig
end
function msc
    kmake syncconfig
end

#misc
function alsamixer
    /usr/bin/alsamixer -c 1
end
function su
    /usr/bin/doas /usr/bin/su
end
function tmux
    /usr/bin/tmux -f $XDG_CONFIG_HOME/tmux/config
end
function clear
    /usr/bin/tput clear
end
function reset
    /usr/bin/tput reset
end
function mkcd
    mkdir $argv
    cd $argv
end

#information
function dmesg
    /usr/bin/dmesg --kernel --color=always
end
function ls
    /usr/bin/ls --all -v --color=auto --group-directories-first --classify --file-type $argv
end
function ll
    ls -l --time-style=+"%Y-%m-%d %H:%M:%S" $argv
end
function df
    /usr/bin/df -hTP $argv
end
function du
    /usr/bin/du -k --one-file-system --total $argv
end
function mountt
    /usr/bin/mount|/usr/bin/column -t
end
function grep
    /usr/bin/grep -IHn --color=auto --ignore-case $argv
end
function egrep
    /usr/bin/grep -E $argv
end
function fgrep
    /usr/bin/grep -F $argv
end
function pcregrep
    /usr/bin/grep -P $argv
end
function gtop
    /usr/bin/radeontop
end
function mime-type
    /usr/bin/file -b --mime-type $argv
end
function mime-encode
    /usr/bin/file -b --mime-encoding $argv
end
function file-perm
    /usr/bin/stat -c %a $argv
end
function dir
    /usr/bin/dir --almost-all --color=auto $argv
end
function we
    /usr/bin/curl wttr.in/86005
end
function diff
    /usr/bin/diff -Naur $argv
end
function cdiff
    /usr/bin/colordiff $argv
end
function del
    /usr/bin/printf 'COMMAND     PID       USER   FD   TYPE DEVICE  SIZE/OFF   NODE NAME\n'
    /usr/bin/doas /usr/bin/lsof /| /usr/bin/grep -E --color=auto 'DEL|deleted'
end
function delc
    /usr/bin/doas /usr/bin/lsof /| /usr/bin/grep -E 'DEL|deleted' | /usr/bin/wc -l
end
function ncdu
    /usr/bin/ncdu -x -rr $argv
end
function uname
    /usr/bin/uname -a
end

#git
function gaa
    /usr/bin/git add .
end
function gcm
    /usr/bin/git commit -m $argv
end
function gca
    /usr/bin/git commit --amend
end
function grl
    /usr/bin/git reflog
end
function glg
    /usr/bin/git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --branches
end
function glgpg
    /usr/bin/git log --show-signature -1
end
function git-gc
    /usr/bin/git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc
    /usr/bin/git gc --aggressive
end
function ggg
    /usr/bin/git commit --amend --reset-author --no-edit
    /usr/bin/git rebase --continue
end

#gentoo
function emerge
    PYTHONOPTIMIZE=0 /usr/bin/emerge $argv
end
function update
    /usr/bin/emerge --deep --verbose --changed-use --newuse --changed-deps=y --with-bdeps=y --jobs --update @world
end
function emerge-check
    /usr/bin/emerge --deep --verbose --changed-use --newuse --changed-deps=y --with-bdeps=y --jobs @world
end
function quickpkg
    /usr/bin/quickpkg --include-config=y $argv
end
function smart-live-rebuild
    /usr/bin/smart-live-rebuild -f '!zfs' $argv
end
function eqf
    /usr/bin/equery f $argv
end
function equ
    /usr/bin/equery u -i $argv
end
function eqh
    /usr/bin/equery h $argv
end
function eqa
    /usr/bin/equery a --overlay-tree $argv
end
function eqb
    /usr/bin/equery b $argv
end
function eql
    /usr/bin/equery l $argv
end
function eqd
    /usr/bin/equery d $argv
end
function eqg
    /usr/bin/equery g $argv
end
function eqk
    /usr/bin/equery k $argv
end
function eqm
    /usr/bin/equery m $argv
end
function eqy
    /usr/bin/equery y $argv
end
function eqs
    /usr/bin/equery s $argv
end
function eqss
    /usr/bin/equery s --bytes $argv
end
function eqsss
    eqs $argv
    eqss $argv
end
function eqw
    /usr/bin/equery w $argv
end
function etcat
    /usr/bin/equery l -o -p $argv
end
