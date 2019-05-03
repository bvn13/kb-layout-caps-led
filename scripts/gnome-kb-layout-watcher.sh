#!/bin/bash

echo $$ > /tmp/gnome-kb-layout-watcher.pid

MAIN_KB_LAYOUT=$(gsettings get org.gnome.desktop.input-sources sources | sed -e 's!\[!!g; s!\]!!g; s!), (!,!g; s!(!!; s!)!!g; s! !!g;' | awk -F, '{print $2}' | sed "s/'//g")

while :
do
    CURRENT_KB_LAYOUT=$(gsettings get org.gnome.desktop.input-sources mru-sources | sed -e 's!\[!!g; s!\]!!g; s!), (!,!g; s!(!!; s!)!!g; s! !!g;' | awk -F, '{print $2}' | sed "s/'//g")

    if [[ "$CURRENT_KB_LAYOUT" == "$MAIN_KB_LAYOUT" ]]; then
        echo "1" > /tmp/kb-layout
    else
        echo "0" > /tmp/kb-layout
    fi

    sleep .1
done
