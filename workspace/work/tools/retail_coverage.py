"""Count proven retail file spans across sections, independently of final offsets."""
import contextlib
import hashlib
import io
import json
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import re
import runpy
import sys

import pefile


def file_span(pe, address, size):
    if size <= 0:
        return None
    rva = address - pe.OPTIONAL_HEADER.ImageBase
    for section in pe.sections:
        if section.VirtualAddress <= rva and rva + size <= section.VirtualAddress + min(
                section.SizeOfRawData, section.Misc_VirtualSize):
            return section.PointerToRawData + rva - section.VirtualAddress
    return None


def data_size(symbol, bound, raw, string_size):
    if symbol.startswith('??_C@'):
        return string_size(symbol)
    match = re.match(r'^__(?:real|xmm)@([0-9a-fA-F]+)(?:$|[$#])', symbol)
    if match:
        size = len(match[1]) // 2
        return size if size in (4, 8, 16) else None
    if not 0 < bound <= 1048576 or not raw or not any(raw):
        return None
    return len(raw.rstrip(b'\0'))


def mark(mask, start, size):
    assert 0 <= start <= start + size <= len(mask)
    added = size - sum(mask[start:start + size])
    mask[start:start + size] = b'\1' * size
    return added


def data_equal(a, b, ova, tva, orel, arel):
    # The referee already bound pointers; also require equal bytes and relocation shape.
    if a is None or b is None or len(a) != len(b):
        return False
    k = 0
    while k < len(a):
        if (ova + k in orel) != (tva + k in arel):
            return False
        if ova + k in orel:
            if k + 4 > len(a):
                return False
            k += 4
        else:
            if a[k] != b[k]:
                return False
            k += 1
    return True


