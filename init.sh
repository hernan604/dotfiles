#!/usr/bin/env bash

PWD=`pwd`
IGNORE_FILES="README init.sh .gitignore "
FILES=$(git ls-files)
for f in $FILES
    do
        echo $f
        if [ ! -e $HOME/$f ]
            then
            [[  $f =~ $IGNORE_FILES ]] || `ln -s $PWD/$f $HOME/$f`
        else
            echo "$HOME/$f already exists. not overwriting"
        fi
    done
