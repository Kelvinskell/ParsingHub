#!/usr/bin/env python3

import pyshark

cap = pyshark.FileCapture("dns.cap")

# Activate packet capture
try:
    cap[10000]
except KeyError:
    pass

# Find IP Address of www.netbsd.org
for packet in range(len(cap)):
    if cap[packet].dns.qry_name == 'www.netbsd.org':
        address = cap[packet].ip.addr
        print("The IP Address of www.netbsd.org is:", address)
        break

# For what domain was there a mail excahnge lookup?
for packet in range(len(cap)):
    if 'MX' in cap[packet].dns.qry_type.showname_value:
        print("{} has a mail excahnge lookup".format(cap[packet].dns.qry_name))
        break

# Name a mail exchange server for google.com
for packet in range(len(cap)):
    if cap[packet].dns.qry_name == 'google.com' and 'mx_mail_exchange' in dir(cap[packet].dns):
        server = cap[packet].dns.mx_mail_exchange
        print("www.google.com has the mail exchange server:", server)
        break

# For what domain was there a nameserver lookup?
for packet in range(len(cap)):
    if 'NS' in cap[packet].dns.qry_type.showname_value:
        print("{} has a Name Server lookup".format(cap[packet].dns.qry_name))
        break


