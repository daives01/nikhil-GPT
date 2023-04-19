#! /bin/bash

# given a directory of transcripts, combine them into a single file
# usage: combine-scripts.sh <directory> <output file>

# check for correct number of arguments
if [ $# -ne 2 ]; then
    echo "usage: combine-scripts.sh <directory> <output file>"
    exit 1
fi

# check that the directory exists
if [ ! -d $1 ]; then
    echo "error: $1 is not a directory"
    exit 1
fi

# check that the output file does not exist
if [ -f $2 ]; then
    echo "error: $2 already exists"
    exit 1
fi

# create the output file
touch $2

# loop through the files in the directory
for file in $1/*; do
    # check that the file is a regular file
    if [ -f $file ]; then
        # append the file to the output file
        cat $file >> $2
    fi
done

# exit with success
exit 0