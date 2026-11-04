"""Strict retail complete-file proof for src/radiant/points.cpp.

This is not a claim of completion: file_ledger.py must register this proof
only after the complete retail function, source ownership, static binding,
literal, and linked-call audits all pass. No ASM or byte injection.
"""
import sys
sys.path.insert(0, "tools")
import verify as v
from capstone.x86 import X86_OP_MEM

SOURCE = "src/radiant/points.cpp"
START, END = 0x0046c540, 0x0046cb0e
EXPECTED = {
    0x0046c540: 181,  # Pointfile_Delete
    0x0046c600: 315,  # Pointfile_Next
    0x0046c740: 306,  # Pointfile_Prev
    0x0046c880: 450,  # Pointfile_Check
    0x0046ca50: 156,  # Pointfile_Draw
    0x0046caf0: 11,  # Pointfile_Clear
    0x0046cb00: 14,  # Pointfile_HasPoints
}

img = v.Linked()
ret = v.pefile.PE(str(v.link.RETAIL), fast_load=True)
names = v.known_names()
rows = sorted((r for r in v.read_tsv("ledger/matches.tsv")
               if r["source"] == SOURCE), key=lambda r: int(r["addr"],16))
mapped = sorted((r for r in v.read_tsv("data/tu_map.tsv")
                 if r["tu"] in (SOURCE, SOURCE.removeprefix("src/"))),
                key=lambda r: int(r["addr"],16))
assert {(int(r["addr"],16),int(r["size"])) for r in rows} == set(EXPECTED.items()), "missing game bodies"
assert {(int(r["addr"],16),int(r["size"])) for r in mapped} == set(EXPECTED.items()), "retail TU inventory incomplete"
assert not [r for r in v.read_tsv("ledger/compiler.tsv") if r["source"] == SOURCE], "unreviewed compiler-owned body"
assert set(img.of_source(SOURCE)) == {r["symbol"] for r in rows}, "extra or missing linked source-owned functions"
assert [img.syms[r["symbol"]] for r in rows] == sorted(img.syms[r["symbol"]] for r in rows), "source emit order"

def retail_bytes(va, n):
    raw = ret.get_data(va-ret.OPTIONAL_HEADER.ImageBase,n)
    assert len(raw) == n, (hex(va), n)
    return raw

md = v.matcher.Cs(v.matcher.CS_ARCH_X86,v.matcher.CS_MODE_32)
md.detail = True
aliases = {}
cursor = START
for r in rows:
    addr,size = int(r["addr"],16), int(r["size"])
    assert START <= addr and addr+size <= END and addr >= cursor
    assert set(retail_bytes(cursor,addr-cursor)) <= {0x90,0xcc}, ("non-padding gap",hex(cursor),hex(addr))
    result,why = v.check(img,r["addr"],r["symbol"],names)
    assert result == "MATCH", (r["symbol"],result,why)
    ours, body = img.code(r["symbol"])
    retail = retail_bytes(addr,size)
    assert len(body) == size
    origins = list(md.disasm(retail,addr))
    candidates = list(md.disasm(body,ours))
    assert len(origins)==len(candidates), (hex(addr),"instruction count")
    for ti,oi in zip(origins,candidates):
        assert ti.address-addr==oi.address-ours and ti.mnemonic==oi.mnemonic, (hex(addr),ti.mnemonic,oi.mnemonic)
        for op, q in zip(ti.operands,oi.operands):
            if op.type == q.type == X86_OP_MEM and op.mem.base==0 and op.mem.index==0 and q.mem.base==0 and q.mem.index==0:
                a,b=op.mem.disp,q.mem.disp
                if 0x01000000<=a<0x01300000 and img.base<=b<img.base+img.pe.OPTIONAL_HEADER.SizeOfImage:
                    assert aliases.setdefault(a,b)==b, ("static storage split",hex(a),hex(b))
    cursor = addr+size
assert set(retail_bytes(cursor,END-cursor)) <= {0x90,0xcc}, "non-padding tail"
assert len(aliases)>=4, ("insufficient static identity evidence",aliases)
for message in (b"End of pointfile\0",b"Start of pointfile\0",b"Reading pointfile %s\n\0",b".lin\0"):
    assert message in img.pe.__data__, ("missing retail literal",message)
print("PASS: points.cpp FILE VERIFIED; 7 exact linked bodies, retail gaps and order, static BSS aliases, four literals; no extra helpers")
