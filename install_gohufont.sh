#!/usr/bin/env bash
if [ ! -e $HOME/.fonts/gohufont-2.0 ]
    then
echo "Installing gohufont"
gohufont_file="gohufont-2.0.tar.gz"
wget http://font.gohu.org/$gohufont_file
tar xvf gohufont-2.0.tar.gz
rm gohufont_file
cd gohufont-2.0
for i in *.gz; do gunzip $i ; done; 
mv ../gohufont-2.0 $HOME/.fonts

fc-cache -fv

fi


