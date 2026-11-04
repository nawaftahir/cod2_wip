#!/usr/bin/env python3
"""Read-only legacy renderer audit. Diagnostics are not reconstruction proof."""
import argparse
import ast
from collections import Counter
import hashlib
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parents[2]
ANCHOR = ROOT / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
EXPECTED = '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'


def load_matcher(instruction_aware=False):
    if hashlib.sha256(ANCHOR.read_bytes()).hexdigest() != EXPECTED:
        raise ValueError('anchor SHA-256 mismatch')
    path = ROOT / 'glm/tools/match_gfx.py'
    tree = ast.parse(path.read_text())
    for node in tree.body:
        if isinstance(node, ast.Assign) and isinstance(node.value, ast.Constant):
            name = node.targets[0].id if isinstance(node.targets[0], ast.Name) else ''
            if name == 'DLL':
                node.value = ast.Constant(str(ANCHOR))
            elif name == 'INV':
                node.value = ast.Constant(str(ROOT / 'glm/data/functions_gfx10.json'))
    scope = {'__name__': 'legacy_audit', '__file__': str(path)}
    exec(compile(ast.fix_missing_locations(tree), str(path), 'exec'), scope)
    if instruction_aware:
        from referee_branch_probe import proposed_mask
        scope['pe_mask_for'] = lambda off, size, code, address: proposed_mask(
            scope, off, size, code, address)
    return scope


def self_check(matcher):
    # Synthetic bytes only: these tests expose normalization defects, not engine facts.
    scope = dict(matcher)
    scope['PE_RELOCS'] = set()
    scope['SECS'] = {'.text': (0x1000, 0x10000, 0, 0x10000)}
    node = next(n for n in ast.parse((ROOT / 'glm/tools/match_gfx.py').read_text()).body
                if isinstance(n, ast.FunctionDef) and n.name == 'pe_mask_for')
    exec(compile(ast.Module(body=[node], type_ignores=[]), '<mask test>', 'exec'), scope)
    mask = scope['pe_mask_for']
    # mov eax, immediate containing E8; the alleged call is inside that immediate.
    embedded = b'\xb8\xe8\x00\x01\x00\x00\xc3'
    assert mask(0, len(embedded), embedded, 0x1000) == {2, 3, 4, 5}
    print('REPRODUCED: branch opcode inside immediate incorrectly masks bytes')
    modrm = bytes.fromhex('81 e9 e0 00 00 00 89 74 24 14 c3')
    assert mask(0, len(modrm), modrm, 0x1000) == {2, 3, 4, 5}
    print('REPRODUCED: E9 ModRM in sub ecx,immediate incorrectly masks bytes')
    terminal = b'\xe9' + struct.pack('<i', 0x100)
    assert mask(0, len(terminal), terminal, 0x1000) == set()
    print('REPRODUCED: final five-byte branch is not inspected')
    normalize = matcher['normalize']
    assert normalize(b'\x90\xc3', set()) != normalize(b'\x91\xc3', set())
    assert normalize(b'\xc3', set()) != normalize(b'\xc3\x90', set())
    # Legacy cmd_diff removes pre-symbol offsets, but fails to subtract symbol value.
    value, section_mask = 8, {9, 10, 11, 12}
    legacy = section_mask - {p for p in section_mask if p < value}
    correct = {p - value for p in section_mask if p >= value}
    assert normalize(b'\xe8\x01\x02\x03\x04', legacy) != normalize(
        b'\xe8\x01\x02\x03\x04', correct)
    print('REPRODUCED: shared-section relocation mask is not rebased to symbol')
    print('PASS: changed unmasked byte and different lengths are distinguishable')


def ledger_audit():
    # Reuse classifier functions without running its file-writing CLI.
    path = ROOT / 'glm/tools/classify_matches.py'
    scope = {'__name__': 'classification_audit', '__file__': str(path)}
    exec(compile(path.read_text(), str(path), 'exec'), scope)
    entries = {}
    for line in (ROOT / 'glm/MATCHES.md').read_text().splitlines():
        match = scope['ADDR_RE'].search(line)
        if '✅' not in line or not match:
            continue
        cols = [c.strip() for c in line.split('|')]
        source = cols[5].strip('` ') if len(cols) > 5 else ''
        entries[match.group(1).lower()] = (source, line)
    counts = Counter(scope['classify_src'](source) if source else 'MISSING'
                     for source, _ in entries.values())
    print('Ledger source classifications (UNVERIFIED):', dict(sorted(counts.items())))
    crt_missing = sum(scope['classify_src'](src) == 'CRT-SRC' and
                      not (ROOT / 'glm' / src).is_file() for src, _ in entries.values())
    print('CRT-classified rows with missing source files:', crt_missing)
    print('NOTE: legacy CRT classifier tests pathname before checking file existence')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--object', type=Path)
    parser.add_argument('--address')
    parser.add_argument('--symbol')
    args = parser.parse_args()
    digest = hashlib.sha256(ANCHOR.read_bytes()).hexdigest()
    if digest != EXPECTED:
        raise SystemExit('ANCHOR HASH MISMATCH: ' + digest)
    print('ANCHOR SHA-256 OK:', digest)
    matcher = load_matcher()
    print('LEGACY MATCHER SHA-256:', hashlib.sha256(
        (ROOT / 'glm/tools/match_gfx.py').read_bytes()).hexdigest())
    self_check(matcher)
    ledger_audit()
    if args.object:
        if not args.address or not args.symbol:
            parser.error('--object requires --address and --symbol')
        score = matcher['cmd_diff'](args.address, str(args.object), args.symbol)
        print('LEGACY DIAGNOSTIC SCORE:', score, '(not binding/boundary proof)')


if __name__ == '__main__':
    main()
