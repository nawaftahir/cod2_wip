#!/usr/bin/env python3
"""Emit shared case labels for SDK-observed aliases; source probe, zero credit."""
from collections import defaultdict
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
mapping = json.loads((HERE.parent / 'codex_dxerr_rebuild/mapping.json').read_text())
groups = defaultdict(list)
for code, text in sorted(mapping.items()):
    groups[text].append(code)
sys.path[:0] = [str(HERE.parents[3] / 'codex/renderer'), str(HERE.parents[3] / 'gfx/tools')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members
raw = next(member for member in members((HERE.parents[3] / 'sdk/sum2004/Lib/DxErr9.lib').read_bytes())
           if member[:2] == b'\x4c\x01')
coff = load_matcher()['parse_coff'](raw)
function = next(s for s in coff['symbols'] if s['name'] == '_DXGetErrorString9A@4')
section = coff['sections'][function['sec'] - 1]
symbols = {s['idx']: s for s in coff['symbols']}
rankings = {}
for kind, sequence in (('sdk_strings', coff['symbols']),
                       ('sdk_leaf', [symbols[r['sym']] for r in sorted(section['relocs'], key=lambda r: r['vaddr'])])):
    rank = {}
    for s in sequence:
        if s['sec'] <= 0 or not s['name'].startswith('??_C@'):
            continue
        sec = coff['sections'][s['sec'] - 1]
        data = raw[sec['rawptr'] + s['value']:sec['rawptr'] + sec['rawsize']]
        text = data.split(b'\0', 1)[0].decode('latin1')
        rank.setdefault(text, len(rank))
    assert set(groups) <= rank.keys()
    rankings[kind] = rank
for mode in ('numeric', 'name', 'sdk_strings', 'sdk_strings_reverse', 'sdk_leaf', 'sdk_leaf_reverse'):
    if mode.startswith('sdk'):
        kind = mode.removesuffix('_reverse')
        ordering = sorted(groups, key=rankings[kind].__getitem__, reverse=mode.endswith('_reverse'))
    else:
        ordering = sorted(groups, key=(lambda text: groups[text][0]) if mode == 'numeric' else None)
    lines = ['#include <windows.h>', '',
             'extern "C" const char *WINAPI DXGetErrorString9A(HRESULT hr)',
             '{', '    switch (hr)', '    {']
    for text in ordering:
        lines.extend('    case (HRESULT)0x' + code + ':' for code in groups[text])
        lines.append('        return ' + json.dumps(text) + ';')
    lines.extend(['    default:', '        return "Unknown";', '    }', '}', ''])
    (HERE / ('group_' + mode + '.cpp')).write_text('\n'.join(lines))
print(len(mapping), 'cases;', len(groups), 'shared returns; discovery only')
