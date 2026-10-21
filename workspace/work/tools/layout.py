"""Record section layout and raw same-file-offset equality; not source coverage."""
import hashlib
import json
from pathlib import Path
import sys
import pefile

gfx = Path(__file__).resolve().parents[3]
anchor_path = gfx.parent / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
candidate_path = Path(sys.argv[1])
anchor, candidate = anchor_path.read_bytes(), candidate_path.read_bytes()
assert hashlib.sha256(anchor).hexdigest() == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
total = max(len(anchor), len(candidate))
equal = sum(a == b for a, b in zip(anchor, candidate))


def sections(data):
    pe = pefile.PE(data=data, fast_load=True)
    return [dict(name=s.Name.rstrip(b'\0').decode(), rva=hex(s.VirtualAddress),
                 file_offset=hex(s.PointerToRawData), raw_bytes=s.SizeOfRawData,
                 virtual_bytes=s.Misc_VirtualSize) for s in pe.sections]


print(json.dumps(dict(anchor_sha256=hashlib.sha256(anchor).hexdigest(),
                     candidate_sha256=hashlib.sha256(candidate).hexdigest(),
                     whole_file_identical=candidate == anchor,
                     same_file_offset_equal_bytes=equal, compared_bytes=total,
                     same_file_offset_percent=100 * equal / total,
                     caveat='Raw file offsets, including headers/data/debug; NOT reconstructed-source coverage.',
                     retail_sections=sections(anchor), candidate_sections=sections(candidate)), indent=2))
