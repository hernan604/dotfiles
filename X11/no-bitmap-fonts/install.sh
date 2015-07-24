#!/usr/bin/env bash
# Remove no-bitmap file and allow custom fonts in X
if [ -e "/etc/fonts/conf.d/70-no-bitmaps.conf" ]
    then
    echo "=> Removing *no-bitmap* to allow custom fonts in X: rm /etc/fonts/conf.d/70-no-bitmaps.conf"
    sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
fi
