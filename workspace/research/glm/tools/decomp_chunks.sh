#!/bin/bash
# Chunked decompile via @file address lists (avoids arg-length limits and OOM).
set -e
G=/home/nawaf/cod2/test/dev/glm
H=/home/nawaf/cod2/test/dev/reverse/ghidra/ghidra_12.1.3_PUBLIC/support/analyzeHeadless
mkdir -p "$G/data/decomp" /tmp/gfxchunks
python3 - << 'PYEOF'
import json
inv = json.load(open('/home/nawaf/cod2/test/dev/glm/data/functions_gfx10.json'))["functions"]
addrs = [f["addr"] for f in inv]
CH = 400
n = 0
for i in range(0, len(addrs), CH):
    n += 1
    open(f'/tmp/gfxchunks/c{n}.txt', 'w').write('\n'.join('0x'+a for a in addrs[i:i+CH]))
print(n)
PYEOF
for c in /tmp/gfxchunks/c*.txt; do
  echo "== $c ($(wc -l < $c) fns)"
  "$H" "$G/ghidra/proj" gfx10 -process gfx_d3d_mp_x86_s.dll -noanalysis \
      -scriptPath "$G/scripts" -postScript DecompileGfx.java "@$c" "$G/data/decomp" 2>&1 | grep -E "ERROR REPORT|Exception" || true
done
ls "$G/data/decomp" | wc -l
