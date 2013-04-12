#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sqlite3
from gi.repository import Gtk


def About():
	print("""
PhoneManager Version 0.1
This program store name and phone.
Created by Antonio Thomacelli Gomes
""")


def ConnectDB(function='none',name='none', phone='none'):
 def Teste(name, phone):
  print("Valor Inserido: %s e %s" % ( name, phone ) )


 if function == 'rec':
  print("Gravando %s, %s" % ( name, phone ) )
 elif function == 'find':
  Teste(name,phone)
 else:
  print("ERROR value not found")



# if ( option == 'create'):
#  DBconnect = sqlite3.connect('DBphonemanager.db')
#  DBcommand = DBconnect.cursor()
#  Teste()
# else:
#  print('Oi')
#  Teste()



About()
####
class PhoneForm(Gtk.Window):
 
 def __init__(self):
  Gtk.Window.__init__(self, title="PhoneManager 1.0")

  self.set_border_width(30)

  FormTable = Gtk.Table(2, 2, True)
  self.add(FormTable)

  NameLabel = Gtk.Label("Name: ")
  FormTable.attach( NameLabel, 0, 1, 0, 1 )
  self.NameEntry = Gtk.Entry()
  FormTable.attach( self.NameEntry, 1, 2, 0, 1 )

  PhoneLabel = Gtk.Label("Phone: ")
  FormTable.attach( PhoneLabel, 0, 1, 1, 2 )
  self.PhoneEntry = Gtk.Entry()
  FormTable.attach( self.PhoneEntry, 1, 2, 1, 2 )

  RecButton = Gtk.Button( label = " Record  " )
  RecButton.connect( "clicked",self.RecAct )
  FormTable.attach( RecButton, 0, 1, 3, 4 )

  FindButton = Gtk.Button( label = " Find  " )
  FindButton.connect( "clicked",self.FindAct )
  FormTable.attach( FindButton, 1, 2, 3, 4 )


 def RecAct(self, button):
  ConnectDB('rec', self.NameEntry.get_text(), self.PhoneEntry.get_text() )

 def FindAct(self, button):
  ConnectDB('find', self.NameEntry.get_text(), self.PhoneEntry.get_text() )
 

Program = PhoneForm()
Program.connect("delete-event",Gtk.main_quit)
Program.show_all()
Gtk.main()
