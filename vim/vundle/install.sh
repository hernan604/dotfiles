#!/usr/bin/env bash
vundle_dir="$HOME/.vim/bundle"
if [ ! -e $vundle_dir/Vundle.vim ]
    then
    echo "Installing Vundle"
    if [ ! -e $vundle_dir ]
    then
        mkdir $vundle_dir
    fi
    git clone https://github.com/gmarik/Vundle.vim.git $vundle_dir/Vundle.vim
fi
