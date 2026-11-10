#!/bin/sh
# t.sh < flag lines: per build print fptan/call counts, forward fst, yaw copy, diff lines vs retail
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w9-ch/lab/cp9
norm() { sed 's/0x[0-9a-f]\{6,8\}/A/g; s/DWORD PTR //g; s/ds://g; s/  */ /g' | awk '/^ret/{print;exit}{print}'; }
sh ../rt.sh 0x4c85c0 0x4c8760 | norm > b.n
while read fl; do
 N=220 sh p.sh "$fl" | grep -v LNK | norm > a.n
 cp a.n "out_$(echo $fl | tr -c 'A-Za-z0-9=\n' _).n"
 echo "$fl | n=$(wc -l < a.n) fptan=$(grep -c fptan a.n) call=$(grep -c '^call' a.n) fst18=$(grep -c 'fst \[esp+0x18\]' a.n) yawcopy=$(grep -c 'mov \[esp+0x28\],ecx' a.n) diff=$(diff a.n b.n | grep -c '^[<>]')"
done
