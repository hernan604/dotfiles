#!/usr/bin/env bash
PWD="$(realpath $(realpath $(dirname $0))/../)"
if [[ $(uname) =~ 'FreeBSD' ]]; then
  $PWD/freebsd/install.sh
fi
$PWD/userhome/install.sh
$PWD/packages/install.sh
$PWD/fonts/install.sh
$PWD/perlbrew/install.sh
$PWD/vim/install.sh
$PWD/X11/install.sh
$PWD/extra/tips.sh
