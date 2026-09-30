#!/usr/bin/env python3
"""Extract the compiler's Files_0 cabinet members; no system installation."""
import ctypes as c
import hashlib
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
ISO = Path(sys.argv[1]) if len(sys.argv) == 2 else Path('/tmp/cod2-dxerr-compiler.asMam8/ddk.iso')
CAB = ISO.with_name('X86DBINS.CAB')
assert hashlib.sha256(ISO.read_bytes()).hexdigest() == '7a27263e4c3c89dee113eba75dc9145bf7019b43a2c5e24bc9382dbde79f7f8b'
if not CAB.exists():
    with ISO.open('rb') as stream:
        stream.seek(114655232)
        cabinet = stream.read(14710258)
    assert hashlib.sha256(cabinet).hexdigest() == 'ff3dbfd17374b794d1d576e7497d54298af08d6e513b369bf85d17d6933dc538'
    CAB.write_bytes(cabinet)
assert hashlib.sha256(CAB.read_bytes()).hexdigest() == 'ff3dbfd17374b794d1d576e7497d54298af08d6e513b369bf85d17d6933dc538'
names = {'X86dBINS_FILE_' + str(i): n for i, n in (
    (2, 'c1.dll'), (4, 'c1xx.dll'), (6, 'c2.dll'), (7, 'cl.exe'),
    (26, 'mspdb71.dll'), (28, 'msvcp71.dll'), (30, 'msvcr71.dll'))}
dest = HERE / 'compiler'
dest.mkdir(exist_ok=True)
lib = c.CDLL('libarchive.so.13')
lib.archive_read_new.restype = c.c_void_p
for name in ('archive_read_support_format_all', 'archive_read_support_filter_all', 'archive_read_free'):
    getattr(lib, name).argtypes = [c.c_void_p]
lib.archive_read_open_filename.argtypes = [c.c_void_p, c.c_char_p, c.c_size_t]
lib.archive_read_next_header.argtypes = [c.c_void_p, c.POINTER(c.c_void_p)]
lib.archive_read_data_into_fd.argtypes = [c.c_void_p, c.c_int]
lib.archive_entry_pathname.argtypes = [c.c_void_p]
lib.archive_entry_pathname.restype = c.c_char_p
lib.archive_error_string.argtypes = [c.c_void_p]
lib.archive_error_string.restype = c.c_char_p
archive = lib.archive_read_new()
lib.archive_read_support_format_all(archive)
lib.archive_read_support_filter_all(archive)
assert lib.archive_read_open_filename(archive, str(CAB).encode(), 65536) == 0
entry = c.c_void_p()
found = set()
while True:
    status = lib.archive_read_next_header(archive, c.byref(entry))
    if status == 1:
        break
    assert status >= -20, lib.archive_error_string(archive)
    name = lib.archive_entry_pathname(entry).decode()
    if name not in names:
        continue
    with (dest / names[name]).open('wb') as stream:
        assert lib.archive_read_data_into_fd(archive, stream.fileno()) == 0, lib.archive_error_string(archive)
    found.add(name)
    print(names[name], hashlib.sha256((dest / names[name]).read_bytes()).hexdigest())
lib.archive_read_free(archive)
assert found == names.keys()
