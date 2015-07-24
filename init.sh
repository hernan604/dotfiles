#!/usr/bin/env bash

PWD=`pwd`
##FILES=$(git ls-files)
for f in ".bashrc" ".dataprinter" ".mc" ".screenrc" ".vimrc" ".Xresources" ".i3status.conf" ".tmux.conf" ".perltidyrc" ".i3"
    do
        echo "Working on: $f"
        source="$PWD/$f"
        destiny="$HOME/$f"
        if [ ! -e $destiny ]
            then
            `ln -s $source $destiny`
        else
            if [ -L $destiny ]
            then
                echo "[ok] $f is link"
            elif [ -f $destiny ]
            then
                echo "[warn]$f is file"
            elif [ -d $destiny ]
            then
                echo "[warn]$f is Directory"
            fi
        fi
    done

# Vim color schemes
if [ ! -e $HOME/.vim/colors ]
then
    echo "=> Creating ~/.vim/colors"
    if [ ! -e $HOME/.vim/ ]
    then
        mkdir $HOME/.vim
    fi
        ln -s "$HOME/dotfiles/vim-themes" "$HOME/.vim/colors"
fi

# Fonts
./install_gohufont.sh

echo "=> updating X-resources"
xrdb -merge "$HOME/.Xresources"

# Remove no-bitmap file and allow custom fonts in X
if [ -e "/etc/fonts/conf.d/70-no-bitmaps.conf" ]
    then
    echo "=> Removing *no-bitmap* to allow custom fonts in X: rm /etc/fonts/conf.d/70-no-bitmaps.conf"
    sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
fi

source install_vundle.sh
source install_packages.sh
source install_perlbrew.sh
source tips.sh
