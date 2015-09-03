#!/bin/bash

touch diff_files\(1\).ext diff_files.ext file\(1\).ext \
    file1.ext file.ext new_file\(1\).ext new_file.ext \
    other\ file\(1\).ext other\ file.ext some_file\(1\).ext

echo "stuff" > diff_files\(1\).ext

duplicate_remover.sh ./

files=`ls *.ext`
expected='diff_files(1).ext
diff_files.ext
file1.ext
file.ext
new_file.ext
other file.ext
some_file(1).ext'

if [[ $files == $expected ]]
    then
    echo "PASS"
else
    echo "FAIL"
    echo "got: '$files'"
    echo "expected: '$expected'"
fi
