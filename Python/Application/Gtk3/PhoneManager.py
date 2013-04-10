#!/usr/bin/env python3
# -*- coding: utf-8 -*-


def About():
	print("""
PhoneManager Version 0.1
This program store name and phone.
Created by Antonio Thomacelli Gomes
""")

print("This PhoneManager")
from gi.repository import Gtk

class PhoneForm(Gtk.Window):
 
 def __init__(self):
  Gtk.Window.__init__(self, title="PhoneManager 1.0")

  self.set_border_width(30)

  FormTable = Gtk.Table(2, 2, True)
  self.add(FormTable)

  NameLabel = Gtk.Label("Name: ")
  FormTable.attach( NameLabel, 0, 1, 0, 1 )
  NameEntry = Gtk.Entry()
  FormTable.attach( NameEntry, 1, 2, 0, 1 )

  PhoneLabel = Gtk.Label("Phone: ")
  FormTable.attach( PhoneLabel, 0, 1, 1, 2 )
  PhoneEntry = Gtk.Entry()
  FormTable.attach( PhoneEntry, 1, 2, 1, 2 )

  RecButton = Gtk.Button( label = " Record  " )
  RecButton.connect( "clicked",self.RecAct )
  FormTable.attach( RecButton, 0, 1, 3, 4 )

  FindButton = Gtk.Button( label = " Find  " )
  FindButton.connect( "clicked",self.FindAct )
  FormTable.attach( FindButton, 1, 2, 3, 4 )

 def RecAct(self, button):
  print("Rec")

 def FindAct(self, button):
  print("Find")

Program = PhoneForm()
Program.connect("delete-event",Gtk.main_quit)
Program.show_all()
Gtk.main()
