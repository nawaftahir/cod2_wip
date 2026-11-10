#!/bin/bash
# symdrift13.sh LO HI: map symbols in [LO,HI] (8 hex digits) with the retail address their code references use. EXE=build/ra/ox by default.
cd "$(dirname "$0")/.."
EXE=${EXE:-build/ra/ox}
awk -v A=$1 -v B=$2 '$3>=A && $3<=B {print $3,$2,$NF}' $EXE.map > build/near.txt
python3 tools/dref13.py $EXE.exe ../../binaries/windows/1.3/CoD2MP_s.exe $(awk '{print $1}' build/near.txt) > build/near2.txt
paste -d' ' build/near.txt build/near2.txt | awk '{print $1,$2,$3,$6}'
