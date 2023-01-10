#!/usr/bin/env python3

import sys
import json
import subprocess

def get_layout():
    try:
        return subprocess.check_output('xkb-switch').decode().strip().upper() + ' '
    except subprocess.CalledProcessError:
        return "RU "

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j: list = json.loads(line)
        j.append({'full_text' : get_layout(), 'name' : 'layout'})
        print_line(prefix+json.dumps(j))
