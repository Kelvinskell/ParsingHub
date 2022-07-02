#!/usr/bin/env python3

import os
import sys
import pyshark
from pathlib import Path

# Print the average time in miliseconds between two packets

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
            sys.exit

validate()

