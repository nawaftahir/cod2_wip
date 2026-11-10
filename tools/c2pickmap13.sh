#!/bin/bash
# c2pickmap13.sh MANGLED ADDR SIZE K...: for each K, shift the round-robin start after the K-th local pick in MANGLED
# (winedbg: eax += 4 at the K-th 0x1077687e) and print the first instructions that change in the fn at ADDR (hex).
# The first changed instruction is the instruction of pick K+1, which maps picks (c2picks13.sh) to code.
cd "$(dirname "$0")/.."
MAP=build/ra/dx.map
for k in "${@:4}"; do
  { echo cont; echo "break *0x1077687e"; for i in $(seq $k); do echo cont; done
    echo 'set $eax = $eax + 4'; echo 'delete 1'; echo cont; echo quit; } > build/ra/pm.cmd
  bash tools/c2dbg13.sh "$1" build/ra/pm.cmd > /dev/null
  echo "== after pick $k"
  python3 - "$2" "$3" <<'PY'
import sys, pefile, capstone
a = int(sys.argv[1], 16); n = int(sys.argv[2])
def ins(p):
    pe = pefile.PE(p, fast_load=True); d = pe.get_memory_mapped_image()[a - 0x400000:a - 0x400000 + n]
    return [(i[0], i[1], i[2], i[3]) for i in capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32).disasm_lite(d, a)]
# reference = the unshifted ra13 link (same pipeline as dx.exe, so no .rdata/layout noise); report only
# same-length, same-mnemonic instructions whose operands differ (register picks)
c = 0
for x, y in zip(ins('build/ra/ox.exe'), ins('build/ra/dx.exe')):
    if x[1] == y[1] and x[2] == y[2] and x[3] != y[3] and not x[2].startswith(('j', 'call')):
        print('   %x %s %s -> %s' % (x[0], x[2], x[3], y[3])); c += 1
        if c == 40: break
PY
done
