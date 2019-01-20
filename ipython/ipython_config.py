c = get_config()
c.InteractiveShell.colors = 'Linux'
c.TerminalIPythonApp.display_banner = False
c.InteractiveShellApp.log_level = 20
c.InteractiveShellApp.extensions = [
    'autoreload'
]
c.InteractiveShellApp.exec_lines = ['%autoreload 2']


