#!/usr/bin/env python3
"""oom7.py: retail 1.3 HT_OUTOFMEM call sites (call 0x550f90): file, line, name -> compare with our sources"""
import pefile, struct, re, glob, sys
R = '/home/nawaf/cod2/test/dev/cod2engineold/binaries/windows/1.3/CoD2MP_s.exe'
pe = pefile.PE(R); base = 0x400000
t = pe.get_data(0x1000, 0x19b000)
def cstr(va):
    o = va - base
    try: d = pe.get_data(o, 120)
    except Exception: return '?'
    return d.split(b'\0')[0].decode('latin1')
res = []
for m in re.finditer(rb'\xe8', t):
    i = m.start()
    if i + 5 > len(t): continue
    rel = struct.unpack_from('<i', t, i + 1)[0]
    if 0x401000 + i + 5 + rel != 0x550f90: continue
    # preceding: push imm32 (0x68) x3 = name, line? file ; search back 15 bytes
    pre = t[max(0, i - 20):i]
    pushes = [(k, struct.unpack_from('<I', pre, k + 1)[0]) for k in range(len(pre) - 4) if pre[k] in (0x68, 0x6a)]
    res.append((0x401000 + i, pre))
out = []
for a, pre in res:
    # decode last three pushes
    vals = []
    k = 0
    seq = []
    while k < len(pre):
        if pre[k] == 0x68 and k + 5 <= len(pre): seq.append(struct.unpack_from('<I', pre, k + 1)[0]); k += 5
        elif pre[k] == 0x6a and k + 2 <= len(pre): seq.append(pre[k + 1]); k += 2
        else: k += 1
    out.append((a, seq[-3:]))
for a, s in out:
    if len(s) == 3:
        line, f, n = s if s[1] >= base else (s[0], s[1], s[2])
        print(hex(a), cstr(s[1]).split('\\')[-1], s[0], cstr(s[2]))
