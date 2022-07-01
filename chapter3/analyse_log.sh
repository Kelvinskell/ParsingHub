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

analyselog() {
	echo "Analysing $logfile. This might take a few seconds."
}
analyselog
