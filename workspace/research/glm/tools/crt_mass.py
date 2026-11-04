#!/usr/bin/env python3
"""crt_mass.py — mass-match the whole libcmt.lib member .text blobs against the DLL."""
import sys, struct, json
sys.path.insert(0, '/home/nawaf/cod2/test/dev/glm/tools')
import match_gfx as m

LIB = '/home/nawaf/cod2/test/dev/gemini/msvc710/Vc7/lib/libcmt.lib'
d = open(LIB, 'rb').read()

off = 8
symmap = {}
members = []
longnames = b''
while off + 60 <= len(d):
    hdr = d[off:off+60]
    name = hdr[:16].decode('ascii', 'replace').rstrip('\x00').rstrip()
    try:
        size = int(hdr[48:58].decode().strip())
    except ValueError:
        break
    body = d[off+60:off+60+size]
    if name == '/':
        try:
            cnt = struct.unpack('>I', body[:4])[0]
            if cnt * 4 + 4 > len(body):
                raise ValueError
            offs = struct.unpack(f'>{cnt}I', body[4:4+4*cnt])
            blob = body[4+4*cnt:]
            pos = 0
            for o in offs:
                end = blob.find(b'\x00', pos)
                if end < 0:
                    break
                symmap.setdefault(o, []).append(blob[pos:end].decode('ascii', 'replace'))
                pos = end + 1
        except Exception:
            pass
    elif name == '//':
        longnames = body
    else:
        members.append((off+60, size, name))
    off += 60 + size + (size & 1)

def resolve(ref):
    if not ref.startswith('/'):
        return ref
    try:
        o = int(ref[1:])
    except ValueError:
        return ref
    end = longnames.find(b'\n', o)
    return longnames[o:end if end >= 0 else len(longnames)].decode('ascii', 'replace').rstrip('/\r\n')

print(f"members: {len(members)}, symbol names: {sum(len(v) for v in symmap.values())}")

secs = m.SECS
tva, tvs, tra, trs = secs[".text"]
text = m._d[tra:tra+trs]
mask = set()
for p in m.PE_RELOCS:
    if tra <= p < tra + trs:
        for k in range(4):
            mask.add(p - tra + k)
i = 0
while i < len(text) - 5:
    if text[i] in (0xE8, 0xE9):
        disp = int.from_bytes(text[i+1:i+5], 'little', signed=True)
        if tva <= tva + i + 5 + disp < tva + tvs:
            for k in range(4):
                mask.add(i + 1 + k)
    i += 1
ntext = m.normalize(text, mask)

hits = {}
nchecked = 0
for boff, size, ref in members:
    mname = resolve(ref)
    names = symmap.get(boff - 60, [])
    body = d[boff:boff+size]
    m.obj_bytes_global = body
    try:
        c = m.parse_coff(body)
    except Exception:
        continue
    for secidx, sec in enumerate(c['sections'], 1):
        if not (sec['flags'] & 0x20) or sec['rawsize'] < 12:
            continue
        relocs = {r['vaddr'] for r in sec['relocs']}
        pat = m.normalize(body[sec['rawptr']:sec['rawptr']+sec['rawsize']], relocs)
        n = len(pat)
        if n < 12:
            continue
        nchecked += 1
        probe = bytes(pat[:12])
        pos = ntext.find(probe)
        while pos >= 0:
            ok = True
            for k in range(n):
                a = ntext[pos+k] if pos + k < len(ntext) else 0x100
                b = pat[k]
                if a != b and a != 0xAA and b != 0xAA:
                    ok = False
                    break
            if ok and (pos not in hits or n > hits[pos][0]):
                hits[pos] = (n, mname, names)
            pos = ntext.find(probe, pos + 1)

hs = sorted(hits.items())
tot = sum(h[1][0] for h in hs)
print(f"checked {nchecked} code blobs; {len(hs)} EXACT member matches, {tot} bytes")
for pos, (n, mname, names) in hs:
    print(f"  {tva+pos:#010x} len={n:<5} {mname} :: {names[:3]}")
json.dump([[tva + p, n, mn, ns] for p, (n, mn, ns) in hs],
          open('/home/nawaf/cod2/test/dev/glm/data/crt_member_matches.json', 'w'), indent=1)
