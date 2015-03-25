# PERLBREW
source ~/perl5/perlbrew/etc/bashrc

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
export PATH=$HOME/.lua/rocks:$PATH

#irssi
alias irssi=$HOME/irssi/bin/irssi $@

#NVM
source ~/.nvm/nvm.sh
