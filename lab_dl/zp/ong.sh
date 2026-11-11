#!/bin/sh
# o.sh TAG "OPT" [V]: build probe with OPT instead of /O2 (p.cpp only), disasm to o_TAG.txt
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w11-zs/lab_dl/zp
docker run --rm -e V=${3:-0} -e OPT="$2" -v $(pwd):/p -w /p cod2-msvc71-vs2003 sh -c '
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c $OPT /DV=$V p.cpp >l.log 2>&1
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 x.cpp >>l.log 2>&1
wine /opt/msvc710/Vc7/bin/link.exe -nologo -LTCG -FORCE -DLL -NOENTRY -NODEFAULTLIB libcmt.lib oldnames.lib kernel32.lib -EXPORT:?drive@@YAXH@Z -MAP:l.map -OUT:l.dll p.obj x.obj >>l.log 2>&1; chmod 666 *'
grep -i " error" l.log | grep -v _main
a=$(grep "?probe@" l.map | awk '{print $3}')
objdump -d -M intel --no-show-raw-insn --start-address=0x$a l.dll | sed -n '8,$p' | cut -f2- | awk '{print} /^ret/{n++} n==3{exit}' > o_$1.txt
f=o_$1.txt
echo "$1 n=$(wc -l < $f) late-xor=$(tail -n +10 $f | grep -cE '^xor +(e..),\1$') imm0=$(grep -cE 'DWORD PTR .*\],0x0$' $f) pushimm=$(grep -cE '^push +0x' $f) pop=$(grep -c '^pop' $f) ret=$(grep -c '^ret' $f) rep=$(grep -c 'rep\|repnz\|scas' $f) calls=$(grep -c '^call' $f)"
