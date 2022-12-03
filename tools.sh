#!/bin/bash

u () {
  pm uninstall --user 0 $(echo $1 | sed "s/package://g")
}

i () {
  cmd package install-existing $(echo $1 | sed "s/package://g")
}

l () {
  case $1 in
  s) pm list packages -s | grep $2;;
  *) pm list packages | grep $1;;
  esac
}

ua () {
  packages=("$@")
  for package in ${packages[@]}; do
    u $package      
  done
}

ual () {
  query=$(l s $1)
  [ -z ${query[@]} ] && {
    return
  }
  echo UNINSTALL ${query[@]} [y/N]:
  read response
  [ $response == "y" ] && {
    ua ${query[@]}
  }
}

u_q () {
  strings=("$@")
  for string in ${strings[@]}; do
    u $string
  done
}

ual_q () {
  strings=("$@")
  for string in ${strings[@]}; do
    ual $string
  done
}

#OPPO A16K SAFE BLOATWARES
yes | ual_q maps phonemanager heytap.music music files fileman gall game photos themesto cloud keep you android.cale roam po.cam video googlequick market leassis
u package:com.google.android.gm package:com.coloros.gamespaceui
