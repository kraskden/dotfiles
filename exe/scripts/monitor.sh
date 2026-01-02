#!/bin/bash

XRANDR_CONNECTED=$(xrandr | grep -w "connected")
EXTERNAL=$(echo "$XRANDR_CONNECTED"  | grep -e '^DP.*' | cut -d ' ' -f 1)
INTERNAL=$(echo "$XRANDR_CONNECTED" | grep 'eDP' | cut -d ' ' -f 1)

echo "monitor utility: detected monitors"
echo "EXTERNAL: $EXTERNAL"
echo "INTERNAL: $INTERNAL"

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
