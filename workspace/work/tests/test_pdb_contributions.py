"""Unnamed data ownership comes from bounded PDB records, never a string gap."""
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch
import struct
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[3] / 'tools'))
import pdbsyms

module = bytes(64) + b'cpu_disp.obj\0LIBCMT.lib\0'
module += bytes(-len(module) % 4)
pe = SimpleNamespace(OPTIONAL_HEADER=SimpleNamespace(ImageBase=0x10000000),
                     sections=[SimpleNamespace(VirtualAddress=0x1000, Misc_VirtualSize=0x100)])


def decode(seg=1, offset=0x40, size=12, owner=0, version=0xf12eba2d, tail=b''):
    records = struct.pack('<IHHIIIHHII', version, seg, 0, offset, size,
                          0x40401040, owner, 0, 0, 0) + tail
    header = bytearray(64)
    struct.pack_into('<ii', header, 24, len(module), len(records))
    with patch.object(pdbsyms, 'msf_streams', return_value=[b'', b'', b'', header + module + records]), \
            patch.object(pdbsyms.pefile, 'PE', return_value=pe):
        return list(pdbsyms.contributions('fixture.dll', 'fixture.pdb'))


assert decode() == [(0x10001040, 12, 0x40401040, 'cpu_disp.obj')]
assert decode(size=0) == []
for kwargs in (dict(seg=0), dict(seg=2), dict(owner=1), dict(offset=0xf8),
               dict(version=0), dict(tail=b'\0')):
    try:
        decode(**kwargs)
    except ValueError:
        pass
    else:
        raise AssertionError(('invalid PDB contribution accepted', kwargs))
print('PASS: exact anonymous contribution owner/extent, empty span and six malformed-record negatives')
