#!/usr/bin/env python3

# Import modules
import os
import sys
import pyshark
import random
from pathlib import Path


# Read and validate filename argument if provided
def validate():
    if len(sys.argv) > 1:
        filename = sys.argv[1] 

        # Check if file exists
        if not os.path.isfile(filename):
            print("{}: File does not exist".format(filename))
            sys.exit()

        # Check if file is a capture file
        if not Path(filename).suffix == ".cap":
            print("{} is not a capture file.".format(filename))
            sys.exit()

    else:
        # Check if default file (http.cap) exists
        if not os.path.isfile('http.cap'):
            print("Defaultt file http.cap not found.")
            sys.exit()
        filename = 'http.cap'
    return filename


# Print the average time in seconds between the first two packets
def avg_time():
    filename = validate()
    cap = pyshark.FileCapture(filename)

    # Activate capture files
    try:
        cap[10000]
    except KeyError:
        pass
    
    packet1 = int(cap[1].sniff_time.timestamp())
    packet2 = int(cap[2].sniff_time.timestamp())
    seconds = packet1 - packet2

    print(f"Analysing {filename}")
    print("The average time between two packets is:", abs(seconds), "seconds.")




avg_time()

