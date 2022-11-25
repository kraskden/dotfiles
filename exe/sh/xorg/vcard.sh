#!/bin/bash

CONF_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/vcard.conf"

CARD=$(cat $CONF_FILE 2> /dev/null)
CARD=${CARD:-intel}
if [[ -z $1 ]]; then
    echo $CARD
else
    if [[ $1 == "intel" ]]; then
        echo intel > $CONF_FILE
    elif [[ $1 == "nvidia" ]]; then
        echo nvidia > $CONF_FILE
    elif [[ $1 == "switch" ]]; then
        NEXT_CARD=$([ $CARD == "intel" ] && echo "nvidia" || echo "intel")
        echo $NEXT_CARD > $CONF_FILE
    fi
fi
