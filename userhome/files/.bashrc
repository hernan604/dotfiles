echo "initializing bashrc ..."
# PERLBREW
export EDITOR=vim
source ~/perl5/perlbrew/etc/bashrc
export PERL_CPANM_OPT='--mirror http://mirror.nbtelecom.com.br/CPAN/ --mirror http://linorg.usp.br/CPAN/ --mirror http://www.cpan.org'

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

#$HOME/bin
export PATH="$PATH:$HOME/bin"

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
#if [ "$DOTFILES_MODE" != "" ] && [ "$DOTFILES_MODE" == "ET" ]
#    then
#    #`setxkbmap -layout us -variant intl`
#    `setxkbmap -layout br`
#    `xrandr --output LVDS-1-0 --mode 1600x900 --output VGA-1-0 --mode 1680x1050 --right-of LVDS-1-0`
#    `xrandr --output LVDS1 --mode 1600x900 --output VGA1 --mode 1680x1050 --right-of LVDS1`
#elif [ "$DOTFILES_MODE" != "" ] && [ "$DOTFILES_MODE" == "EOKOE" ]
#    then
#    `xrandr --output LVDS1 --mode 1366x768 --output VGA1 --mode 1920x1080 --right-of LVDS1`
#else 
#    #`setxkbmap br`
#    `setxkbmap -layout us -variant intl`
#    `xrandr --output DVI-0 --mode 1280x1024 --left-of DVI-1 --output DVI-1 --mode 1600x900`
#fi

HOSTNAME=$(hostname)
if [ $HOSTNAME == "euro" ] ; then
    main_screen="DP-0"
    second_screen="DP-3"
    #$(xrandr --output $second_screen --mode 3840x2160 --rotate left --output $main_screen --mode 3840x2160 --right-of $second_screen)
    $(xrandr --output $second_screen --mode 3840x2160 --rotate normal --output $main_screen --mode 3840x2160 --right-of $second_screen)
    $(setxkbmap -layout br)
fi

#`setxkbmap -layout us -variant intl`
#`setxkbmap -layout br`

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
#PROMPT_COMMAND="dynamic_bash_prompt"
dynamic_bash_prompt

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

alias ssh_key=function_ssh_key_generate
function_ssh_key_generate() {
    echo 'Enter user@domain to upload keys. ex. my_user@some-machine.com'
    read ssh_acc 
    ssh-keygen -t rsa
    ssh-copy-id $ssh_acc
}

alias ssh_tunnel=function_ssh_tunnel
function_ssh_tunnel() {
    echo "Please enter credentials ie: user@domain.com"
    read credentials
    echo "Please enter the proxy port ie. 9999"
    read port
    local cmd="ssh $credentials -ND $port -f"
    echo "$cmd"
    `$cmd`
    echo "Please enter the "
}


# SQUITCH
deploydb_last_version () {
   perl -e 'my $last = [ sort { $b <=> $a } grep {/^\d{1,4}-/} @ARGV]->[0]; $last =~ s/\.sql$//; print "$last"' `ls deploy_db/deploy/`
}

deploydb_next_version () {
   perl -e 'my $name = shift @ARGV; my $last = [ sort { $b <=> $a } grep {/^\d{1,4}-/} @ARGV]->[0]; $last =~ s/\.sql$//; $last =~ s/^(\d+)-.+/sprintf(q{%04d}, $1+1)/e;  print "$last-$name"' $1 `ls deploy_db/deploy/`
}

new_deploy (){
    sqitch add `deploydb_next_version $1` --requires `deploydb_last_version` -n "${*:2}"
    $EDITOR deploy_db/deploy/`deploydb_last_version`.sql
}


# disable perl make dist MYMETA.yml inclusion in distribuition file
export NO_META=1





open_tunnel (){
    ip="$1"
    ssh -C2TNv -D 0.0.0.0:8080 pi@$ip
}
open_tunnel_chrome () {
    google-chrome-stable --proxy-server="socks5://localhost:8080" --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost"
}






# saves every line in bash history (even with multiple terminals with screen/tmux)
export HISTCONTROL=ignoredups:erasedups #erase duplicates 
export HISTSIZE=999999    #number of lines or commands that are allowed in the history file (IN MEMORY)
export HISTFILESIZE=999999 #number of lines allowed to exist in the history file
shopt -s histappend #always append to bash_history... never overwrite it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r" # append and reload the history file after each command


# scaling attempts
export QT_DEVICE_PIXEL_RATIO=1
export GDK_SCALE=1
export GDK_DPI_SCALE=1

create_ssh_key (){
    echo "Enter your email:"
    read email
    echo ssh-keygen -t rsa -b 4096 -C "$email"
    ssh-keygen -t rsa -b 4096 -C "$email"
}

set_xterm_colors (){
    if [ `hostname` == "alienware" ] ; then
        echo "XTERM - adjusting colors (.bashrc) to alienware profile"
        echo -e '\e]11;rgb:00/00/00\a' #set xterm bg
        echo -e '\e]10;rgb:ff/ff/ff\a' #set xterm fg 
    elif [ `hostname` == "pc2" ] ; then
        echo "XTERM - adjusting colors (.bashrc) to alienware profile"
        echo -e '\e]11;rgb:00/00/00\a' #set xterm bg
        echo -e '\e]10;rgb:ff/ff/ff\a' #set xterm fg 
    fi
}
set_xterm_colors

set_xterm_title (){
    if [ -z "$1" ] ; then
        echo -en "\033]0;default title\a"
    else
        echo -en "\033]0;$1\a"
    fi
}
set_xterm_title

# set vim as default editor for git
export VISUAL=vim
export EDITOR="$VISUAL"

[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && source /usr/local/share/bash-completion/bash_completion.sh

# dont beep!!
xset b off

TERM="xterm-256color"

alias firefox="sudo -u admin -H firefox"
alias chrome="sudo -u admin -H chrome"
alias thunderbird="sudo -u admin -H thunderbird"
alias transmission="sudo -u admin -H transmission-gtk"

export XAUTHORITY="/home/public/${USER}_Xauthority"

# xterm transparency with transset
[ -n "$XTERM_VERSION" ] && transset --id "$WINDOWID" .9 >/dev/null
