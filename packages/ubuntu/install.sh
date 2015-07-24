#!/usr/bin/env

echo "Installing common ubuntu packages"
cmd="sudo apt-get install -y build-essential i3 i3lock i3status i3-wm suckless-tools mc chromium-browser htop tmux screen exuberant-ctags tree ncurses-term"
echo $cmd
$cmd
