from pathlib import Path
from atexit import register
from readline import read_history_file, set_history_length, write_history_file

readline_history_file = Path("~", ".cache", "python", "python_history")
try:
    read_history_file(readline_history_file)
except IOError:
    pass

set_history_length(1000)
register(write_history_file, readline_history_file)
