"""Use the MSVC string symbol's byte count, not the next data symbol's address."""
import re


def string_size(name):
    if '+' in name:
        return None
    match = re.match(r'^\?\?_C@_([01])([0-9]|[A-P]+@)', name)
    if not match:
        return None
    count = match[2]
    size = int(count) + 1 if count.isdigit() else int(''.join(format(ord(c)-ord('A'), 'x') for c in count[:-1]), 16)
    width = 1 if match[1] == '0' else 2
    return size if size >= width and size % width == 0 else None


def string_equal(name, ours, target):
    size = string_size(name)
    if size is None or ours is None or target is None or len(ours) != size or len(target) != size:
        return False
    width = 2 if name.startswith('??_C@_1') else 1
    return ours[-width:] == b'\0' * width and ours == target
