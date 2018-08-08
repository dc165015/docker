#!/bin/bash

source ./funcs.sh

if (! checksu) then
  echo please run as root!;
  exit 1;
fi

proxy

source ./packages.sh

sudo cp ./*.sources.list /etc/apt
source ./settings.sh

notify Congratulations! Development environment is now set up!
