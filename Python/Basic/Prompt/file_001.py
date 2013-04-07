#!/usr/bin/env python3
# -*- coding: utf-8 -*-

print ("This file open and record data in file text")

FileOpen = open("./examplefile.txt","a")
FileOpen.write("Text to test\n It's is a joke!")
FileOpen.close()
