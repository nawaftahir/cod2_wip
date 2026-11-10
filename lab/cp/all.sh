#!/bin/sh
for v in ${VS:-0 1 2 3 4 5 6}; do echo "== V$v"; sh /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-b/lab/cp/l.sh $v 2>&1 | grep -v LNK | sed -n 2,4p; done
