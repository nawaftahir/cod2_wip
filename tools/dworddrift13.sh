#!/bin/bash
# dworddrift13.sh 0xLO 0xHI: for every dword address in the range, the retail address(es) our code references map to. EXE=build/release/CoD2MP_s by default.
cd "$(dirname "$0")/.."
L=$(python3 -c "print(' '.join('%x'%a for a in range($1,$2,4)))")
python3 tools/dref13.py ${EXE:-build/release/CoD2MP_s}.exe ../../binaries/windows/1.3/CoD2MP_s.exe $L | grep -v -- '-> *$'
