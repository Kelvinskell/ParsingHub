#!/bin/bash

if [[ $* < 1 ]]
then
	echo -n "First file: "
	read file
else
	file=$1
fi

if [[ ! -f $file ]]
then
	echo "Invalid filename."
	exit $?
fi

cat $file|xargs -n 1|sort|uniq -c|awk 'BEGIN{print "WORD <-----> FREQUENCY"} {print $2 " <-----> " $1, "times", "<----->", ($2 / NR) * 100 }'
