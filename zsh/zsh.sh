if [ "$(id -u)" -ne 0 ];then echo "Requires root";exit 1;fi
echo "ZDOTDIR=\"\${XDG_CONFIG_HOME}/zsh\"" >| /etc/zsh/zshenv
