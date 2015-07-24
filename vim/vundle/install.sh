#!/usr/bin/env bash

if [ ! -e $HOME/.vim/bundle/Vundle.vim ]
    then
    echo "Installing Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
