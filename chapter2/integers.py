#!/usr/bin/env python3

# Count the number of words in a file (example.txt)

# Import modules
import sys
import os
import re

# Accept filename argument
if len(sys.argv) < 2:
    filename = input('Filename: ')
else:
    filename = sys.argv[1]

# Check if file exists
if not os.path.isfile(filename):
    print(f'{filename}: Not a valid file')

def integerSum(file):
    numbers = []
    pattern = r'[0-9]+'
    with open(file) as f:
        for line in f.readlines():
            numbers.append(re.findall(pattern, line))
        
    # Flatten nested list and return value
    return sum([int(number) for sublist in numbers for number in sublist])

print(f'The sum of integers found in {filename} is {integerSum(filename)}')

