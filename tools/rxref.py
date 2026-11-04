#!/usr/bin/env python3
# rxref.py rdata_off...: .text addresses (retail 1.3) that reference .rdata offset (4-byte abs ptr), with nearest matched-fn name from cmp13.json
import pefile, sys, json, re, bisect
R = '/home/nawaf/cod2/test/dev/'
pe = pefile.PE(R + 'cod2engineold/binaries/windows/1.3/CoD2MP_s.exe')
sec = {s.Name.rstrip(b'\0'): s for s in pe.sections}
tx = sec[b'.text']; td = tx.get_data(); tva = tx.VirtualAddress + 0x400000
rva = sec[b'.rdata'].VirtualAddress + 0x400000
try:
    cm = json.load(open(R + 'claude_client13/lab13/s2/target/build/cmp13.json'))
except Exception: cm = []
addrs = sorted((int(h, 16), x['name'], x['obj']) for x in cm for h in x['hits'][:1] if len(x['hits']) == 1)
for a in sys.argv[1:]:
    v = rva + int(a, 16); b = v.to_bytes(4, 'little')
    for m in re.finditer(re.escape(b), td):
        pc = tva + m.start()
        k = bisect.bisect(addrs, (pc, '~', '')) - 1
        print('%s <- %08x  after %s' % (a, pc, '%x %s %s' % addrs[k] if k >= 0 else '?'))
