#!/bin/bash

if [[ $* < 1 ]]
then
	echo -n "First file: "
	read file1
	echo -n "Second file: "
	read file2
else
	file1=$1
	file2=$2
fi

if [[ ! -f $file1 ]] || [[ ! -f $file2 ]]
then
	echo "Invalid filename(s)"
	exit $?
fi

concat () {
	cat $file1 $file2 > merged.txt
}

concat

