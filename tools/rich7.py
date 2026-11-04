#!/usr/bin/env python3
"""rich7.py exe...: decode the Rich header (compid: prod id, build number, count)"""
import sys, struct
for p in sys.argv[1:]:
    d = open(p, 'rb').read(0x400)
    e = d.find(b'Rich')
    key = struct.unpack_from('<I', d, e + 4)[0]
    s = d.find(struct.pack('<I', 0x536e6144 ^ key))  # 'DanS'
    ent = []
    i = s + 16
    while i < e:
        a, b = struct.unpack_from('<II', d, i)
        a ^= key; b ^= key
        ent.append((a >> 16, a & 0xffff, b))
        i += 8
    print(p)
    for pid, build, cnt in ent: print('  prod %3d build %5d count %d' % (pid, build, cnt))
