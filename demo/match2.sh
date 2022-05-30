#!/bin/bash

files_dir=$1

if [ -z $files_dir ]; then
    echo "Error: files dir is undefined"
fi

files=$( find ${files_dir} -type f )
for file1 in $files; do
        for file2 in $files; do
                echo "checking $file1 and $file2"
                if [[ $file1 != $file2 && -e $file1 && -e $file2 ]]; then
                        if diff $file1 $file2 > /dev/null; then
                                echo "$file1 and $file2 are duplicates"
                                rm -v $file2
                        fi
                fi
        done
done
