#!/bin/bash

EXTERNAL=DP-2
INTERNAL=eDP-1-1

enable_external() {
    xrandr --output $EXTERNAL --primary --mode 1920x1080 --rate 165 --output $INTERNAL --off;
}

enable_internal() {
    xrandr --output $EXTERNAL --off --output $INTERNAL --primary --auto;
}

if [[ $1 == "external" ]]; then
    enable_external;
elif [[ $1 == "internal" ]]; then
    enable_internal;
elif [[ $1 == "switch" ]]; then
    xrandr | grep $EXTERNAL | grep "primary" > /dev/null
    if (( $? == 0 )); then
        enable_internal;
    else
        enable_external;
    fi
fi
