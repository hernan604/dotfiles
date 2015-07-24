#!/usr/bin/env bash

echo "
X11 SECURITY
------------

    Include the following in /etc/X11/xorg.conf

    Section "ServerFlags"
        Option "DontVTSwitch" "true"
    EndSection

ENABLE BITMAP FONTS
-------------------

    rm /etc/fonts/conf.d/70-no-bitmaps.conf

CRONTAB
-------

    Keel $HOME/.external_ip updated 
    */5 * * * * $HOME/dotfiles/ip_update.sh

XTERM 256colors:

    sudo aptitude install ncurses-term

OTHER SOFTWARES TO INSTALL:

    perltidy 
    cpanm JavaScript::Beautifier JSON::XS

"
