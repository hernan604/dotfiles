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
xset s on -dpms # power monitor down when idle / screensaver

BASHRC_CUSTOM="~/.bashrc_custom"
if [[ -f $BASHRC_CUSTOM ]]; then
    source $BASHRC_CUSTOM
fi

if [[ -f "$HOME/perl5/lib/perl5/local/lib.pm" ]]; then
    eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"
fi

perl ~/dotfiles/userhome/files/banner.pl

ZSH_THEME="robbyrussell"

if [[ -e /usr/local/bin/setxkbmap ]] ; then
    if [[ $(ifconfig) =~ 67:aa ]] ; then
        setxkbmap -layout br -variant thinkpad
    fi
    #setxkbmap -layout us -variant intl
    #setxkbmap br
fi

if [[ -e /usr/local/bin/xset ]] ; then
    xset r rate 250 50
    xset s off -dpms
fi

if [[ -e ~/.bashrc_custom ]] ; then
  source ~/.bashrc_custom
fi

perl ~/dotfiles/userhome/files/banner.pl

LOCALLIB="$HOME/perl5/lib/perl5"
if [[ -d $LOCALLIB ]]; then
    eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"
fi

NOW=$(date)
echo $NOW

create_ssh_key (){
    echo "Enter your email:"
    read email
    echo ssh-keygen -t rsa -b 4096 -C "$email"
    ssh-keygen -t rsa -b 4096 -C "$email"
}

open_tunnel (){
    ip="$1"
    ssh -C2TNv -D 0.0.0.0:8080 pi@$ip
}

open_tunnel_chrome () {
    google-chrome-stable --proxy-server="socks5://localhost:8080" --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost"
}


cgrep() {
    grep -Hr --color $@
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

export EDITOR=vim

PERLBREW="$HOME/perl5/perlbrew/etc/bashrc"
if [[ -f $PERLBREW ]]; then
    source $PERLBREW
fi

# export PERL_CPANM_OPT='--mirror http://www.cpan.org --mirror http://mirror.nbtelecom.com.br/CPAN/ --mirror http://linorg.usp.br/CPAN/ '
export PERL_CPANM_OPT='--mirror http://www.cpan.org'

# disable perl make dist MYMETA.yml inclusion in distribuition file
export NO_META=1

#NVM
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#if [[ -f "$NVM_DIR/nvm.sh" ]]; then
#    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#    #nvm use --delete-prefix  --lts --silent
#fi

_nvm_install() {
    NVM_DIR="$HOME/.nvm"
    mkdir $NVM_DIR
    cd $NVM_DIR
    curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash
    nvm install stable
    nvm alias default stable
    source $HOME/.bashrc
}

#setxkbmap -layout br -variant thinkpad
#setxkbmap -layout br
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"




#export TERM='xterm-256color'
export TERM='screen-256color'

export LANG="en_US.UTF-8"
export MM_CHARSET="UTF-8"



#source "$HOME/.bashrc_custom"
CHROME_BIN=chromium-browser

# git push origin $current branch
alias gpob="branch=\$(git branch | grep \* | awk '{print \$2}'); git push origin \$branch"


if [[ -e /usr/local/bin/xsetroot ]] ; then
    perl -e 'my $colors = ["#dd00ee","#d0ed0e","#00bb77","#7700bb","#0077bb","#77bb00","#ed0ed0"]; my $min=0; my $max=scalar @{$colors}; my $sel = $min + int(rand($max - $min)); my $color = $colors->[$sel] ; `xsetroot -solid "$color" `;'
fi

export XAUTHORITY="/tmp/${USER}_Xauthority"

alias firefox="sudo -u admin -H firefox"
alias chrome="sudo -u admin -H chrome"
#alias thunderbird="sudo -u admin -H thunderbird"
alias transmission="sudo -u admin -H transmission-gtk"

if [[ -f ~/.zshrc_custom ]]; then
    source ~/.zshrc_custom
fi

if [[ -e ~/.plenv ]] ; then
  # plenv initialization
  export PATH="$HOME/.plenv/bin:$PATH"
  eval "$(plenv init -)"
; fi 

