#!/bin/sh
# mk.sh FN: incremental release build, then fdiff FN
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-b
export ANCHOR=/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.3/CoD2MP_s.exe DXSDK=/home/nawaf/cod2/test/dev/sdk/sum2004
make release > build/mk.log 2>&1 || { grep -a -m5 "error" build/mk.log; }
sh lab/b.sh "$1" 2 > build/mk.diff
head -1 build/mk.diff; grep -c '^[-+]' build/mk.diff
