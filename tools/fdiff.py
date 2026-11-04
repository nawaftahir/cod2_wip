from renderer_paths import retail_anchor
# fdiff.py <mangled-name-substr> <anchor-va-hex> [build dir]: our function vs retail, addresses masked
import sys, re, json, pefile, capstone, difflib
name, ava = sys.argv[1], int(sys.argv[2], 16)
B = sys.argv[3] if len(sys.argv) > 3 else 'build/closed'
cmp = json.load(open(B + '/cmp.json'))
f = [x for x in cmp if name in x['name']][0]
m = [l.split() for l in open(B + '/gfx.map') if f['name'] in l and len(l.split()) > 2]
ova = int([t for t in m[0] if len(t) == 8 and re.fullmatch('[0-9a-f]{8}', t)][0], 16)
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
def dis(p, va, n):
    pe = pefile.PE(p, fast_load=True)
    d = pe.get_data(va - pe.OPTIONAL_HEADER.ImageBase, n)
    return [re.sub(r'0x10[0-9a-f]{6}', 'A', f'{i.mnemonic} {i.op_str}') for i in md.disasm(d, va)]
a = dis(B + '/gfx.dll', ova, f['size'])
b = dis(str(retail_anchor()), ava, f['size'] + 64)
print(f['name'], hex(ova), f['size'])
for l in difflib.unified_diff(a, b[:len(a) + 8], 'ours', 'retail', n=2, lineterm=''): print(l)
