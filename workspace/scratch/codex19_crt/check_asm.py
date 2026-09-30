#!/usr/bin/env python3
"""Check full original MASM procedures, excluding embedded jump tables."""
import contextlib
import hashlib
import io
import json
from pathlib import Path
import struct
import sys

import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path.insert(0, str(ROOT / 'codex/renderer'))
from audit_legacy import load_matcher

ASM = HERE.parent / 'codex_crt14asm'
IMAGE = 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'
ANCHOR = ROOT / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
ANCHOR_SHA = '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    assert sha(ANCHOR) == ANCHOR_SHA
    m = load_matcher()
    pe = pefile.PE(str(ANCHOR))
    d = Cs(CS_ARCH_X86, CS_MODE_32)
    intervals, rows, inputs = [], [], {}
    # All entries are original public MASM procedures, not synthesized bytes.
    for name, address, size in (('memcpy', 0x100fcdf0, 829),
                                 ('memmove', 0x100f67a0, 829),
                                 ('strchr', 0x100f65a0, 206),
                                 ('strcmp', 0x101003a0, 136)):
        obj = HERE / 'asm' / (name + '.obj')
        source = ROOT / 'glm/crt71' / (name + '.asm')
        assert source.stat().st_mtime <= obj.stat().st_mtime
        raw = obj.read_bytes()
        c = m['parse_coff'](raw)
        symbols = {s['idx']: s for s in c['symbols']}
        fn, = [s for s in symbols.values() if s['name'] == '_' + name and s['sec'] > 0]
        sec = c['sections'][fn['sec'] - 1]
        start = 0
        assert fn['value'] == (16 if name == 'strchr' else 0)
        public = [s for s in symbols.values() if s['sec'] == fn['sec'] and s['sclass'] == 2]
        assert sec['flags'] & 0x20
        assert {s['name'] for s in public} == (
            {'_strchr', '___from_strstr_to_strchr'} if name == 'strchr' else {'_' + name})
        assert start + size <= sec['rawsize']
        # Any trailing section alignment is verified but receives no credit.
        trailing = raw[sec['rawptr'] + start + size:sec['rawptr'] + sec['rawsize']]
        assert len(trailing) <= 3 and all(b == 0xcc for b in trailing)
        rebuilt = bytearray(raw[sec['rawptr'] + start:sec['rawptr'] + start + size])
        retail = bytearray(pe.get_data(address - 0x10000000, size))
        assert len(retail) == size
        relocations = [r for r in sec['relocs'] if start <= r['vaddr'] < start + size]
        off = m['rva2off'](address - 0x10000000)
        expected = {p - off for p in m['PE_RELOCS'] if off <= p < off + size}
        assert expected == {r['vaddr'] - start for r in relocations}
        bindings = []
        for r in relocations:
            symbol = symbols[r['sym']]
            assert r['type'] == 6 and symbol['sec'] == fn['sec']
            p = r['vaddr'] - start
            addend = struct.unpack_from('<I', rebuilt, p)[0]
            base = address + symbol['value'] - start
            target = struct.unpack_from('<I', retail, p)[0]
            assert target == (base + addend) & 0xffffffff
            assert target != (base + 1 + addend) & 0xffffffff
            bindings.append({'offset': p, 'symbol': symbol['name'], 'base': hex(base),
                             'addend': addend})
            rebuilt[p:p + 4] = retail[p:p + 4] = bytes(4)
        assert rebuilt == retail
        bad = bytearray(rebuilt)
        bad[0] ^= 1
        assert bad != retail
        tables = []
        excluded = []
        if name in ('memcpy', 'memmove'):
            # Original MEMCPY.ASM declares these six DD vectors in the code section.
            for label, count in (('LeadUpVec', 3), ('UnwindUpVec', 8), ('TrailUpVec', 4),
                                  ('LeadDownVec', 3), ('UnwindDownVec', 8), ('TrailDownVec', 4)):
                symbol, = [s for s in symbols.values() if s['name'] == label]
                assert symbol['sec'] == fn['sec']
                tables.append((symbol['value'] - start, count * 4))
        if name == 'strchr':
            # Source return helper precedes the public entry; ALIGN creates 11 NOP bytes.
            excluded.append((5, 11))
        excluded.extend(tables)
        excluded.sort()
        spans, pos = [], 0
        for p, n in excluded:
            assert pos <= p and p + n <= size
            if pos < p:
                spans.append((pos, p - pos))
            pos = p + n
        if pos < size:
            spans.append((pos, size - pos))
        instructions = []
        for p, n in spans:
            code = pe.get_data(address + p - 0x10000000, n)
            decoded = list(d.disasm(code, address + p))
            assert sum(i.size for i in decoded) == n
            instructions.extend(decoded)
        assert instructions[-1].mnemonic in ('ret', 'jmp')
        starts = {i.address for i in instructions}
        for i in instructions:
            if i.mnemonic.startswith('j') and i.op_str.startswith('0x'):
                assert int(i.op_str, 16) in starts, (name, hex(i.address), i.op_str)
        for p, n in tables:
            assert all(struct.unpack_from('<I', pe.get_data(address + p + j - 0x10000000, 4))[0]
                       in starts for j in range(0, n, 4))
        public_address = address + fn['value']
        meta = m['INV'][f'{public_address:x}']
        meta['size'] = size - fn['value']
        with contextlib.redirect_stdout(io.StringIO()):
            assert m['cmd_diff'](hex(public_address), str(obj), '_' + name) == 100
        credit = [{'address': hex(address + p), 'bytes': n} for p, n in spans]
        intervals.extend((address + p, n) for p, n in spans)
        rows.append({'symbol': '_' + name, 'address': hex(address),
                     'public_entry': hex(address + fn['value']), 'section_bytes': size,
                     'excluded_table_bytes': sum(n for _, n in tables),
                     'excluded_alignment_bytes': sum(n for p, n in excluded if (p, n) not in tables),
                     'instruction_ranges': credit, 'bindings': bindings,
                     'original_referee_match': 100})
        inputs[name] = {'source_sha256': sha(source), 'object_sha256': sha(obj)}
    packet = {'status': 'REVIEWABLE', 'whole_file_identity': False,
              'source_class': 'authentic VC7.1 MASM; not game-authored C++',
              'anchor_sha256': ANCHOR_SHA, 'image': IMAGE,
              'checker_sha256': sha(Path(__file__)),
              'build_script_sha256': sha(HERE / 'compile_asm.sh'),
              'includes': {'Intel/MEMCPY.ASM': sha(ASM / 'case/Intel/MEMCPY.ASM'),
                           'cruntime.inc': sha(ROOT / 'glm/crt71/cruntime.inc')},
              'inputs': inputs, 'rows': rows, 'negative_tests_passed': True,
              'verified_instruction_bytes': sum(n for _, n in intervals)}
    (HERE / 'asm_packet.json').write_text(json.dumps(packet, indent=2) + '\n')
    print('PASS:', len(rows), 'complete original MASM procedures,',
          packet['verified_instruction_bytes'], 'instruction bytes; embedded tables excluded')


if __name__ == '__main__':
    main()
