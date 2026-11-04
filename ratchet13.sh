#!/bin/bash
# ratchet13.sh [accept]: release build of the 1.3 client, print same-offset section bytes vs the best so far.
# accept: record the last measured number as the new best (do this right before committing).
cd /home/nawaf/cod2/test/dev/lab13/wC/target || exit 1
B=../ratchet13.best; L=../ratchet13.log; N=../ratchet13.last
if [ "$1" = accept ]; then cp $N $B; echo "best = $(cat $B)"; exit 0; fi
make release ANCHOR=/home/nawaf/cod2/test/dev/cod2engineold/binaries/windows/1.3/CoD2MP_s.exe DXSDK=/home/nawaf/cod2/test/dev/sdk/sum2004 > build/ratchet13.log 2>&1 || { tail -20 build/ratchet13.log; echo BUILD FAILED; exit 1; }
n=$(python3 ../shameter.py build/release/CoD2MP_s.exe /home/nawaf/cod2/test/dev/cod2engineold/binaries/windows/1.3/CoD2MP_s.exe | tail -1 | awk '{print $4}' | cut -d/ -f1)
echo $n > $N; best=$(cat $B 2>/dev/null || echo 0)
echo "$(date +%F_%T) $n $(git rev-parse --short HEAD) $*" >> $L
if [ "$n" -gt "$best" ]; then echo "RATCHET OK $n (best $best, +$((n - best)))"; else echo "RATCHET REJECT $n (best $best, $((n - best)))"; fi
