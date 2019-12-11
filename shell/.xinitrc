#!/usr/bin/env sh
if [ -d /etc/X11/xinit/xinitrc.d ];then
	for f in /etc/X11/xinit/xinitrc.d/?*;do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

defaultserverargs="-nolisten tcp"

/usr/local/bin/clean-serverauth

xset s off &
xset -dpms &

#/usr/bin/compton -C --no-fading-openclose -G --shadow-ignore-shaped --backend glx --paint-on-overlay --vsync opengl-swc &

#current
#/usr/bin/compton -C --no-fading-openclose -G --shadow-ignore-shaped --paint-on-overlay &

exec i3

#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3

