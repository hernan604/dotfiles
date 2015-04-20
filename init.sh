#!/usr/bin/env bash

PWD=`pwd`
IGNORE_FILES="README init.sh .gitignore "
FILES=$(git ls-files)
for f in $FILES
    do
        echo $f
        if [ ! -f $HOME/$f ]
            then
            [[ $IGNORE_FILES =~ $f ]] || `ln -s $PWD/$f $HOME/$f`
        fi
    done
