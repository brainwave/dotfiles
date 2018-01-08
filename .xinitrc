export PATH=$PATH:"/home/brainwave/bin"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xbacklight -set 20

if [ -a "/sys/devices/platform/coretemp.0/hwmon/hwmon0/temp1_input" ] ; then
	cat ~/.config/i3status/config_hwmon0>~/.config/i3status/config
fi

if [ -a "/sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input" ];then
	cat ~/.config/i3status/config_hwmon1>~/.config/i3status/config
fi

if [ -a "/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input" ];then
	cat ~/.config/i3status/config_hwmon2>~/.config/i3status/config
fi

/usr/bin/xcalib /usr/share/color/icc/CustomMacRumors.icc

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec i3
