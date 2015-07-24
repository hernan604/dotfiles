#!/usr/bin/env bash
echo "Install packages"
distro=`uname -v`
echo $distro
if echo $distro | grep -q "Ubuntu" 
    then
    echo "Installing common ubuntu packages"
    cmd="sudo apt-get install -y build-essential i3 i3lock i3status i3-wm suckless-tools mc chromium-browser htop"
    echo $cmd
    $cmd
else 
    echo "Install your packages manually."
fi
