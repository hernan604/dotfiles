#!/usr/bin/env bash
echo "Installing vim"
# Vim color schemes
if [ ! -e $HOME/.vim/colors ]
then
    echo "=> Creating ~/.vim/colors"
    if [ ! -e $HOME/.vim/ ]
    then
        mkdir $HOME/.vim
    fi
    ln -s "$HOME/dotfiles/vim/colors" "$HOME/.vim/colors"
fi

$PWD/vim/vundle/install.sh
