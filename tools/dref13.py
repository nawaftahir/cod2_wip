import sys, struct, pefile
# dref13.py ours.exe retail.exe addr...: retail value of the same 4-byte .text operand for each of our data addresses (finds .bss/.data drift)
o, r = pefile.PE(sys.argv[1]), pefile.PE(sys.argv[2])
def text(pe):
    t = next(s for s in pe.sections if s.Name.startswith(b'.text'))
    return t.get_data(), pe.OPTIONAL_HEADER.ImageBase + t.VirtualAddress
od, ob = text(o); rd, rb = text(r)
assert ob == rb
n = min(len(od), len(rd))
for a in sys.argv[3:]:
    v = int(a, 16); key = struct.pack('<I', v); seen = {}
    i = od.find(key)
    while i != -1 and i + 4 <= n:
        rv = struct.unpack('<I', rd[i:i + 4])[0]
        if abs(rv - v) < 0x100: seen[rv] = seen.get(rv, 0) + 1
        i = od.find(key, i + 1)
    print('%x -> %s' % (v, ' '.join('%x:%d' % kv for kv in sorted(seen.items(), key=lambda x: -x[1])[:3])))
