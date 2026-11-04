import re, struct
m = open("t.map").read(); d = open("t.exe", "rb").read()
pe = struct.unpack_from("<I", d, 0x3c)[0]; sec = pe + 24 + struct.unpack_from("<H", d, pe + 20)[0]
va, raw = struct.unpack_from("<I", d, sec + 12)[0], struct.unpack_from("<I", d, sec + 20)[0]
for name in ("_zcfree", "_Z_FreeInternal", "_seekend"):
    a = int(re.search(r"\s%s\s+([0-9a-f]{8})" % name, m).group(1), 16)
    off = a - 0x400000 - va + raw
    print(name, hex(a), d[off:off + 16].hex())
