#!/usr/bin/env python

import argparse
import csv
import sys

parser = argparse.ArgumentParser(description='Process csv')
parser.add_argument('file'      , metavar='F' , type=str , nargs='?' , help='path2inputFile')
parser.add_argument('threshold' , metavar='T' , type=int , nargs='?' , help='threshold')
args = parser.parse_args()

writer = csv.writer(sys.stdout)
with open(args.file, 'rb') as csvfile:
	reader = csv.reader(csvfile, delimiter=',')
	# returns the headers or `None` if the input is empty
	headers = next(reader, None)
	if headers:
	    writer.writerow(headers)
	for row in reader:
		element = []
		for e in row[4::3]:
    			element.append(e)
		element = [int(i) for i in element]
		if min(element) >= args.threshold:
			writer.writerow(row)
