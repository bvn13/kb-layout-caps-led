#!/bin/bash

#gsettings get org.gnome.desktop.input-sources mru-sources

gsettings get org.gnome.desktop.input-sources sources | sed -e 's!\[!!g; s!\]!!g; s!), (!,!g; s!(!!; s!)!!g; s! !!g;' | awk -F, '{print $2}' | sed "s/'//g"
