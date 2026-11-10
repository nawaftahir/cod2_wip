#!/bin/sh
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w9-ch/lab/cp9
N=200 sh p.sh "$FL" | grep -v LNK > hp.txt
sh /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w9-ch/lab/rt.sh 0x4c85c0 0x4c8760 > rt.txt
head -12 hp.txt; wc -l hp.txt rt.txt
norm() { sed 's/0x[0-9a-f]\{6,8\}/A/g; s/DWORD PTR //g; s/ds://g; s/  */ /g' | awk '/^ret/{print;exit}{print}'; }
norm < hp.txt > a.n; norm < rt.txt > b.n; diff a.n b.n | sed -n 1,200p
