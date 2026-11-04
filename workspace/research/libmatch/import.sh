#!/bin/sh
# Take one file from the finished server source and keep only what matches retail.
#   import.sh <dir/file.cpp>        copy the server file to src/ and build/<file>.full; fix compile errors there
#   import.sh <dir/file.cpp> keep   pair src/ with retail, blank the rest, write the file's ledger rows
set -e
F=$1
SRV=${SRV:-/home/nawaf/cod2/test/dev/cod2engine/archive/lnxded-1.3/src}
RUN="docker run --rm -v $PWD:/w -w /w -e RADIANT_IN_IMAGE=1 -e ALL=1 cod2-radiant-msvc71"
FULL="build/$(basename $F).full"
if [ "$2" != keep ]; then
	cp "$SRV/$F" "src/$F"
	cp "src/$F" "$FULL"
	exit 0
fi
ledger() {
	grep -v -P "\tsrc/$F\t" ledger/matches.tsv > build/ledger.tmp || true
	grep "^0x" "$1" >> build/ledger.tmp || true
	cp build/ledger.tmp ledger/matches.tsv
}
cp "$FULL" "src/$F"
grep -v -P "\tsrc/$F\t" ledger/matches.tsv > build/ledger.tmp || true; cp build/ledger.tmp ledger/matches.tsv
$RUN sh -c "python3 tools/link.py >/dev/null && python3 workspace/research/libmatch/pair.py src/$F" > build/pair1.txt 2>&1 || true
grep "^#" build/pair1.txt || tail -20 build/pair1.txt
grep "^0x" build/pair1.txt | cut -f4 > build/keep.txt
python3 workspace/research/libmatch/strip.py "src/$F" build/keep.txt 2>/dev/null
ledger build/pair1.txt
# asserts onto retail lines; build/<file>_names.tsv names functions not in the ledger yet
NAMES="build/$(basename $F .cpp)_names.tsv"
python3 workspace/research/libmatch/layout.py "src/$F" $( [ -f "$NAMES" ] && echo "$NAMES" )
$RUN sh -c "python3 tools/link.py >/dev/null && python3 workspace/research/libmatch/pair.py src/$F" > build/pair2.txt 2>&1 || true
grep "^#" build/pair2.txt || tail -20 build/pair2.txt
ledger build/pair2.txt
