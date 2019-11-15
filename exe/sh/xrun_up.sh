#!/bin/bash

i3_conf="/home/denis/.config/i3/config"
i3_new_conf="/home/denis/.config/i3-nvidia/config"

syn_conf="/etc/X11/xorg.conf.d/70-synaptics.conf"
dest_X11_conf="/etc/X11/nvidia-xorg.conf.d/"

firefox_icon=""
chrome_icon=""

cp $i3_conf $i3_new_conf
sed -i "s/$firefox_icon/$chrome_icon/" $i3_new_conf
sed -i "s/firefox/chromium/g" $i3_new_conf

if [[ $UID -eq 0 ]]
then
	echo "Updated xorg conf..."
	cp $syn_conf $dest_X11_conf
fi
