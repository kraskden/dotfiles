
from collections import OrderedDict
from typing import Any


class LRUDict(OrderedDict):

    def __init__(self, max_size=1024, *args, **kwargs):
        self.max_size = max_size
        super().__init__(*args, **kwargs)

    def __getitem__(self, key: Any) -> Any:
        value = super().__getitem__(key)
        self.move_to_end(key)
        return value
    
    def __setitem__(self, key: Any, val: Any) -> None:
        super().__setitem__(key, val)
        if len(self) > self.max_size:
            self.popitem(last=False)