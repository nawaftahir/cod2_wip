#!/bin/bash
# fd.sh <mangled-substr> <retail-va> <size> [build]: diff ours vs retail, addresses masked (run from target/)
B=${4:-build/v}; O=$B/fd
mkdir -p $O
V=$(grep -m1 "$1" $B/gfx.map | awk '{print $3}')
objdump -d --no-show-raw-insn --start-address=0x$V --stop-address=$(printf 0x%x $((0x$V+$3+8))) $B/gfx.dll | tail -n +8 | cut -f2- | sed -E 's/0x[0-9a-f]{8}/X/g' > $O/o.s
objdump -d --no-show-raw-insn --start-address=$2 --stop-address=$(printf 0x%x $(($2+$3))) ../../cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll | tail -n +8 | cut -f2- | sed -E 's/0x[0-9a-f]{8}/X/g' > $O/r.s
diff $O/o.s $O/r.s
