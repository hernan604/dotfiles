#!/usr/bin/env bash

ln -s $PWD/userhome/files/picom.conf ~/.config/picom.conf

files="
.screenrc.sh
.Xresources
.bashrc
.dataprinter
.i3
.i3status.conf
.login_conf
.mc
.perltidyrc
.screenrc
.tmux.conf
.vimrc
.xinitrc
.zshrc
"

for f in $files;
    do
        echo "Working on: $f"
        source="$PWD/userhome/files/$f"
        destiny="$HOME/$f"
        if [ ! -e $destiny ]
            then
            cmd="ln -s $source $destiny"
            `$cmd`
        else
            echo "Error: file already exists in [ $destiny ]"
            ls -la $destiny
        fi
    done
