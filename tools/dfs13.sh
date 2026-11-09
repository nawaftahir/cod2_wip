#!/bin/bash
# dfs13.sh: relink build/obj with the DFS oracle c2 -> build/dfs/ord.txt (F compile order, D/T/E/C call-graph DFS).
# Read with client-1.0/tools/oracle/dfs.py. Needs a finished release build and build/ra/run.sh from ra13.sh.
W=$(cd "$(dirname "$0")/.." && pwd); T=$W/../../client-1.0/tools/oracle
cd "$W"; mkdir -p build/dfs
if [ ! -f build/dfs/c2y.dll ]; then
  docker run --rm -v $W/build/dfs:/o cod2-msvc71-vs2003 cp /opt/msvc710/Vc7/bin/c2.dll /o/c2.dll
  as --32 $T/cave.s -o build/dfs/cave.o && ld -m elf_i386 -Ttext=0x10865d50 build/dfs/cave.o -o build/dfs/cave.elf &&
    python3 $T/patch.py build/dfs/c2.dll build/dfs/cave.elf build/dfs/c2y.dll || exit 1
fi
sed -e 's#build/ra/c2rd.dll#build/dfs/c2y.dll#; s#build\\ra\\ox#build\\dfs\\ox#g; s#build/ra/link.log#build/dfs/link.log#g' \
    -e 's#^grep -a .*#grep -a "^[FXDCETBIV]" build/dfs/link.log > build/dfs/ord.txt#' build/ra/run.sh > build/dfs/run.sh
docker run --rm -v $W:/w -v $W/build/tree:/w/src -v $W/build/tree:/builds/pc_1.3_1_1/pc/cod2src -w /w cod2-msvc71-vs2003 sh /w/build/dfs/run.sh
wc -l build/dfs/ord.txt
