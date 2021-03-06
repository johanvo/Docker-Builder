#!/bin/bash

runtest () {
    echo ""
    echo "Testing tag $1"
    echo " > Cleaning... "
    make clean TAG=$1 > /dev/null 2>&1
    echo " > Building... "
    make build TAG=$1 > /dev/null 2>&1
    echo " > Running... "
    make run TAG=$1 > /dev/null 2>&1
    echo " > Sleeping 15 seconds... "
    sleep 15
    echo -n " > Testing... "
    make test TAG=$1 #> /dev/null 2>&1
    [[ $? == 0 ]] && echo -e "\e[1;32mOK\e[0m" || echo -e "\e[1;31mFAILURE\e[0m"
    echo " > Stopping... "
    make stop TAG=$1 > /dev/null 2>&1
}

runtest "5.6"
runtest "7.0"
runtest "7.1"
runtest "7.2"
runtest "7.3"
runtest "7.4-codecasts"
