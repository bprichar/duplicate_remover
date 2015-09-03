#!/bin/bash

# A script for finding and removing duplicate files

SAVEIFS=$IFS

IFS=$(echo -e "\n")

if [[ $# -ne 1 ]]
    then
    echo "usage: $0 directory_to_scan"
    exit 1
fi

directory_to_scan="$1"

duplicate_names=`find "$directory_to_scan" -name "*(1).*"`

for file in $duplicate_names
    do
    echo $file
done

IFS=$SAVEIFS
