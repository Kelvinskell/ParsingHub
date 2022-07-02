#!/usr/bin/env python3

import sys
import pyshark
from pathlib import Path

# Print the average time in miliseconds between two packets

# Read and validate filename argument if provided
if len(sys.argv) > 1:
    filename = sys.argv[1] 
    #Check if file is a capture file
    if not Path(filename).suffix == ".cap":
        print("{} is not a capture file.".format(filename))
        sys.exit

