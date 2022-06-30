#!/usr/bin/env python3

# Print all lines that contain a given string

# Import modules
import sys
import os
import re

# Accept filename argument
if len(sys.argv) < 3:
    filename = input('Filename: ')
    string = input('String: ')
else:
    filename = sys.argv[1]
    string = sys.argv[2]

# Check if file exists
if not os.path.isfile(filename):
    print(f'{filename}: Not a valid file')
    sys.exit()

# Perform a case insensitive search of string  
def stringMatch(file, string):
    print(f'Lines that contain {string}:')
    with open(file) as f:
        for line in f.readlines():
            if re.match(string, line, re.IGNORECASE):
                print(line, end='\n')


stringMatch(filename, string)