def report(build):
    work = Path(__file__).resolve().parents[1]
    gfx = work.parents[1]
    anchor = retail_anchor()
    digest = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
    assert digest(anchor) == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
    coverage = json.loads((work / 'proof/source_coverage_current.json').read_text())
    assert coverage['bind_sha256'] == digest(build / 'bind.json'), 'Run the full build gates first'
    layout = json.loads((work / 'layout/current.json').read_text())
    assert layout['candidate_sha256'] == digest(build / 'gfx.dll'), 'DLL changed after the build gates'
    for name, expected in coverage['source_sha256'].items():
        assert digest(work / 'src' / name) == expected, name
    inputs = [build / name for name in ['gfx.dll', 'gfx.map', 'gfx.pdb', 'cmp.json', 'bind.json']]
    inputs += [anchor, work / 'proof/source_coverage_current.json', work / 'layout/current.json', Path(__file__),
               gfx / 'tools/cmp.py', gfx / 'tools/bindcheck.py', gfx / 'tools/pdbsyms.py',
               gfx / 'tools/string_literal.py']
    inputs.append(gfx / 'tools/x86_instructions.py')
    identity = {str(path.resolve()): digest(path) for path in inputs}
    sys.path.insert(0, str(gfx / 'tools'))
    previous = sys.argv
    sys.argv = ['bindcheck.py', str(build / 'gfx.dll'), str(build / 'gfx.map'),
                str(anchor), str(build / 'cmp.json'), '--pdb', str(build / 'gfx.pdb')]
    try:
        with contextlib.redirect_stdout(io.StringIO()) as summary:
            referee = runpy.run_path(str(gfx / 'tools/bindcheck.py'), run_name='__main__')
    finally:
        sys.argv = previous
    ours, target = referee['ope'], referee['ape']
    original = anchor.read_bytes()
    mask = bytearray(len(original))
    regions, counts = [], {}
    excluded = {int(row['target'], 16) for row in coverage['excluded_assembly_bodies']}
    tus = [line.split()[0] for line in (work / 'src/tus.txt').read_text().splitlines()
           if line.strip() and not line.startswith('#')]
    authored = {Path(path).stem + '.obj' for path in tus if not path.startswith('jpeg-6b/')}
    fixups = set()

    def add(ova, tva, size, kind, symbol):
        ofile, tfile = file_span(ours, ova, size), file_span(target, tva, size)
        if ofile is None or tfile is None or not size:
            return
        added = mark(mask, tfile, size)
        counts[kind] = counts.get(kind, 0) + added
        regions.append(dict(retail_va=hex(tva), retail_file_offset=tfile,
                            candidate_va=hex(ova), bytes=size, kind=kind, symbol=symbol))
        for offset in range(size):
            if tva + offset in referee['arel'] and ova + offset in referee['orel']:
                fixups.add(tva + offset)

    rows = referee['results']
    replay = {name: dict(t=hex(row['t']), n=row['n'], obj=row['obj'], why=row['why'][:4])
              for name, row in rows.items()}
    assert replay == json.loads((build / 'bind.json').read_text()), 'Binding inputs changed after the build gates'
    for name, row in rows.items():
        if not row['why']:
            assert referee['masked_eq'](row['va'], row['t'], row['n']), ('Stale byte discovery', name)
    for name, row in rows.items():
        if row['why'] or row['t'] in excluded:
            continue
        source = row['obj'] in authored and '@std@@' not in name
        if source and not (0x10001000 <= row['t'] < 0x10041db0 or
                           0x10057990 <= row['t'] < 0x10062200):
            continue
        add(row['va'], row['t'], row['n'],
            'authored_compiled_extent' if source else 'dependency_compiled_extent', name)

    seen = set()
    for name, row in rows.items():
        if row['why'] or row['t'] in excluded:
            continue
        for symbol, ova, bound, tva in row.get('syms', []):
            key = symbol, ova, tva
            if key in seen or not referee['datacache'].get(symbol):
                continue
            seen.add(key)
            if referee['secname'](referee['osecs'], ova) not in ('.rdata', '.data'):
                continue
            literal = referee['literal'](symbol)
            if '#' in symbol and not literal or symbol.startswith('__imp_'):
                continue
            bound = min(bound, referee['trunc'].get(symbol, bound))
            raw = referee['read'](referee['osecs'], ova, bound) if 0 < bound <= 1048576 else None
            size = data_size(symbol, bound, raw, referee['string_size'])
            if size is None or file_span(ours, ova, size) is None or file_span(target, tva, size) is None:
                continue
            a = referee['read'](referee['osecs'], ova, size)
            b = referee['read'](referee['asecs'], tva, size)
            if not data_equal(a, b, ova, tva, referee['orel'], referee['arel']):
                continue
            add(ova, tva, size, 'verified_data', symbol)

    for block in target.DIRECTORY_ENTRY_BASERELOC:
        for entry in block.entries:
            if entry.type == 3 and target.OPTIONAL_HEADER.ImageBase + entry.rva in fixups:
                counts['relocation_entries'] = counts.get('relocation_entries', 0) + mark(
                    mask, entry.struct.get_file_offset(), 2)
    for path in inputs:
        assert digest(path) == identity[str(path.resolve())], ('input changed during proof', path)
    sections = [dict(section=s.Name.rstrip(b'\0').decode(), retail_file_bytes=s.SizeOfRawData,
                     verified_bytes=sum(mask[s.PointerToRawData:s.PointerToRawData + s.SizeOfRawData]))
                for s in target.sections]
    candidate = (build / 'gfx.dll').read_bytes()
    return dict(scope='Binding-verified retail file spans; not same-offset equality or whole-file identity',
                policy='Full closed code extents, independently validated initialized data, and linker fixup entries; no BSS, unowned zero padding or authored-assembly bodies.',
                retail_file_bytes=len(original), verified_file_bytes=sum(mask),
                verified_file_percent=100 * sum(mask) / len(mask),
                bytes_needed_for_50_percent=max(0, (len(mask) + 1) // 2 - sum(mask)),
                same_file_offset_percent=100 * sum(a == b for a, b in zip(original, candidate)) / max(len(original), len(candidate)),
                counts=counts, sections=sections, regions=regions,
                referee_summary=summary.getvalue().strip(), input_sha256=identity,
                candidate_sha256=digest(build / 'gfx.dll'), anchor_sha256=digest(anchor))


if __name__ == '__main__':
    build = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else Path(__file__).resolve().parents[1] / 'build'
    print(json.dumps(report(build), indent=2))
