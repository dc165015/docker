#!/bin/bash

source ./funcs.sh

read -p "use proxy?(yes/no)" prx && [ $prx="yes" ] && proxy

source ./packages.sh

sudo cp ./*.sources.list /etc/apt
source ./settings.sh

notify Congratulations! Development environment is now set up!
