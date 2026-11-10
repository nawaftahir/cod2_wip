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
    return [f'{i[0]:x} {i[2]} {i[3]}' for i in capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32).disasm_lite(d, a)]
c = 0
for x, y in zip(ins('build/release/CoD2MP_s.exe'), ins('build/ra/dx.exe')):
    if x != y:
        print('  ', x, '->', y.split(' ', 1)[1]); c += 1
        if c == 3: break
PY
done
