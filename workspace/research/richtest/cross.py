import sys, struct
sys.path.insert(0, "/w/tools")
import match_radiant as m
from capstone import CS_ARCH_X86, CS_MODE_32, Cs
rows = [l.split("\t") for l in open("/w/data/ltcg.tsv").read().splitlines()[1:]]
tu = {l.split("\t")[0]: l.split("\t")[2:] for l in open("/w/data/tu_map.tsv").read().splitlines()[1:]}
hits = [r for r in rows if r[4] == "CROSS" and "radiant/MainFrm.cpp" in r[3]][:2]
text = m.SECTIONS[".text"]; code = m._image[text["ptr"]:text["ptr"] + text["vs"]]; base = m.IMAGE_BASE + text["va"]
for addr, regs, t, callers, _ in hits:
    print("== callee", addr, t, tu.get(addr), "reads", regs, "callers", callers)
    c, _ = m.carve(addr)
    for i, ins in enumerate(Cs(CS_ARCH_X86, CS_MODE_32).disasm(c, int(addr, 16))):
        print("     %-6s %s" % (ins.mnemonic, ins.op_str))
        if i > 4: break
    dest = int(addr, 16)
    for i in range(len(code) - 5):
        if code[i] == 0xE8 and (base + i + 5 + struct.unpack_from("<i", code, i + 1)[0]) & 0xFFFFFFFF == dest:
            site = base + i
            k = max(a for a in (int(x, 16) for x in m.FUNCTIONS) if a <= site)
            if tu.get("0x%08x" % k, [""])[0] != "radiant/MainFrm.cpp":
                continue
            print("   call site %x in %x (%s); before it:" % (site, k, tu.get("0x%08x" % k)))
            for ins in list(Cs(CS_ARCH_X86, CS_MODE_32).disasm(m._image[m.rva_to_offset(site - 12 - m.IMAGE_BASE):m.rva_to_offset(site + 5 - m.IMAGE_BASE)], site - 12))[-5:]:
                print("     %-6s %s" % (ins.mnemonic, ins.op_str))
            break
