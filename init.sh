#!/usr/bin/env bash

PWD=`pwd`
##FILES=$(git ls-files)
for f in ".bashrc" ".dataprinter" ".mc" ".screenrc" ".vimrc" ".Xresources" ".i3status.conf" ".tmux.conf" ".perltidyrc"
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
    echo "Creating ~/.vim/colors"
    if [ ! -e $HOME/.vim/ ]
    then
        mkdir $HOME/.vim
    fi
        ln -s "$HOME/dotfiles/vim-themes" "$HOME/.vim/colors"
fi

# i3
ln -s $HOME/dotfiles/.i3/i3status.sh $HOME/.i3/i3status.sh

# Fonts
./install_gohufont.sh

echo "updating X-resources"
xrdb -merge "$HOME/.Xresources"

# Remove no-bitmap file and allow custom fonts in X
if [ -e "sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf" ]
    then
    echo "Removing *no-bitmap* to allow custom fonts in X: rm /etc/fonts/conf.d/70-no-bitmaps.conf"
    sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
fi

echo "
X11 SECURITY:

    Include the following in /etc/X11/xorg.conf

    Section "ServerFlags"
        Option "DontVTSwitch" "true"
    EndSection

CRONTAB:

    Keel $HOME/.external_ip updated 
    */5 * * * * $HOME/dotfiles/ip_update.sh
"
