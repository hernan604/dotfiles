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
#   \curl -L https://get.rvm.io | bash -s -- --autolibs=read-fail
#   rvm install ruby
#   rvm alias create default ruby-2.2.3
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#GO LANG
export GOPATH=~/go
export PATH=$PATH:~/go/bin

#JAVA
if [[ -e $HOME/Downloads/jdk1.7.0_71 ]]
    then
        export JAVA_HOME=$HOME/Downloads/jdk1.7.0_71
        export PATH=$JAVA_HOME/bin:$PATH
elif [[ -e $HOME/Downloads/jdk1.7.0_80 ]]
    then
        export JAVA_HOME=$HOME/Downloads/jdk1.7.0_80
        export PATH=$JAVA_HOME/bin:$PATH
fi

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
NVM_PATH="~/.nvm/nvm.sh"
NVM_DIR="~/.nvm"
if [[ -e $NVM_PATH ]]
    then
        source $NVM_PATH
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

_nvm_install() {
    mkdir $NVM_DIR
    cd $NVM_DIR
    curl https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
    nvm install stable
    nvm alias default stable
    source $HOME/.bashrc
}

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
    #$(setxkbmap -layout us -variant intl)
fi

#`setxkbmap -layout us -variant intl`
#`setxkbmap -layout br`

if [[ -e /usr/local/bin/xset ]] ; then
    #increase keyboard commands per second key pressed
    xset r rate 250 50
    # dont beep!!
    xset b off
fi

if [[ -e $HOME/.Xresources ]] && [[ -e /usr/local/bin/xrdb ]] ; then xrdb -merge $HOME/.Xresources ; fi

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

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

new_deploy () {
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

# set vim as default editor for git
export VISUAL=vim
export EDITOR="$VISUAL"

[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && source /usr/local/share/bash-completion/bash_completion.sh

TERM="xterm-256color"

alias firefox="sudo -u admin -H firefox"
alias chrome="sudo -u admin -H chrome"
alias thunderbird="sudo -u admin -H thunderbird"
alias transmission="sudo -u admin -H transmission-gtk"

export XAUTHORITY="/home/public/${USER}_Xauthority"

# xterm transparency with transset
#[ -n "$XTERM_VERSION" ] && transset --id "$WINDOWID" .9 >/dev/null
# grephere
grephere () {
    CMD="grep -Hr --color $1 ."
    echo "$CMD"
    `$CMD`
}

cgrep() {
    grep -Hr --color $@
}

if [[ -e /usr/local/bin/setxkbmap ]] ; then
    setxkbmap -layout br 
fi
#setxkbmap -layout br -variant thinkpad
if [[ -e $HOME/.bashrc_custom ]] ; then
    source $HOME/.bashrc_custom
fi
