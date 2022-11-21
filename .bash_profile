#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTORS=1.25
export PATH="${PATH}:/home/den/bin"
export RANGER_LOAD_DEFAULT_RC=false

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    # Custom wrapper aroung startx and nvidia-xrun
	exec xorg-start
fi
