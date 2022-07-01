#!/bin/bash

# A bash scrip that analyses a typical Apache access log file
# the script takes the argument $1 as the filename of the logfile to parse
# If no argument is passed, the script will attempt to use the default file (apache_logs.txt) found in this repository.


# Accept and validate filename argument
if [[ $* < 1 ]]
then
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


AnalyseLog() {
	status_code=200
	count=$(cat $logfile |awk -v code=$status_code '$9 == code'| wc -l)
	lines=$(wc -l $logfile |awk '{print $1}')
	percent=$(echo "($count/$lines)*100" |bc -l |xargs printf "%.2f")
	browser=$(cat $logfile |awk '{print $(NF)}' |awk -F/ '{if($1 !~ /http/){print $1}}' |sort |uniq -c|sort -n |awk '{print $2}' |tail -1)
	requests=$(cat $logfile |awk '{print $4}' |sed 's/^\[//' |awk -F/ '{print $1}' |awk '{x[$1]++} END{for(i in x) {d+=x[i];count++}print (d / count)}')



}
AnalyseLog

echo "Number of requests with status code: $status_code -----> $count ($percent%)"
echo "Most used Web browser -----> $browser"
echo "Average requests per day -----> $requests"
