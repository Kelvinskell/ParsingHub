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

def wordCount(file):
    pattern = r'[a-zA-Z]+'
    nested_list = []
    with open(file) as f:
        for line in f.readlines():
            nested_list.append(re.findall(pattern, line))
            
    # Flatten nested list
    words = [word for sublist in nested_list for word in sublist]
    return len(words)


print(f'The number of alphabetical words in {filename} is: {wordCount(filename)}')
