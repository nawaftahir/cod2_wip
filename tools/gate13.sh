#!/bin/bash
# gate13.sh "message": clean ratchet of the working tree; on RATCHET OK commit it and accept, else leave the tree for revert.
cd "$(dirname "$0")/.."
export ANCHOR=../../binaries/windows/1.3/CoD2MP_s.exe DXSDK=../../../sdk/sum2004
rm -rf build/obj.old; mv build/obj build/obj.old
tools/ratchet13.sh "$1" 2>&1 | tail -8 | cut -c1-200 | tee build/gate.out
grep -q 'RATCHET REJECT' build/gate.out && exit 1
grep -q 'RATCHET OK' build/gate.out || exit 1
git add -u workspace src docs tools; git add tools/gate13.sh
git commit -qm "1.3: $1"
tools/ratchet13.sh accept 2>&1 | tail -1 | cut -c1-200
git add -u; git commit -qm "1.3 accept: $1 clean ratchet"; git log --oneline -1
