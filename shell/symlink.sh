#!/bin/sh
#1.0.0
#2020-07-12

exit

#generate symlinks in $HOME

profile="${HOME}/.profile"
if ! [ -L "${profile}" ];then
	ln -sv "${XDG_CONFIG_HOME}/shell/profile" "${HOME}/.profile"
fi

xinitrc="${HOME}/.xinitrc"
if ! [ -L "${xinitrc}" ];then
	ln -sv "${XDG_CONFIG_HOME}/shell/xinitrc" "${HOME}/.xinitrc"
fi

ssh="${HOME}/.ssh"
if ! [ -L "${ssh}" ];then
	ln -sv "${XDG_CONFIG_HOME}/ssh" "${HOME}/.ssh"
fi

dbus="${HOME}/.dbus"
if ! [ -L "${dbus}" ];then
	ln -sv "${XDG_CACHE_HOME}/dbus" "${HOME}/.dbus"
fi

java="${HOME}/.java"
if ! [ -L "${java}" ];then
	ln -sv "${XDG_CACHE_HOME}/java" "${HOME}/.java"
fi

icons="${HOME}/.icons"
if ! [ -L "${icons}" ];then
	ln -sv "${HOME}/.local/share/icons" "${HOME}/.icons"
fi

pki="${HOME}/.pki"
if ! [ -L "${pki}" ];then
	ln -sv "${HOME}/.local/share/pki" "${HOME}/.pki"
fi

