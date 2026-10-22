# pdbsyms.py <dll> <pdb>: print "va kind name" for data/proc symbols in an MSVC 7.x PDB (MSF 7.00).
# Supplies the static data the linker map omits, so bindcheck can bind file-static globals.
import struct, sys, pefile

def msf_streams(path):
    d = open(path, 'rb').read()
    assert d.startswith(b'Microsoft C/C++ MSF 7.00\r\n\x1aDS\0\0\0')
    psz, _, _, dsz, _, bmap = struct.unpack_from('<6I', d, 32)
    npages = (dsz + psz - 1) // psz
    dpages = struct.unpack_from('<%dI' % npages, d, bmap * psz)
    dirb = b''.join(d[p * psz:(p + 1) * psz] for p in dpages)[:dsz]
    n = struct.unpack_from('<I', dirb, 0)[0]
    sizes = struct.unpack_from('<%dI' % n, dirb, 4)
    pos, out = 4 + 4 * n, []
    for s in sizes:
        if s == 0xffffffff:
            out.append(b''); continue
        k = (s + psz - 1) // psz
        pages = struct.unpack_from('<%dI' % k, dirb, pos); pos += 4 * k
        out.append(b''.join(d[p * psz:(p + 1) * psz] for p in pages)[:s])
    return out

def records(buf):
    i = 0
    while i + 4 <= len(buf):
        ln, kind = struct.unpack_from('<HH', buf, i)
        if ln < 2: break
        yield kind, buf[i + 4:i + 2 + ln]
        i += 2 + ln

DATA = {0x110c: 'ldata', 0x110d: 'gdata', 0x1007: 'ldata', 0x1008: 'gdata',
        0x110f: 'lproc', 0x1110: 'gproc', 0x100a: 'lproc', 0x100b: 'gproc'}

def contributions(dll, pdb):
    """Exact linked section contributions, including unnamed compiler tables."""
    pe = pefile.PE(dll, fast_load=True)
    dbi = msf_streams(pdb)[3]
    modsz, size = struct.unpack_from('<ii', dbi, 24)
    modules, i = [], 64
    while i < 64 + modsz:
        first = dbi.index(b'\0', i + 64)
        end = dbi.index(b'\0', first + 1)
        modules.append(dbi[i + 64:first].decode('latin1'))
        i = (end + 4) & ~3
    data = dbi[64 + modsz:64 + modsz + size]
    if not data:
        return
    if data[:4] != struct.pack('<I', 0xf12eba2d) or (len(data) - 4) % 28:
        raise ValueError('Unsupported PDB section contribution format')
    for i in range(4, len(data), 28):
        seg, _, off, count, flags, mod, _, _, _ = struct.unpack_from('<HHIIIHHII', data, i)
        if not 1 <= seg <= len(pe.sections) or mod >= len(modules):
            raise ValueError('Invalid PDB section contribution owner')
        section = pe.sections[seg - 1]
        if off + count > section.Misc_VirtualSize:
            raise ValueError('PDB contribution exceeds linked section')
        if count:
            yield pe.OPTIONAL_HEADER.ImageBase + section.VirtualAddress + off, count, flags, modules[mod]

def syms(dll, pdb):
    pe = pefile.PE(dll, fast_load=True)
    base = pe.OPTIONAL_HEADER.ImageBase
    secs = [s.VirtualAddress for s in pe.sections]
    st = msf_streams(pdb)
    dbi = st[3]
    gsi, _, psi, _, symrec = struct.unpack_from('<HHHHH', dbi, 12)
    modsz = struct.unpack_from('<i', dbi, 24)[0]
    bufs = []
    i = 64
    while i < 64 + modsz:
        mstream, symsz = struct.unpack_from('<HI', dbi, i + 34)
        j = i + 64
        k = dbi.index(b'\0', j) + 1
        obj = dbi[k:dbi.index(b'\0', k)].decode('latin1')
        j = dbi.index(b'\0', k) + 1
        i = (j + 3) & ~3
        if mstream != 0xffff:
            bufs.append((st[mstream][4:symsz], obj))
    bufs.append((st[symrec], ''))  # after modules, so module-owned records keep their object name
    seen = set()
    for buf, obj in bufs:
        for kind, r in records(buf):
            if kind not in DATA: continue
            if kind in (0x110c, 0x110d, 0x1007, 0x1008):
                off, seg = struct.unpack_from('<IH', r, 4); nm = r[10:]
            elif kind in (0x110f, 0x1110):
                off, seg = struct.unpack_from('<IH', r, 28); nm = r[35:]
            else:
                off, seg = struct.unpack_from('<IH', r, 28); nm = r[35:]
            if kind < 0x1100:
                nm = nm[1:1 + nm[0]]
            else:
                nm = nm.split(b'\0')[0]
            if not 1 <= seg <= len(secs): continue
            va = base + secs[seg - 1] + off
            key = va
            if key in seen: continue
            seen.add(key)
            yield va, DATA[kind], nm.decode('latin1'), obj

if __name__ == '__main__':
    for va, k, n, o in sorted(syms(sys.argv[1], sys.argv[2])):
        print('%08x %s %s %s' % (va, k, n, o))
