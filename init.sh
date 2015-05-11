#!/usr/bin/env bash

PWD=`pwd`
##FILES=$(git ls-files)
for f in {".bashrc",".dataprinter",".mc",".screenrc",".vimrc",".Xresources"}
    do
        echo "Working on: $f"
        if [ ! -e $HOME/$f ]
            then
            `ln -s $PWD/$f $HOME/$f`
        fi
    done

# Vim color schemes
if [ ! -e $HOME/.vim/colors ]
then
    if [ ! -e $HOME/.vim/ ]
    then
        mkdir $HOME/.vim
    fi
        ln -s "$HOME/dotfiles/vim-themes" "$HOME/.vim/colors"
fi

# Fonts
./install_gohufont.sh

echo "updating X-resources"
xrdb -merge "$HOME/.Xresources"
