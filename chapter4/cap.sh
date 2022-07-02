#!/bin/bash

# Print all the lines in http.cap containing the address 65.208.228.223

echo -e "Printing capture packets that contain the IP Address: 65.208.228.223\n"
tcpdump -r http.cap |grep '65.208.228.223'

# Calculate the time in miliseconds between packets (for the last two packets)
time=$(tcpdump -r http.cap |awk -F. '{print $2}' |awk '{print $1}' |awk 'BEGIN {RS="";FS="\n"} {print $(NF-1) - $(NF)}')

# Convert milliseconds to positive integer if negative
if [ $time -lt 0 ]
then
	time=$(echo "-($time)" |bc)
fi

echo -e "\nThe average time between two packets is: $time miliseconds."
exit 0
