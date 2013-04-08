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
	print ("\nPress 1 - Use SQL RecName \nPress 2 - Show names \nPess 3 - To Exit\n")

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
		DBcommand.execute('select * from names')
		for line in DBcommand:
			print(line)
		cont()
	
	else:
		print("Nothing to do")
		cont()
	clean()	
	menu()
	option = input("What do you like to do ?")

DBconnect.close()

