source ~/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme robbyrussell
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

#setxkbmap -layout br -variant thinkpad
setxkbmap -layout us -variant intl
xset r rate 250 50

source ~/.bashrc_custom
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"
