import hashlib
import json
from pathlib import Path
import sys
sys.path.insert(0, 'tools')
import link
import verify
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from capstone.x86 import X86_OP_IMM

assert link.build(quiet=True)
image = verify.Linked()
retail = pefile.PE(str(link.RETAIL), fast_load=True)
names = verify.known_names()
source = Path('src/universal/com_files.cpp')
checks = [('0x0047e9a0', 'FS_IsBackupSubStr'), ('0x0047e9c0', 'FS_IsPathSepChar'),
          ('0x0047e9e0', 'FS_SanitizeFilename'), ('0x0047ec70', 'FS_FilesAreLoadedGlobally'),
          ('0x0047ed20', 'FS_FOpenFileRead_Internal')]
symbols = {}
for address, name in checks:
    symbols[address] = next(symbol for symbol in image.syms if symbol.startswith('?'+name+'@@'))
names.update({int(address, 16): symbol for address, symbol in symbols.items()})
report = {'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(), 'checks': [], 'regressions': []}
for row in link.read_tsv('ledger/matches.tsv') + link.read_tsv('ledger/compiler.tsv'):
    status, detail = verify.check(image, row['addr'], row['symbol'], names)
    if status != 'MATCH':
        report['regressions'].append(dict(addr=row['addr'], status=status, detail=detail))
md = Cs(CS_ARCH_X86, CS_MODE_32); md.detail = True
def string_at(pe, value):
    base = pe.OPTIONAL_HEADER.ImageBase
    section = pe.get_section_by_rva(value-base)
    if section is None or section.Name.rstrip(b'\0') != b'.rdata':
        return None
    data = pe.get_data(value-base, 512)
    if b'\0' not in data:
        return None
    raw = data.split(b'\0', 1)[0]
    if raw and all(32 <= byte < 127 or byte in (9, 10, 13) for byte in raw):
        return raw.decode('ascii')
for address, symbol in symbols.items():
    status, detail = verify.check(image, address, symbol, names)
    target, _ = verify.matcher.carve(address)
    actual_address, code = image.code(symbol)
    differences = []
    if status == 'MATCH':
        for original, actual in zip(md.disasm(target, int(address, 16)), md.disasm(code, actual_address)):
            for operand, replacement in zip(original.operands, actual.operands):
                if operand.type != X86_OP_IMM or replacement.type != X86_OP_IMM:
                    continue
                expected = string_at(retail, operand.imm)
                if expected is not None and string_at(image.pe, replacement.imm) != expected:
                    differences.append(dict(expected=expected, actual=string_at(image.pe, replacement.imm)))
    report['checks'].append(dict(addr=address, symbol=symbol, status=status, detail=detail, string_differences=differences))
Path('build/review_gemini.json').write_text(json.dumps(report, indent=2)+'\n')
print(json.dumps(report, indent=2))
