#!/usr/bin/env python3
"""Emit sibling switch candidates using SDK-confirmed aliases and return order."""
from collections import defaultdict
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
sys.path[:0] = [str(ROOT / 'codex/renderer'), str(ROOT / 'gfx/tools')]
from audit_legacy import load_matcher
from check_dxerr_dependency import members

raw = next(v for v in members((ROOT / 'sdk/sum2004/Lib/DxErr9.lib').read_bytes())
           if v[:2] == b'\x4c\x01')
coff = load_matcher()['parse_coff'](raw)
symbols = {s['idx']: s for s in coff['symbols']}
for stem, function, wide in (
        ('name_w', 'DXGetErrorString9W', True),
        ('description_a', 'DXGetErrorDescription9A', False),
        ('description_w', 'DXGetErrorDescription9W', True)):
    mapping = json.loads((HERE / (stem + '_mapping.json')).read_text())
    groups = defaultdict(list)
    for code, text in sorted(mapping.items()):
        assert all(ord(char) < 128 for char in text), 'verify source encoding before emitting non-ASCII'
        groups[text].append(code)
    fn = next(s for s in symbols.values() if s['name'] == '_' + function + '@4')
    section = coff['sections'][fn['sec'] - 1]
    ranking = {}
    for relocation in sorted(section['relocs'], key=lambda r: r['vaddr']):
        symbol = symbols[relocation['sym']]
        if symbol['sec'] <= 0 or not symbol['name'].startswith('??_C@'):
            continue
        data = coff['sections'][symbol['sec'] - 1]
        assert data['name'] == '.rdata'
        value = raw[data['rawptr'] + symbol['value']:data['rawptr'] + data['rawsize']]
        text = value.decode('utf-16-le' if wide else 'latin1').split('\0', 1)[0]
        ranking.setdefault(text, len(ranking))
    assert set(groups) <= ranking.keys()
    lines = ['#include <windows.h>', '', 'extern "C" const '
             + ('wchar_t' if wide else 'char') + ' *WINAPI ' + function + '(HRESULT hr)',
             '{', '    switch (hr)', '    {']
    prefix = 'L' if wide else ''
    for text in sorted(groups, key=ranking.__getitem__):
        lines.extend('    case (HRESULT)0x' + code + ':' for code in groups[text])
        lines.append('        return ' + prefix + json.dumps(text) + ';')
    fallback = 'Unknown' if stem == 'name_w' else 'n/a'
    lines.extend(['    default:', '        return ' + prefix + json.dumps(fallback) + ';',
                  '    }', '}', ''])
    (HERE / (stem + '.cpp')).write_text('\n'.join(lines))
    print(stem, len(mapping), 'cases;', len(groups), 'shared returns; candidate only')
