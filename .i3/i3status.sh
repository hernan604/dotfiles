#!/usr/bin/env bash
source ~/.bashrc

i3status | while :
do
    read line
#   gmail=`perl gmail.pl`
    perl_version=`perl -e "print 'perl('.$^V.')'"`

    external_ip="$HOME/.external_ip"
    ip=$(cat $external_ip)

    echo "$perl_version | $ip | $line" || exit 1
done

exit 2
