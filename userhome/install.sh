#!/usr/bin/env bash
##FILES=$(git ls-files)
for f in ".bashrc" ".dataprinter" ".mc" ".screenrc" ".vimrc" ".Xresources" ".i3status.conf" ".tmux.conf" ".perltidyrc" ".i3"
    do
        echo "Working on: $f"
        source="$PWD/userhome/files/$f"
        destiny="$HOME/$f"
        if [ ! -e $destiny ]
            then
            `ln -s $source $destiny`
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
