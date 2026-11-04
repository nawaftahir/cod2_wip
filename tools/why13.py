#!/usr/bin/env python3
"""why13.py: S = retail1.0 fns matched in our 1.0 build, unmatched in our 1.3 build (cmp13).
For each, compare (norm-masked) our-1.3 bytes vs our-1.0 bytes vs retail 1.3; bucket the cause.
run from dev/claude_client13: python3 ../lab13/wD/tools/why13.py"""
import bisect, collections, hashlib, json, re, struct, sys
src = open('../claude_client/alldiff_lib.py').read()
exec('import re, capstone\n' + src.split('\n')[1] + '\ndef norm' + src.split('def norm')[1].split('def ours')[0])

def text(p):
    d = open(p, 'rb').read(); pe = struct.unpack_from('<I', d, 0x3c)[0]; oh = struct.unpack_from('<H', d, pe + 20)[0]
    for i in range(struct.unpack_from('<H', d, pe + 6)[0]):
        n, vs, va, rs, ro = struct.unpack_from('<8sIIII', d, pe + 24 + oh + 40 * i)
        if n.startswith(b'.text'): return d[ro:ro + vs], 0x400000 + va
def mapsyms(p, b, t):
    r = {}
    for l in open(p, errors='replace'):
        m = re.match(r'\s*0001:\S+\s+(\S+)\s+([0-9a-f]{8}) f', l)
        if m and b <= int(m.group(2), 16) < b + len(t): r.setdefault(m.group(1), int(m.group(2), 16))
    return r
def body(t, b, starts, a):
    i = bisect.bisect_right(starts, a); e = starts[i] if i < len(starts) else b + len(t)
    return t[a - b:e - b].rstrip(b'\xcc')
key = lambda c, a: tuple(norm(c, a, len(c)))

o10, b10 = text('../claude_client/target/build/CoD2MP_s.exe')
o13, b13 = text('target/build/release/CoD2MP_s.exe')
r13, rb13 = text('../cod2_wip/binaries/windows/1.3/CoD2MP_s.exe')
m10 = mapsyms('../claude_client/target/build/CoD2MP_s.map', o10, b10) if False else mapsyms('../claude_client/target/build/CoD2MP_s.map', b10, o10)
m13 = mapsyms('target/build/release/CoD2MP_s.map', b13, o13)
s10, s13 = sorted(m10.values()), sorted(m13.values())
good = {x['name'] for x in json.load(open('../claude_client/target/build/good.json')) if x['hits']}
c13 = {x['name']: x for x in json.load(open(sys.argv[1] if len(sys.argv) > 1 else "target/build/cmp13.json"))}
# retail 1.3 fn split (classify13 logic), keyed by norm
st = {rb13} | {rb13 + k for k in range(16, len(r13), 16) if r13[k-1] in (0xcc, 0xc3) or r13[k-2:k] == b'\xc2\x00'}
for i in range(len(r13) - 5):
    if r13[i] == 0xe8:
        x = rb13 + i + 5 + struct.unpack_from('<i', r13, i + 1)[0]
        if rb13 <= x < rb13 + len(r13): st.add(x)
st = sorted(st); R = {}
for a, e in zip(st, st[1:] + [rb13 + len(r13)]):
    c = r13[a - rb13:e - rb13].rstrip(b'\xcc')
    if c: R.setdefault(key(c, a), a)
# raw-ish key: only mask call/jmp targets (keep constants): finds data-address-only diffs
def rk(c, a): return tuple(re.sub(r'0x[0-9a-f]+', 'A', s) if s.startswith(('call', 'jmp')) else s for s in norm_raw(c, a))
def norm_raw(c, a): return ['%s %s' % (i.mnemonic, i.op_str) for i in md.disasm(c, a)]

B = collections.Counter(); N = collections.Counter(); ex = collections.defaultdict(list)
for n, x in c13.items():
    if x['hits'] or n not in good or n not in m10: continue
    a10, a13 = m10[n], m13[n]
    c10, cc13 = body(o10, b10, s10, a10), body(o13, b13, s13, a13)
    k10, k13 = key(c10, a10), key(cc13, a13)
    in13 = k10 in R  # retail 1.3 has the 1.0 code (norm-identical)
    if k13 == k10:
        cause = 'ours13==ours10 (norm), retail13 has it' if in13 else 'ours13==ours10, retail13 differs (real 1.3 change)'
        if in13:
            # norm-equal but cmp.py failed: mask/pairing; check if differing only in imm<5hex or reloc
            ra = R[k10]; rc = r13[ra - rb13:ra - rb13 + len(cc13)]
            cause = 'NORM-EQUAL, cmp13 miss (mask)'
            if len(cc13) < 6: cause = 'tiny <6B (skipped by cmp)'
    elif not in13:
        cause = 'retail13 != retail10 too (real 1.3 change / CHANGED)'
    else:
        d = [(p, q) for p, q in zip(k10, k13) if p != q]
        if len(k10) != len(k13): cause = 'ours13 len differs (inline/codegen)'
        elif all(p.split()[0] == q.split()[0] for p, q in d):
            regs = all(re.sub(r'e?[abcd]x|e[sd]i|ebp|[abcd][lh]', 'R', p) == re.sub(r'e?[abcd]x|e[sd]i|ebp|[abcd][lh]', 'R', q) for p, q in d)
            cause = 'register alloc only' if regs else 'operand diff same opcodes (small consts/offsets)'
        else: cause = 'opcode diff, same length'
    B[cause] += len(cc13); N[cause] += 1
    if len(ex[cause]) < 8: ex[cause].append('%s %x/%x %d' % (n, a10, a13, len(cc13)))
for c, v in B.most_common(): print('%-55s %5d fns %8d B   e.g. %s' % (c, N[c], v, '; '.join(ex[c][:4])))
print('total', sum(B.values()))
