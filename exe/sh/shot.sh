#!/bin/bash

path="$HOME/pics/shots"

maim $@ "$path/$(date +%d_%m_%y__%H:%M:%S).png"
