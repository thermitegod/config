if [ "$(id -u)" -ne 0 ];then echo "Requires root";exit 1;fi
#echo "BASHRC_CONFIG_DIR=\"\${XDG_CONFIG_HOME}/bash\"" >| /etc/bash/bash_profile

#echo ". \"\${XDG_CONFIG_HOME}/bash/.bashrc\"" >| /etc/bash/bash.bashrc
echo "BASHRC_CONFIG_DIR=\"~/config/bash\"" >| /etc/bash/bash_profile


