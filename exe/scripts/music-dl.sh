#!/bin/bash

MAIN_PLS='https://music.yandex.by/users/Fizzika.Net/playlists/3'

if [[ $1 == 'ysync' ]]; then
    exec python3 ~/prog/music-dl/main.py -i "$MAIN_PLS" ~/music
fi

exec python3 ~/prog/music-dl/main.py $@
