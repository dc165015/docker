#!/bin/bash

source ./funcs.sh

if (! checksu) then
  echo please run as root!;
  exit 1;
fi

read -p "use proxy?(yes/no)" prx && [ $prx="yes" ] && proxy

source ./packages.sh

cp ./*.sources.list /etc/apt
source ./settings.sh

notify Congratulations! Development environment is now set up!
