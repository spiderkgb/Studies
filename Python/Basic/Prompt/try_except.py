#!/usr/bin/env python3
# -*- coding: utf-8 -*-

print("try: Will run correcty, but with one error he's will jump to execept")

try:
	NUMBER = int(input("Insert a number or letter to create a error :"))

except:
	print ("The value not is a number!")
