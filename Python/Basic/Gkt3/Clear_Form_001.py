#!/usr/bin/env python3
# -*- coding: utf-8 -*-

print("This file need packet 'python-gobjects'")
from gi.repository import Gtk

class FormFull(Gtk.Window):
 
 def __init__(self):
  Gtk.Window.__init__(self, title="Basic Form Window")
  
  self.set_border_width(40)

  FormTable = Gtk.Box(spacing=1)
  self.add(FormTable)

  AcButton = Gtk.Button( label = " Linux Resort " )
  AcButton.connect("clicked",self.ActionWork)
  FormTable.pack_start(AcButton, True, True,15)


 def ActionWork(self, button):
  print("Working Visit: http://www.linuxresort.blogspot.com.br")
    
  
Program = FormFull()
Program.connect("delete-event",Gtk.main_quit)
Program.show_all()
Gtk.main()

