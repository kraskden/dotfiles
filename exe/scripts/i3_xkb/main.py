#!/usr/bin/env python

import subprocess
from i3ipc import Connection, Event
from i3ipc.events import WindowEvent, WorkspaceEvent

from lru_dict import LRUDict

"""
Bind XKB keyboard layout to i3 window
"""

def get_layout():
    return subprocess.check_output('xkb-switch').decode().strip()

def set_layout(layout):
    subprocess.call(["xkb-switch", "-s", layout])

i3 = Connection()
win_id = None
layout_map = LRUDict(max_size=1024)

def on_focus(i3, e: WindowEvent):
    global win_id
    layout = get_layout()
    if win_id is not None:
        layout_map[win_id] = layout
    new_win_id = e.container.id
    if new_win_id in layout_map:
        new_win_layout = layout_map[new_win_id]
        if new_win_layout != layout:
            set_layout(new_win_layout)
    else:
        layout_map[new_win_id] = layout
    win_id = new_win_id

def on_workspace_focus(i3, e: WorkspaceEvent):
    global win_id
    if win_id is not None:
        layout_map[win_id] = get_layout()
    win_id = None

i3.on(Event.WINDOW_FOCUS, on_focus)
i3.on(Event.WORKSPACE_FOCUS, on_workspace_focus)

win = i3.get_tree().find_focused()
if win is not None:
    win_id = win.id

i3.main()
