#!/bin/sh
# cmp.sh V P: probe built with "p" in a.cpp on (P=1) or off (P=0), mnemonic diff vs retail crosshair
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-b/lab/cp
if [ "$2" = 1 ]; then grep -q '^#pragma optimize' a.cpp || sed -i '1a #pragma optimize("p", on)' a.cpp
else sed -i '/^#pragma optimize/d' a.cpp; fi
sh l.sh $1 >/dev/null 2>&1
a=$(grep "?probe" l.map | awk '{print $3}')
norm() { cut -f2- | sed 's/0x1[0-9a-f]\{7\}/A/g; s/ds:A/[A]/; s/DWORD PTR //g; s/  */ /g' | awk '/^ret/{print;exit}{print}'; }
objdump -d -M intel --no-show-raw-insn --start-address=0x$a l.dll | sed -n '8,$p' | norm > pr.txt
objdump -d -M intel --no-show-raw-insn --start-address=0x4c85c0 --stop-address=0x4c8780 /home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.3/CoD2MP_s.exe | sed -n '8,$p' | sed 's/0x[0-9a-f]\{6,8\}/A/g' | norm > rt.txt
echo "probe $(wc -l < pr.txt) retail $(wc -l < rt.txt)"; diff pr.txt rt.txt | grep -c '^[<>]'
