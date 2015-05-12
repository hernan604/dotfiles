#!/usr/bin/env bash

i3status | while :
do
    read line
#   gmail=`perl gmail.pl`
    perl_version=`perl -e "print 'perl('.$^V.')'"`
    echo "$perl_version | $line" || exit 1
done

exit 2
