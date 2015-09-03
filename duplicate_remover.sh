#!/bin/bash

# A script for finding and removing duplicate files

SAVEIFS=$IFS

IFS=$(echo -e "\n\b")

if [[ $# -ne 1 ]]
    then
    echo "usage: $0 directory_to_scan"
    exit 1
fi

directory_to_scan="$1"

duplicate_names=`find "$directory_to_scan" -name "*(1).*"`
potential_duplicates=`grep -c '(1)' <<< "$duplicate_names"`

processed=0
for file in $duplicate_names
    do
    original_name="${file/(1)/}"
    if diff "$original_name" "$file" &> /dev/null
        then
        ((processed++))
        echo "deleting '$file' $processed of $potential_duplicates"
        rm "$file"
    fi
done

IFS=$SAVEIFS
