#!/bin/bash

source ./funcs.sh

checksu || exit 1;

read -p "use proxy?(yes/no)" prx && [ $prx="yes" ] && proxy;

source ./packages.sh

source ./settings.sh


notify Congratulations! Development environment is now set up!
