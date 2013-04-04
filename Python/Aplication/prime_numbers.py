#!/usr/bin/python
# -*- coding: utf-8 -*-

print("This program show if number is prime or not")
NUMBER = int(input("Insert a number: "))
FLAG = 0

for COUNT in range (1, NUMBER+1 ):
	if NUMBER % COUNT == 0:
		FLAG +=1

if ( (FLAG <= 2) and ( NUMBER != 1) ):
	print ("This number is prime")
else:
	print ("This number is not prime")
