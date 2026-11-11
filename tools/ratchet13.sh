#!/bin/bash
# ratchet13.sh [accept|tag]: release build of the 1.3 client, print BOTH meters:
#   same-offset section bytes (shameter) and matched-fn bytes (tools/cmp13, address independent).
# Decision: OK only if matched-fn bytes >= best minus listed ties lost AND no matched fn was lost vs data/good13.json (tools/ratchet_fn.py).
# accept: record the last measurement as the new best and write meter-1.3.json (right before committing).
cd "$(dirname "$0")/.." || exit 1
A=${ANCHOR:-../binaries/windows/1.3/CoD2MP_s.exe}
B=data/ratchet13.best; L=build/ratchet13.hist; N=build/ratchet13.last; FB=data/ratchet13.fbest; FN=build/ratchet13.flast
if [ "$1" = accept ]; then
  cp $N $B; cp $FN $FB; cp build/cmp13.json data/good13.json
  python3 tools/meter.py 1.3 build/cmp13.json build/sha.txt "$(cat $FN)"
  echo "best = $(cat $B) same-offset, $(cat $FB) matched-fn B"; exit 0
fi
mkdir -p build
make release ANCHOR=$A DXSDK=${DXSDK:-../../sdk/sum2004} > build/ratchet13.log 2>&1 || { tail -20 build/ratchet13.log; echo BUILD FAILED; exit 1; }
python3 tools/shameter.py build/release/CoD2MP_s.exe $A > build/sha.txt
python3 tools/test_inplace.py 1.3 || { echo "INPLACE SELF-CHECK FAILED"; exit 1; }
python3 tools/test_shameter.py $A || { echo "SHAMETER SELF-CHECK FAILED"; exit 1; }
n=$(tail -1 build/sha.txt | awk '{print $4}' | cut -d/ -f1)
tools/cmp13 | tee build/cmp13.sum
python3 tools/test_cmp.py tools/cmp13.py build/release/CoD2MP_s.exe build/release/CoD2MP_s.map || { echo "REFEREE SELF-CHECK FAILED"; exit 1; }
f=$(sed -n 's/.*matched-fn bytes \([0-9]*\).*/\1/p' build/cmp13.sum)
echo $n > $N; echo $f > $FN
best=$(cat $B 2>/dev/null || echo 0); fbest=$(cat $FB 2>/dev/null || echo 0)
echo "$(date +%F_%T) $n $f $(git rev-parse --short HEAD) $*" >> $L
echo "same-offset $n (best $best, $((n - best))) | matched-fn bytes $f (best $fbest, $((f - fbest)))"
lost=0; tielost=0
if [ -f data/good13.json ]; then
  python3 tools/ratchet_fn.py data/good13.json build/cmp13.json data/ties13.txt > build/ratchet_fn.out; lost=$?
  tail -25 build/ratchet_fn.out
  tielost=$(sed -n 's/^TIELOST //p' build/ratchet_fn.out); tielost=${tielost:-0}
fi
# losing a listed tie never rejects (owner, 11-11): floor = best minus the tie bytes lost
if [ "$lost" = 0 ] && [ "$f" -ge "$((fbest - tielost))" ]; then echo "RATCHET OK matched-fn $f (best $fbest, +$((f - fbest)))"
else echo "RATCHET REJECT matched-fn $f (best $fbest, $((f - fbest))), fn-loss-check=$lost"; exit 1; fi
