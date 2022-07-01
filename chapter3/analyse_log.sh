#!/bin/bash

# Accept and validate filename argument
if [[ $* < 1 ]]
then
	echo "No Logfile supplied. Using default file."
	if [[ ! -f apache_logs.txt ]]
	then
		echo -e "Default logfile (apache_logs.txt) no longer exists. \nExiting..."
		exit $?
	else
		logfile=apache_logs.txt
	fi
else
	if [[ ! -f $1 ]]
	then
		echo -e "$1: No such file \nExiting..."
		exit $?
	else
		logfile=$1
	fi
fi

echo -e "Enter status code \nPress Enter to use default status code (200): "
read code
code=304

StatusCode() {
	count=$(cat $logfile |awk -v code=$code '$9 == code'| wc -l)
	lines=$(wc -l $logfile |awk '{print $1}')
	percent=$(echo "($count/$lines)*100" |bc -l |xargs printf "%.2f")

}
StatusCode

