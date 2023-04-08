#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export PATH="${PATH}:/home/den/bin"
export SCRIPTS="/home/den/exe/scripts"
export APPLICATIONS="/home/den/.local/share/applications"
export CM_LAUNCHER=rofi

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
