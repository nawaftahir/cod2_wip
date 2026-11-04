#!/bin/bash
# ratchet13.sh [accept|tag]: release build of the 1.3 client, print BOTH meters:
#   same-offset section bytes (shameter) and matched-fn bytes (tools/cmp13, address independent).
# Decision: OK only if matched-fn bytes >= best AND no matched fn was lost vs good13.json (tools/ratchet_fn.py).
# accept: record the last measurement as the new best (right before committing).
cd /home/nawaf/cod2/test/dev/claude_client13/target || exit 1
B=../ratchet13.best; L=../ratchet13.log; N=../ratchet13.last; FB=../ratchet13.fbest; FN=../ratchet13.flast
if [ "$1" = accept ]; then cp $N $B; cp $FN $FB; cp build/cmp13.json ../good13.json; echo "best = $(cat $B) same-offset, $(cat $FB) matched-fn B"; exit 0; fi
make release DXSDK=/home/nawaf/cod2/test/dev/sdk/sum2004 > build/ratchet13.log 2>&1 || { tail -20 build/ratchet13.log; echo BUILD FAILED; exit 1; }
n=$(python3 ../shameter.py build/release/CoD2MP_s.exe ../../cod2engineold/binaries/windows/1.3/CoD2MP_s.exe | tail -1 | awk '{print $4}' | cut -d/ -f1)
../tools/cmp13 | tee build/cmp13.sum
f=$(sed -n 's/.*matched-fn bytes \([0-9]*\).*/\1/p' build/cmp13.sum)
echo $n > $N; echo $f > $FN
best=$(cat $B 2>/dev/null || echo 0); fbest=$(cat $FB 2>/dev/null || echo 0)
echo "$(date +%F_%T) $n $f $(git rev-parse --short HEAD) $*" >> $L
echo "same-offset $n (best $best, $((n - best))) | matched-fn bytes $f (best $fbest, $((f - fbest)))"
lost=0
if [ -f ../good13.json ]; then
  python3 ../tools/ratchet_fn.py ../good13.json build/cmp13.json ../ties13.txt > build/ratchet_fn.out; lost=$?
  tail -25 build/ratchet_fn.out
fi
if [ "$lost" = 0 ] && [ "$f" -ge "$fbest" ]; then echo "RATCHET OK matched-fn $f (best $fbest, +$((f - fbest)))"
else echo "RATCHET REJECT matched-fn $f (best $fbest, $((f - fbest))), fn-loss-check=$lost"; exit 1; fi
