#!/usr/bin/env bash

create_fonts_dir () {
  mkdir ~/.fonts
}

install_gohufont () {
  cd ~/.fonts
  wget https://font.gohu.org/gohufont-2.1-otb.tar.gz
  tar zxvf gohufont-2.1-otb.tar.gz
  mv gohufont-2.1-otb/* ~/.fonts
  rm -rf gohufont-2.1-otb
}

refresh_fonts () {
  fc-cache -fv
}

create_fonts_dir
install_gohufont
refresh_fonts
