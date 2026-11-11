#!/bin/sh
# it.sh FN TAG: same-offset of the current build, then (after an incremental rebuild if TAG given) fdiff FN size/diff lines
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w11-zs
export ANCHOR=/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.3/CoD2MP_s.exe DXSDK=/home/nawaf/cod2/test/dev/sdk/sum2004
[ -n "$2" ] && { make release > build/it.log 2>&1 || grep -a -m5 error build/it.log; }
python3 tools/shameter.py build/release/CoD2MP_s.exe $ANCHOR | grep -i same | head -2
a=$(grep -F "?$1" build/release/CoD2MP_s.map | head -1 | awk '{print $3}')
python3 tools/fdiff.py build/release/CoD2MP_s.exe build/release/CoD2MP_s.map $ANCHOR "$1" 0x$a 2000 > build/it_$2.diff
head -1 build/it_$2.diff; echo "difflines=$(grep -c '^[-+]' build/it_$2.diff) ebp_frame=$(grep -c 'mov *ebp,esp' build/it_$2.diff) popecx=$(grep -c '^+.*pop *ecx' build/it_$2.diff)"
