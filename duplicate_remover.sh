#!/bin/bash

# A script for finding and removing duplicate files

if [[ $# -ne 1 ]]
    then
    echo "usage: $0 directory_to_scan"
    exit 1
fi

directory_to_scan=$1
