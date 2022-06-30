#!/bin/bash

# Match all ipv4 addresses in a file

pattern='^(0|1[0-9]{,2}|2|2[0-4][0-9]?|25[0-5]?)(\.)((0|1[0-9]{,2}|2|2[0-4][0-9]?|25[0-5]?)(\.)){2}(0|1[0-9]{,2}|2|2[0-4][0-9]?|25[0-5]?)$'

# Check for arguments
if [[ $* < 0 ]]
then
	echo -n "Filename: "
	read filename
else
	$1=filename
fi

# Test file existence
if [ ! -f $filename ]
then 
	echo "$filename: No such file."
	exit $?
fi

function Regex()
{
	# Search each word in the file for ipv4 addresses
	while read line
	do
		for word in $line
		do
			if [[ $(echo $word | egrep $pattern) ]]
			then
				# Add valid addresses into an array
				addr+=($word)
			fi
		done
	done < <(cat $filename)
}
Regex

if ${#addr[@]} == 0
then
	echo "No valid ipv4 address found in $filename"
else
	echo "Valid ipv4 addresses are: "
	for address in ${addr[@]}
	do
		echo $address
	done
	echo "Number of valid ipv4 addresses: ${#addr[@]}"
fi
