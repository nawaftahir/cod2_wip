#!/bin/sh
# p.sh "CLFLAGS": build a.c+b.c with /GL + /LTCG, print first insns of probe
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w9-ch/lab/cp9
docker run --rm -e F="$1" -e FA="$FA" -v $(pwd):/p -w /p cod2-msvc71-vs2003 sh -c '
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /GL $F $FA a.c >l.log 2>&1; wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /GL $F b.c >>l.log 2>&1
wine /opt/msvc710/Vc7/bin/link.exe -nologo -LTCG -FORCE -DLL -NOENTRY -NODEFAULTLIB libcmt.lib kernel32.lib -EXPORT:drive -MAP:l.map -OUT:l.dll a.obj b.obj >>l.log 2>&1; chmod 666 *'
grep -i " error" l.log
a=10001000
objdump -d -M intel --no-show-raw-insn --start-address=0x$a l.dll | sed -n 8,${N:-14}p | cut -f2-
