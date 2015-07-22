# PERLBREW
source ~/perl5/perlbrew/etc/bashrc

if [[ -e $HOME/.user.env ]]
    then
    source ~/.user.env
else
    echo "[.bashrc] File not found: '$HOME/.user.env'. Please create it. ";
fi

#export NVM_DIR="/home/hernan/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#GO LANG
export GOPATH=~/go
export PATH=$PATH:~/go/bin

#JAVA
export JAVA_HOME=$HOME/Downloads/jdk1.7.0_71
export PATH=$JAVA_HOME/bin:$PATH

#LUA ROCKS
export LUA_PATH="$HOME/.luarocks/share/lua/5.1/?.lua;$HOME/.luarocks/share/lua/5.1/?/init.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;./?.lua;/usr/share/lua/5.1/?.lua;/usr/share/lua/5.1/?/init.lua;/usr/lib/lua/5.1/?.lua;/usr/lib/lua/5.1/?/init.lua"
export LUA_CPATH="$HOME/.luarocks/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/?.so;./?.so;/usr/lib/lua/5.1/?.so;/usr/lib/lua/5.1/loadall.so"
export PATH=$HOME/.luarocks/bin:$PATH


#irssi
alias irssi=start_irssi
start_irssi() {
    TERM="screen-256color"
    $HOME/irssi/bin/irssi $@
}

#NVM
source ~/.nvm/nvm.sh

#JS spidermonkey
export PATH="$PATH:/usr/include/js-17.0"

#packer - hashicorp
export PATH="$PATH:$HOME/packer"


# keyboard layout
if [ "$DOTFILES_MODE" != "" ] && [ "$DOTFILES_MODE" == "ET" ]
    then
    `setxkbmap -layout us -variant intl`
    `xrandr --output LVDS-1-0 --mode 1600x900 --output VGA-1-0 --mode 1680x1050 --right-of LVDS-1-0`
    `xrandr --output LVDS1 --mode 1600x900 --output VGA1 --mode 1680x1050 --right-of LVDS1`
else 
        echo 'br'
    `setxkbmap br`
    `xrandr --output DVI-0 --mode 1280x1024 --left-of DVI-1 --output DVI-1 --mode 1600x900`
fi

`xset r rate 250 50`

if [[ -e $HOME/.Xresources ]]; then xrdb -merge $HOME/.Xresources ; fi

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"


dynamic_bash_prompt() {
    DIR=`pwd`;
    if [[ "$DIR" == *webdrive*  ]]; then
#       export PS1="[\e[0;32m\u\e[m\e[0;33m@\e[0;31m\h\e[m \e[0;37m\W\e[m] [\e[1;31m webdrive\e[m ] $ " ;
        export PS1='\u@\h \w [ *webdrive* ] $ '
    elif [[ "$DIR" == */home/hernan* ]]; then
        export PS1='\u@\h \w $ '
#       export PS1="[\e[0;32m\u\e[m\e[0;33m@\e[0;31m\h\e[m \e[1;33m\W\e[m] $ " ;
    else 
        export PS1="[\w] $ ";
    fi; 
}
PROMPT_COMMAND="dynamic_bash_prompt"

# Android SDK + NDK: http://perltricks.com/article/97/2014/6/16/How-to-build-Perl-on-Android-4-4
export PATH=$PATH:$HOME/android-sdk-linux/tools:$HOME/android-sdk-linux/platform
export ANDROID_NDK=$HOME/android-sdk-linux/android-ndk-r10e
export TARGET_ARCH=arm-linux-androideabi
export ANDROID_TOOLCHAIN=/tmp/my-toolchain-arm-linux-androideabi
export SYSROOT=$ANDROID_TOOLCHAIN/sysroot
export TARGETDIR=/mnt/asec/perl
export PATH=$PATH:$ANDROID_NDK/toolchains/$TARGET_ARCH-4.8/prebuilt/linux-x86_64/bin

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
elif [ -e /usr/share/terminfo/x/xterm+256color ] ; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi
