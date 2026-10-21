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
                 virtual_bytes=s.Misc_VirtualSize,
                 sha256=hashlib.sha256(s.get_data()).hexdigest()) for s in pe.sections]


def image_details(data):
    pe = pefile.PE(data=data)
    header = pe.OPTIONAL_HEADER
    exports = getattr(pe, 'DIRECTORY_ENTRY_EXPORT', None)
    return dict(file_bytes=len(data), machine=hex(pe.FILE_HEADER.Machine),
                timestamp=pe.FILE_HEADER.TimeDateStamp,
                image_base=hex(header.ImageBase), entrypoint_rva=hex(header.AddressOfEntryPoint),
                image_bytes=header.SizeOfImage, header_bytes=header.SizeOfHeaders,
                section_alignment=header.SectionAlignment, file_alignment=header.FileAlignment,
                checksum=header.CheckSum, dll_characteristics=hex(header.DllCharacteristics),
                exports=[dict(name=s.name.decode('ascii') if s.name else None,
                              ordinal=s.ordinal, rva=hex(s.address))
                         for s in exports.symbols] if exports else [],
                imports=[dict(dll=d.dll.decode('ascii'),
                              symbols=[dict(name=i.name.decode('ascii') if i.name else None,
                                            ordinal=i.ordinal, hint=i.hint)
                                       for i in d.imports])
                         for d in getattr(pe, 'DIRECTORY_ENTRY_IMPORT', [])],
                debug=[dict(type=d.struct.Type, timestamp=d.struct.TimeDateStamp,
                            bytes=d.struct.SizeOfData, rva=hex(d.struct.AddressOfRawData),
                            file_offset=hex(d.struct.PointerToRawData),
                            data_sha256=hashlib.sha256(pe.get_data(
                                d.struct.AddressOfRawData, d.struct.SizeOfData)).hexdigest())
                       for d in getattr(pe, 'DIRECTORY_ENTRY_DEBUG', [])])


retail_image, current_image = image_details(anchor), image_details(candidate)
retail_exports = {e['name'] for e in retail_image['exports']}
current_exports = {e['name'] for e in current_image['exports']}
print(json.dumps(dict(anchor_sha256=hashlib.sha256(anchor).hexdigest(),
                     candidate_sha256=hashlib.sha256(candidate).hexdigest(),
                     whole_file_identical=candidate == anchor,
                     same_file_offset_equal_bytes=equal, compared_bytes=total,
                     same_file_offset_percent=100 * equal / total,
                     caveat='Raw file offsets, including headers/data/debug; NOT reconstructed-source coverage.',
                     retail_sections=sections(anchor), candidate_sections=sections(candidate),
                     retail_image=retail_image, candidate_image=current_image,
                     missing_named_exports=sorted(retail_exports-current_exports, key=str),
                     extra_named_exports=sorted(current_exports-retail_exports, key=str)), indent=2))
