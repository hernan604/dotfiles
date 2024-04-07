#!/usr/bin/env bash
echo "Install packages"
distro=`uname -v`
echo $distro
if echo $distro | grep -q "Ubuntu" 
    then
    source $PWD/packages/ubuntu/install.sh
fi
