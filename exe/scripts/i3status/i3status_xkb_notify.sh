#!/bin/bash

while true; do
    xkb-switch -w
    killall -SIGUSR1 i3status
done
