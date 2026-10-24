#!/usr/bin/env python3
"""Map every linked game function to its retail source file.

Address: accepted bind > unique byte hit > PINNED comment in source.
File: Mac 1.3 decompile (refrences/cod2-mp-macho/PC) by function name.
Retail file intervals come from functions that have both; a function with
an address but no Mac name takes the file whose interval holds it.
Writes layout/file_layout.tsv and prints a per-TU move summary.
"""
import collections, glob, json, os, re, sys
from pathlib import Path

work = Path(__file__).resolve().parents[1]
dev = work.parents[2]
build = Path(sys.argv[1]) if len(sys.argv) > 1 else work / 'build'
mac_root = dev / 'refrences/cod2-mp-macho/PC'
tus = [l.split()[0] for l in open(work / 'src/tus.txt') if l.strip() and not l.startswith('#')]
tu_of_obj = {t.split('/')[-1].rsplit('.', 1)[0]: t for t in tus}

def plain(sym):
    m = re.match(r'\?([A-Za-z_]\w*)@', sym) or re.match(r'_([A-Za-z_]\w*?)(@\d+)?$', sym)
    return m.group(1) if m else None

# linked game functions: (obj, symbol)
funcs = []
for l in open(build / 'gfx.map'):
    m = re.match(r'\s*0001:[0-9a-f]+\s+(\S+)\s+[0-9a-f]{8}\s+f\s+(?:i\s+)?(\w+)\.obj$', l)
    if m and m.group(2) in tu_of_obj:
        funcs.append((m.group(2), m.group(1)))

bind = json.load(open(build / 'bind.json'))
hits = {}
for e in json.load(open(build / 'cmp.json')):
    if len(e['hits']) == 1:
        hits[e['name']] = int(e['hits'][0], 16)

# PINNED <addr> comment directly above a definition
pinned = {}
for tu in tus:
    lines = (work / 'src' / tu).read_text(errors='ignore').splitlines()
    for i, l in enumerate(lines):
        m = re.search(r'PINNED (?:0x)?(10[0-9a-f]{6})\b', l)
        if not m:
            continue
        for d in lines[i + 1:i + 4]:
            n = re.match(r'^[A-Za-z_][\w \*&:<>,]*?\b([A-Za-z_]\w*)\s*\(', d)
            if n and not d.rstrip().endswith(';'):
                pinned.setdefault((tu, n.group(1)), int(m.group(1), 16))
                break

mac = collections.defaultdict(set)
for f in glob.glob(str(mac_root / '*/*.c')):
    rel = os.path.relpath(f, mac_root).rsplit('.', 1)[0]
    # the Mac binary is the whole game; only these directories exist in the renderer DLL
    if rel.split('/')[0] not in ('gfx_d3d', 'universal', 'qcommon', 'win32'):
        continue
    for l in open(f, errors='ignore'):
        m = re.match(r'^[A-Za-z_][\w \*]*?\b([A-Za-z_]\w*)\s*\([^;]*$', l)
        if m:
            mac[m.group(1)].add(rel)

rows = []
for obj, sym in funcs:
    name = plain(sym)
    tu = tu_of_obj[obj]
    b = bind.get(sym)
    if b and not b.get('why'):
        addr, src = int(b['t'], 16), 'bind'
    elif sym in hits:
        addr, src = hits[sym], 'hit'
    elif (tu, name) in pinned:
        addr, src = pinned[(tu, name)], 'pinned'
    else:
        addr, src = None, '-'
    files = mac.get(name, set())
    rows.append([tu, sym, name, addr, src, files.pop() if len(files) == 1 else ''])

# retail file intervals from rows with both address and a unique Mac file
anchors = sorted((r[3], r[5]) for r in rows if r[3] and r[5])
def file_at(addr):
    lo = [f for a, f in anchors if a <= addr][-1:]
    hi = [f for a, f in anchors if a >= addr][:1]
    return lo[0] if lo and hi and lo == hi else ''

out = work / 'layout/file_layout.tsv'
with open(out, 'w') as f:
    f.write('# tu\tsymbol\tretail_addr\taddr_source\tmac_file\tplaced_file\tplacement\n')
    for tu, sym, name, addr, src, mfile in sorted(rows, key=lambda r: (r[3] or 0, r[1])):
        if mfile:
            placed, how = mfile, 'mac-name'
        elif addr and file_at(addr):
            placed, how = file_at(addr), 'interval'
        else:
            placed, how = '', 'unknown'
        f.write(f"{tu}\t{sym}\t{addr and format(addr, '08x') or '-'}\t{src}\t{mfile or '-'}\t{placed or '-'}\t{how}\n")

summary = collections.defaultdict(collections.Counter)
for l in open(out):
    if l.startswith('#'):
        continue
    tu, sym, addr, src, mfile, placed, how = l.rstrip('\n').split('\t')
    summary[tu][placed] += 1
for tu in tus:
    if tu in summary:
        print(tu, dict(summary[tu].most_common()))
