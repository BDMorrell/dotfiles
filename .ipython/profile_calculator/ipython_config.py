# Configuration file for ipython.
import os.path

fileDirectory = os.path.dirname(__file__)
lazyImporterPath = os.path.join(fileDirectory, 'importer.py')

c = get_config()

c.InteractiveShellApp.pylab_import_all = True
c.InteractiveShellApp.exec_lines = [
        'exec(open("'+lazyImporterPath+'").read(), globals())',
        'from math import *',
        'import time',
        'print("\\nReady (system {}s)".format(time.thread_time()))',
        ]


c.TerminalInteractiveShell.confirm_exit = False

c.InteractiveShell.autoindent = True
c.InteractiveShell.banner2 = '\x1b[1m\x1b[91mTHIS IS A CALCULATOR ONLY\x1b[0m'
