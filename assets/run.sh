#!/bin/bash

if [[ "x$1" == "x" ]]; then
    echo "Using version because no dir provided"
    oclint --version
else
    SRCDIR=$1
    if [[ "x$2" != "x" ]]; then
        SRCDIR=$2
    fi
    echo "Looking in $SRCDIR for sources, project path $1"
    find $SRCDIR -type f -name "*.cpp" -o -name "*.cc" -o -name "*.c" | xargs oclint -p $1
fi
