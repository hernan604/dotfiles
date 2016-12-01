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

    external ip is saved in: $HOME/.external_ip updated

    Add this in crontab to activate:
    */5 * * * * $HOME/dotfiles/extra/ip_update.sh

XTERM 256colors:

    sudo aptitude install ncurses-term

OTHER SOFTWARES TO INSTALL:

    perltidy 
    cpanm JavaScript::Beautifier JSON::XS

RUN FIREFOX AS ANOTHER USER * * *
    
    1. create firefox_users group and asign a new user to it

    sudo pw group add firefox_users
    sudo pw user mod admin -g firefox_users

    2. 

    adduser newUSER (without password -- also add this user into yourUserRunningXGroup) 
    chmod g-w,g+r,g+w /home/yourUserRunningX/.Xauthority ; ls -la /home/yourUserRunningX/ | grep Xauthority
    chown newUSER:firefox_users /home/yourUserRunningX/.Xauthority

    then, run firefox as this new user

    sudo -u admin -H firefox

