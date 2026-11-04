#!/bin/bash
# ratchet10.sh [accept]: gate of the 1.0 client (was lab/mym.sh + ~/lv.sh).
#   make -> tools/cmp.py -> build/exp.json, matched-fn unique bytes (tools/cov.py), fn-loss check vs data/good.json
#   make release -> same-offset section bytes (tools/shameter.py), the 99.96% meter.
# OK only if no matched fn outside data/ties.txt was lost. accept: new baseline + meter-1.0.json.
cd "$(dirname "$0")/.." || exit 1
A=${ANCHOR:-../binaries/windows/1.0/CoD2MP_s.exe}; S=${DXSDK:-../../sdk/sum2004}
if [ "$1" = accept ]; then
  cp build/exp.json data/good.json
  python3 tools/meter.py 1.0 build/exp.json build/sha.txt "$(cat build/cov.last)"
  exit 0
fi
mkdir -p build
make ANCHOR=$A DXSDK=$S > build/b.txt 2>&1 || { grep -m5 error build/b.txt; echo BUILD FAILED; exit 1; }
# /FORCE hides unresolved symbols as call 0x400000: never trust such a build
if grep -q "LNK2001\|LNK2019" build/link.log; then grep -m5 "LNK2001\|LNK2019" build/link.log; echo "BROKEN LINK (unresolved externals)"; exit 1; fi
python3 tools/cmp.py build/CoD2MP_s.exe build/CoD2MP_s.map $A build/exp.json >/dev/null || exit 1
b=$(python3 tools/cov.py data/good.json | grep -o 'unique bytes [0-9]*' | grep -o '[0-9]*')
e=$(python3 tools/cov.py build/exp.json | grep -o 'unique bytes [0-9]*' | grep -o '[0-9]*')
echo $e > build/cov.last
make release ANCHOR=$A DXSDK=$S > build/rel.txt 2>&1 || { tail -10 build/rel.txt; echo RELEASE FAILED; exit 1; }
python3 tools/shameter.py build/release/CoD2MP_s.exe $A > build/sha.txt
tail -6 build/sha.txt
echo "NET $((e-b)) (matched-fn unique bytes $e, accepted $b)"
python3 tools/ratchet.py data/good.json build/exp.json data/ties.txt > build/ratchet.out; r=$?
tail -25 build/ratchet.out; exit $r
