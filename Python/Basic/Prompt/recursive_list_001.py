#!/usr/bin/env python

print("Test recursive test list, list inside list")


def plist(data):
 for line in data:
  if isinstance( line, list):
   print("New list:\n")
   plist(line)
  else:
   print(line)


names = ['TestName1','TestName2',['2000','2001']]
plist(names)
