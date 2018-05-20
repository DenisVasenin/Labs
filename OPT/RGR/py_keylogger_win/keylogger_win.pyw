import win32api, pyHook, pythoncom, sys, os
from datetime import datetime, date, time

log_file = 'keylog.csv'

def OnKeyboardEvent(event):
        f = open(log_file, 'a')
        now = datetime.now()
	if event.KeyID == 123:
                f.close()
                #new_log_file = datetime.strftime(now, "%d.%m.%Y %H-%M-%S") + '.csv'
                #os.rename(log_file, new_log_file)
		sys.exit(0)
        hour = datetime.strftime(now, "%H")
        mint = datetime.strftime(now, "%M")
        secd = datetime.strftime(now, "%S")
        msec = datetime.strftime(now, "%f")
        msec = int(msec) / 1000
        stamp = int(hour) * 3600000 + int(mint) * 60000 + int(secd) * 1000 + msec
        f.write(str(stamp) + "," + str(event.KeyID) + '\n')
        f.close()
        return True

new_hook = pyHook.HookManager() 
new_hook.KeyDown = OnKeyboardEvent
new_hook.HookKeyboard()
pythoncom.PumpMessages()
