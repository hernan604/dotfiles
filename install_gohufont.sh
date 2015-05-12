#!/usr/bin/bash
if [ ! -e $HOME/.fonts/gohufont-2.0 ]
    then
echo "Installing gohufont"
wget http://font.gohu.org/gohufont-2.0.tar.gz
tar xvf gohufont-2.0.tar.gz
cd gohufont-2.0
for i in *.gz; do gunzip $i ; done; 
mv ../gohufont-2.0 $HOME/.fonts

fc-cache -fv

fi


