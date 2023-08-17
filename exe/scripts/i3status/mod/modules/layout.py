from module import Module
import subprocess

class LayoutModule(Module):

  def __init__(self):
    super().__init__('layout')

  def payload(self):
    try:
      return self.txt(subprocess.check_output('xkb-switch').decode().strip().upper() + ' ')
    except subprocess.CalledProcessError:
      return self.txt("ERR")