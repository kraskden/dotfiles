#!/bin/bash

# Init Xorg server with NVIDIA or Intel graphics
CARD=$(vcard)

if [[ $CARD == "intel" ]]; then
    exec startx
elif [[ $CARD == "nvidia" ]]; then
    exec nvidia-xrun
fi
