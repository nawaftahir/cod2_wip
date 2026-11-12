#!/bin/bash
# c2slots13.sh MANGLED [N]: dump c2's stack-slot packer (0x10790ad6, client-1.0 KNOWLEDGE 1.4) for MANGLED -> build/ra/slots.out.
# Phase 1 (bp 0x10790cba): each non-param item in list order: x /16x obj (+0x1c id, +0x20 size, +0x38 weight), obj[0] = symbol.
# Phase 2 (bp 0x10790e62): each entry as it gets its frame offset (EBX = offset, x /7x entry: +8 size, +0xc weight);
#   bp 0x10790eb5: one member symbol of that entry (EAX = symbol, ECX = offset). Names: lab/names-style lookup of sym+4.
cd "$(dirname "$0")/.."
N=${2:-60}
{ echo cont; echo "break *0x10790cba"; echo "break *0x10790d90"; echo cont
  for i in $(seq $N); do echo 'x /16x $eax'; echo cont; done; echo quit; } > build/ra/sl.cmd
bash tools/c2dbg13.sh "$1" build/ra/sl.cmd > /dev/null
cp build/ra/dbg.out build/ra/slots.out
{ echo cont; echo "break *0x10790e62"; echo "break *0x10790eb5"; echo "break *0x107724f6"; echo cont
  for i in $(seq $((N*3))); do echo 'info reg'; echo 'x /7x $esi+$ebp'; echo cont; done; echo quit; } > build/ra/sl2.cmd
bash tools/c2dbg13.sh "$1" build/ra/sl2.cmd > /dev/null
cp build/ra/dbg.out build/ra/slots2.out
