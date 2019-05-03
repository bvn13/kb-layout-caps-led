#!/bin/bash

echo $$ > /tmp/kb-layout-signal-watcher.pid

CAPS_INPUT=$(ls /sys/class/leds/ | grep caps | head -n 1)

echo $CAPS_INPUT

PREVIOUS_KB_LAYOUT=""

while :
do
    CURRENT_KB_LAYOUT=$(cat /tmp/kb-layout)

    if ! [[ "$PREVIOUS_KB_LAYOUT" == "$CURRENT_KB_LAYOUT" ]]; then
        if [[ "$CURRENT_KB_LAYOUT" == "1" ]]; then
            echo 0
            echo 0 | sudo tee "/sys/class/leds/$CAPS_INPUT/brightness"
        else
            echo 1
            echo 1 | sudo tee "/sys/class/leds/$CAPS_INPUT/brightness"
        fi
        PREVIOUS_KB_LAYOUT="$CURRENT_KB_LAYOUT"
    fi

    sleep .1
done
