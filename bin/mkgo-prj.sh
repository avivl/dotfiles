#!/bin/bash
gover=`goenv version|cut -d'(' -f 1`
if [ "$1" != "" ]; then
    goenv local $1 2>/dev/null
    if [ $? -eq 0 ]; then
        goenv local $1
        gover=`goenv version|cut -d'(' -f 1`
    else
        echo "Did not found go version $1 Exiting!"
        exit
    fi
else
    echo "No Go version selected. using $gover"
fi
govendor init
