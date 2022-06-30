#!/bin/bash

echo -n "Enter Filename: "
read file

if [[ ! -f $file ]]
then
	echo "$file: No such file"
	exit $?
fi

# Print valid pjone numbers
echo "Valid phone numbers: "
egrep -x '([0-9]{3}-|\([0-9]{3}\) )([0-9]{3}-[0-9]{4})' $file |nl
