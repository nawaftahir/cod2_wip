#!/bin/bash
# c2picks13.sh MANGLED [N]: log c2's local-allocator picks (round robin, KNOWLEDGE 20) while compiling MANGLED, one per line:
# "<reg picked> <temp id>". It stops at the next function's compile start. Picks for code that a later pass deletes
# (cross-jumped duplicates) appear here but not in the exe, which is how a rotation residue is explained.
cd "$(dirname "$0")/.."
{ echo cont; echo "break *0x1077687e"; echo "break *0x107724f6"
  for i in $(seq ${2:-80}); do echo cont; echo 'info reg'; done; echo quit; } > build/ra/pk.cmd
bash tools/c2dbg13.sh "$1" build/ra/pk.cmd > /dev/null
awk '/Stopped on breakpoint 2/{exit}
     /EAX:/{for(i=1;i<=NF;i++) if($i ~ /^EAX:/) e=strtonum("0x" substr($i,5)); if(/EBX:/) for(i=1;i<=NF;i++) if($i ~ /^EBX:/) b=substr($i,5)}
     /ESI:/{k=(e-0x108a9738)/4; split("edx eax ecx", R, " "); print R[(k%3)+1], b}' build/ra/dbg.out
