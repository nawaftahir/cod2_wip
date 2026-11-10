#!/bin/sh
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w9-ch/lab/cp9
for c in 1 2; do echo "== CG$c"; sh p.sh "/DP=1 /DCG=$c" | grep -v LNK | head -5; done
