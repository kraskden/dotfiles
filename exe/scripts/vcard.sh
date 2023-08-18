#!/usr/bin/bash

GPU_CONF=/etc/X11/gpu.conf.d
X_CONF=/etc/X11/xorg.conf.d/10-gpu.conf

is_nvidia() {
    if [[ $DISPLAY ]]; then
        echo $(glxinfo | grep 'NVIDIA Corporation')
    else
        echo $(readlink $X_CONF | grep 'nvidia')
    fi
    echo $IS_NVIDIA
}

print_state() {
    if [[ $(is_nvidia) ]]; then
        echo "nvidia"
    else 
        echo "hybrid"
    fi
}

switch() {
    if [[ $(is_nvidia) ]]; then
        sudo ln -sf $GPU_CONF/amd.conf $X_CONF
    else
        sudo ln -sf $GPU_CONF/nvidia.conf $X_CONF
    fi
}


if [[ $1 == "switch" ]]; then
    switch
    exit
fi
echo $(print_state)
