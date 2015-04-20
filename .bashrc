# PERLBREW
source ~/perl5/perlbrew/etc/bashrc
source ~/.user.env

#export NVM_DIR="/home/hernan/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#GO LANG
export GOPATH=~/go
export PATH=$PATH:~/go/bin

#JAVA
export JAVA_HOME=/home/hernan/Downloads/jdk1.7.0_71
export PATH=$JAVA_HOME/bin:$PATH

#LUA ROCKS
export LUA_PATH="$HOME/.luarocks/share/lua/5.1/?.lua;$HOME/.luarocks/share/lua/5.1/?/init.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;./?.lua;/usr/share/lua/5.1/?.lua;/usr/share/lua/5.1/?/init.lua;/usr/lib/lua/5.1/?.lua;/usr/lib/lua/5.1/?/init.lua"
export LUA_CPATH="$HOME/.luarocks/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/?.so;./?.so;/usr/lib/lua/5.1/?.so;/usr/lib/lua/5.1/loadall.so"
export PATH=$HOME/.luarocks/bin:$PATH


#irssi
alias irssi=$HOME/irssi/bin/irssi $@

#NVM
source ~/.nvm/nvm.sh

#JS spidermonkey
export PATH="$PATH:/usr/include/js-17.0"

#packer - hashicorp
export PATH="$PATH:$HOME/packer"


# keyboard layout
if [ $DOTFILES_MODE == "home" ]; then
    `setxkbmap us`
    `xrandr --output LVDS-1-0 --mode 1600x900 --output VGA-1-0 --mode 1680x1050 --right-of LVDS-1-0`
else 
    `setxkbmap br`
    `xrandr --output DVI-0 --mode 1280x1024 --left-of DVI-1 --output DVI-1 --mode 1600x900`
fi

`xset r rate 250 50`


# screens
