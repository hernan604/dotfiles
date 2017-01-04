#!/usr/bin/env bash
##FILES=$(git ls-files)
for f in ".bashrc" ".dataprinter" ".mc" ".screenrc" ".vimrc" ".Xresources" ".i3status.conf" ".tmux.conf" ".perltidyrc" ".i3" ".login_conf"
    do
        echo "Working on: $f"
        source="$PWD/userhome/files/$f"
        destiny="$HOME/$f"
        if [ ! -e $destiny ]
            then
            cmd="ln -s $source $destiny"
            `$cmd`
        else
            if [ -L $destiny ]
            then
                echo "[ok!!] $f is link"
            elif [ -f $destiny ]
            then
                echo "[warn]$f is file"
            elif [ -d $destiny ]
            then
                echo "[warn]$f is Directory"
            fi
        fi
    done
