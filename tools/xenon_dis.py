#!/usr/bin/env python3
"""Static reader for an Xbox 360 XEX2 client image + its MSVC link map (reference only).

usage: python3 -I xenon_dis.py EXE MAP calls|dis|find NAME_OR_REGEX [...]
  calls  ordered callee list (bl targets by map name), string refs, branch/ret counts
  dis    full disassembly annotated with map names (local use, never commit the output)
  find   list map symbols matching a regex

The XEX2 is read in memory (devkit zero key, basic compression); nothing is written or run.
Needs: cryptography, capstone (PPC big-endian). Altivec/VMX128 words that capstone
cannot decode are printed as .long and counted.
"""
import re
import struct
import sys

from capstone import CS_ARCH_PPC, CS_MODE_32, CS_MODE_BIG_ENDIAN, Cs
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

BASE_MAP = 0x400000  # map "Rva+Base" column is rva + 0x400000


def aes_cbc0(key, data):
    return Cipher(algorithms.AES(key), modes.CBC(bytes(16))).decryptor().update(data)


def load_image(path):
    """Return (flat memory image, load address)."""
    d = open(path, "rb").read()
    if d[:4] != b"XEX2":
        raise SystemExit("not an XEX2")
    dataoff, secoff, nopt = struct.unpack_from(">III", d, 8)[0], struct.unpack_from(">I", d, 16)[0], struct.unpack_from(">I", d, 20)[0]
    opts = {}
    for i in range(nopt):
        k, v = struct.unpack_from(">II", d, 0x18 + i * 8)
        opts[k] = v
    load = struct.unpack_from(">I", d, secoff + 0x110)[0]
    img_size = struct.unpack_from(">I", d, secoff + 4)[0]
    filekey = d[secoff + 0x150:secoff + 0x160]
    ffi = opts[0x3ff]
    _, enc, comp = struct.unpack_from(">IHH", d, ffi)
    body = d[dataoff:]
    if enc:
        sk = aes_cbc0(bytes(16), filekey)  # devkit key; retail keys would be needed otherwise
        body = aes_cbc0(sk, body[:len(body) & ~15])
    if body[:2] != b"MZ" and comp == 1:
        raise SystemExit("decrypt failed (not a devkit-key image?)")
    if comp == 1:  # basic: list of (data_size, zero_size)
        sz = struct.unpack_from(">I", d, ffi)[0]
        img = bytearray()
        pos = 0
        for i in range((sz - 8) // 8):
            ds, zs = struct.unpack_from(">II", d, ffi + 8 + i * 8)
            img += body[pos:pos + ds] + bytes(zs)
            pos += ds
    elif comp == 0:
        img = bytearray(body)
    else:
        raise SystemExit("compression type %d unsupported" % comp)
    return bytes(img), load


def load_map(path):
    syms = []  # (rva, name, lib:obj)
    rx = re.compile(r"^\s*[0-9a-f]{4}:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s+(?:f i |f |i )?(\S.*)?$")
    for line in open(path, errors="replace"):
        m = rx.match(line)
        if m and int(m.group(2), 16) >= BASE_MAP:
            syms.append((int(m.group(2), 16) - BASE_MAP, m.group(1), (m.group(3) or "").strip()))
    syms.sort()
    return syms


def short(n):
    """?Name@@YA... / ?Name@Class@@... -> Name (plain C names unchanged)."""
    m = re.match(r"^\?\??([^@?]+)@", n)
    return m.group(1) if n.startswith("?") and m else n


class Ref:
    def __init__(self, exe, mp):
        self.img, self.load = load_image(exe)
        self.syms = load_map(mp)
        self.by_name = {}
        for s in self.syms:
            self.by_name.setdefault(s[1], s)
            self.by_name.setdefault(short(s[1]), s)
        self.rvas = [s[0] for s in self.syms]
        self.cs = Cs(CS_ARCH_PPC, CS_MODE_32 | CS_MODE_BIG_ENDIAN)
        self.cs.detail = True

    def name_at(self, va):
        import bisect
        rva = va - self.load
        i = bisect.bisect_right(self.rvas, rva) - 1
        if i < 0:
            return None
        o = rva - self.rvas[i]
        n = short(self.syms[i][1])
        return n if o == 0 else "%s+0x%x" % (n, o)

    def func_bytes(self, name):
        import bisect
        s = self.by_name[name]
        i = bisect.bisect_right(self.rvas, s[0])
        end = s[0] + 4
        # next symbol that starts a different address and is text; cap at 64 KB
        while i < len(self.syms) and self.syms[i][0] <= s[0]:
            i += 1
        end = self.syms[i][0] if i < len(self.syms) else s[0] + 4
        end = min(end, s[0] + 0x10000)
        return s[0] + self.load, self.img[s[0]:end]

    def string_at(self, va):
        o = va - self.load
        if not 0 <= o < len(self.img):
            return None
        e = self.img.find(b"\0", o, o + 160)
        t = self.img[o:e] if e > o else b""
        if len(t) >= 3 and all(32 <= c < 127 or c in (9, 10) for c in t):
            return t.decode()
        return None

    def insns(self, name):
        va, b = self.func_bytes(name)
        out = []
        for off in range(0, len(b) - 3, 4):
            w = b[off:off + 4]
            got = next(self.cs.disasm(w, va + off), None)
            out.append((va + off, w, got))
        return out


def cmd_calls(r, name):
    ins = r.insns(name)
    undec = sum(1 for a, w, g in ins if g is None)
    hi = {}
    calls, strs, nb, nret = [], [], 0, 0
    for a, w, g in ins:
        if g is None:
            continue
        m, ops = g.mnemonic, g.op_str
        if m == "bl":
            t = int(ops.split()[-1], 0) if ops.startswith("0x") else None
            if t is None:
                t = g.operands[0].imm & 0xFFFFFFFF
            calls.append(r.name_at(t) or hex(t))
        elif m == "bctrl":
            calls.append("<indirect>")  # function pointer (re.*, vtable, ...)
        elif m == "blr":
            nret += 1
        elif m in ("lis", "li") and len(g.operands) == 2:
            hi[g.operands[0].reg] = (m, g.operands[1].imm & 0xFFFF)
        elif m in ("addi", "ori") and len(g.operands) == 3 and g.operands[1].reg in hi:
            k, v = hi[g.operands[1].reg]
            if k == "lis":
                lo = g.operands[2].imm & 0xFFFF
                if m == "addi" and lo >= 0x8000:
                    lo -= 0x10000
                va = (v << 16) + lo
                s = r.string_at(va)
                if s:
                    strs.append(s)
        if m.startswith("b") and m not in ("bl", "blr", "bctr", "bctrl", "blrl"):
            nb += 1
    print("%s: %d insns, %d undecodable, %d cond/uncond branches, %d blr" % (name, len(ins), undec, nb, nret))
    print("  calls:", " > ".join(calls))
    print("  strings:", strs)


def cmd_dis(r, name):
    for a, w, g in r.insns(name):
        if g is None:
            print("%08x  .long 0x%s" % (a, w.hex()))
            continue
        extra = ""
        if g.mnemonic in ("bl", "b", "beq", "bne", "blt", "bgt", "ble", "bge") and g.operands:
            t = g.operands[-1].imm & 0xFFFFFFFF
            extra = "  ; " + (r.name_at(t) or "")
        print("%08x  %s %s%s" % (a, g.mnemonic, g.op_str, extra))


def main(argv):
    if len(argv) < 4:
        print(__doc__)
        return 2
    exe, mp, cmd, rest = argv[0], argv[1], argv[2], argv[3:]
    r = Ref(exe, mp)
    if cmd == "find":
        for pat in rest:
            for s in r.syms:
                if re.search(pat, s[1]):
                    print("%08x %s %s" % (s[0] + r.load, s[1], s[2]))  # raw mangled name shows the signature
        return 0
    for n in rest:
        if n not in r.by_name:
            print("%s: not in map" % n)
            continue
        (cmd_calls if cmd == "calls" else cmd_dis)(r, n)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
