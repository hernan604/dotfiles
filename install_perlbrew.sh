#!/usr/bin/env bash

# checks if you are using perlbrew and install
perl_location=`which perl`

install_perlbrew() {
    perl_version="5.19.3"
    echo "installing perlbrew... $perl_version"
    if echo `which wget` | grep -q "wget" 
    then
        wget -O - http://install.perlbrew.pl | bash
    elif echo `which curl` | grep -q "curl" 
    then
        curl -L http://install.perlbrew.pl | bash
    elif echo `which fetch` | grep -q "fetch" 
    then
        fetch -o- http://install.perlbrew.pl | sh
    fi
    cores=`grep -c ^processor /proc/cpuinfo`
    perlbrew install -j $cores $perl_version
    sleep 2
    perlbrew switch $perl_version
}

if ! grep -q "perlbrew" $perl_location
then
    echo "perlbrew not running"
    install_perlbrew
fi

