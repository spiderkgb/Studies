#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

os.system("clear")
print ("This file show even number or odd number!")

try:
	NUMBER = int(input("Insert a number :"))
	if NUMBER % 2 == 0:
	        print ( "The number %s is odd number" % NUMBER)
	else:
	        print ( "The number %s is even number" % NUMBER)
except:
	print(" The value need base 10 to work!")
