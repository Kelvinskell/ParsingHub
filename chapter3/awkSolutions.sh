#!/bin/bash


#1) Get your mac address, print it by itself on a line.
#  i.e. ifconfig | awk '{}'
ifconfig |awk '{if ($1 ~ /ether/) {print "MAC Address:", $2}}'


#2) Put your mac address in a variable named MACADDY
#  hint, use tick marks '`' which is left of your 1 key on a mac.

#SOLUTION: ifconfig |awk '{if ($1 ~ /ether/) {print "MAC Address:", $2; $2="MACADDY"}}'


#3) combine awk with last and uniq to get a list of persons who have used your computer, can you sort it based upon number of uses? what about print number of times used as well?
last |sed '/^$/d' |awk '{if ($1 !~ /reboot/ &&  $1 !~ /wtmp/) {print $1}}' |sort |uniq -c |awk '{print $2, "Looged in", $1, "times."}'


#4) use awk to add 5 + 5 with the command echo "5+5" | awk '{}'
#  Dont cheat and add spaces to your echo command, use the explicit command.
echo "5+5" |awk -F+ '{print ($1 + $2)}'
#OR
#sOLUTION: echo "5+5" |awk 'BEGIN{FS="+"} {print ($1 + $2)}'


#5) define two environment variables: HELLO="Hello" and WORLD="World", use them to print Hello, World! from awk WITHOUT using a pipe. 
awk 'BEGIN{HELLO="Hello"; WORLD="World"; print HELLO ",", WORLD}'


#6) Print all users in the /etc/passwd file
cat /etc/passwd |awk -F: '{print $1}' |tail -5

