#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sqlite3, os
DBconnect = sqlite3.connect('names.db')
DBcommand = DBconnect.cursor()

def menu():
	print("This file example of SQLite to insert and consult ")

	print ("""\nWelcome to SQL Rec Name
With this program you can store your favorites names."

Create by Antonio Thomacelli Gomes
http://www.linuxresort.blogspot.com.br

	""")
	print ("\nPress 1 - Use SQL RecName \nPress 2 - Show names \nPress 3 - To Exit\n")

def clean():
	os.system("clear")

def cont():
	input("\n\nPress any key to continue!")
	

clean()
menu()
option = input("What do you like to do ?")



while ( option != '3' ):
	if (option == '1'):
		try:
			DBcommand.execute('select * from names')
			NEWname = input('Insert new name: ')
			DBcommand.execute("insert into names(name) values ('%s');" % NEWname)
			DBconnect.commit()
		except:
			DBcommand.execute('create table names(id integer primary key, name varchar(20) );')
		cont()
	elif ( option == '2'):
		try:
			DBcommand.execute('select * from names')
		except:
			print("No names found, please insert one name first! \nTry again!")
			
		for line in DBcommand:
			print(line)
		cont()
	
	else:
		print("ERROR: Invalid option, try again!")
		cont()
	clean()	
	menu()
	option = input("What do you like to do ?")

DBconnect.close()

