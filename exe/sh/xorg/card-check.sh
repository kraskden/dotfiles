#!/bin/bash

CARD=$(vcard)
GPU_ON=$(cat /proc/acpi/bbswitch | grep ON)

if [[ -z $GPU_ON && $CARD == "nvidia" ]]; then
    notify-send -u critical "GPU IS NOT ENABLED"
elif [[ ! -z $GPU_ON && $CARD == "intel" ]]; then
    notify-send -u critical "GPU IS NOT TURNED OFF"
fi

