#!/bin/bash

# Sync random files from SRC directory with size limit
# I use it for syncing my music with old music playe

set -e 

AWK_SCRIPT='
    BEGIN { SIZE=0 } 
    { 
        SIZE += $2; 
        if ( SIZE < LIMIT ) print $1 
    }
'

if [[ -z $1 || -z $2 ]]; then
    echo "Usage: $0 SRC DEST [LIMIT_MB]"
    exit 1
fi

if [[ -z $3 ]]; then
    rsync -av "$1" "$2"
else
    FILE=$(mktemp)
    find "$1" -name '*.mp3' -printf '%p\0%s\n' | shuf | \
        awk -F '\0' -v LIMIT=$(("$3"*1024*1024)) "$AWK_SCRIPT" > "$FILE"
    rsync -av --files-from="$FILE" "$2"
    rm "$FILE"
fi