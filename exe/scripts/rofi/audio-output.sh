#!/bin/bash

SINKS=$(pactl -f json list  sinks | jq -r '.[] | [.index, .description, .name] | @tsv')
ACTIVE_SINK=$(pactl info | grep 'Default Sink' | cut -d : -f 2 | xargs)

ACTIVE_ROFI_INDEX=$(echo "$SINKS" | grep -n "$ACTIVE_SINK" | cut -d : -f 1)
NAMES=$(echo "$SINKS" | cut -f 2)

SELECTED=$(echo "$NAMES" | rofi -dmenu -p 'Select a device: ' -i -a $(($ACTIVE_ROFI_INDEX - 1)))
DEVICE_ID=$(echo "$SINKS" | grep "$SELECTED" | cut -f 1)

COUNT=$(echo "$DEVICE_ID" | wc -l)
if [[ $COUNT == 1 ]]; then
    pactl set-default-sink "$DEVICE_ID"
fi
