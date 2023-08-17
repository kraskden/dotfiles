
from abc import ABC, abstractmethod


class Module(ABC):

  def __init__(self, name):
    self.name = name 

  @abstractmethod
  def payload(self) -> dict:
    pass

  def txt(self, text: str) -> dict:
    return {'full_text': text}


class CachableModule(Module):

  def __init__(self, name, interval):
    super().__init__(name)
    self.interval = interval
    self.call_counter = 0

  def payload(self) -> dict:
    if (self.call_counter == 0):
      self._payload = self.cachable_payload()
    self.call_counter = (self.call_counter + 1) % self.interval
    return self._payload

  @abstractmethod
  def cachable_payload(self) -> dict:
    pass