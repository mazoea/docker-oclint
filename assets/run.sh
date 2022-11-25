#!/bin/bash

if [[ "x$1" == "x" ]]; then
    echo "Using version because no dir provided"
    oclint --version
else
    find $1 -type f -name "*.cpp" -o -name "*.cc" -o -name "*.c" | xargs oclint -p $1
fi
