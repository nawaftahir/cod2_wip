#!/bin/sh
# l.sh V [order]: two TUs, /GL + link /LTCG, disasm probe
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-b/lab/cp
docker run --rm -e V=$1 -e O="${2:-a.obj b.obj d.obj}" -v $(pwd):/p -w /p cod2-msvc71-vs2003 sh -c '
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /GL /DA=1 /DV=$V a.cpp b.cpp d.cpp >l.log 2>&1
wine /opt/msvc710/Vc7/bin/link.exe -nologo -LTCG -FORCE -DLL -NOENTRY -NODEFAULTLIB libcmt.lib kernel32.lib user32.lib -EXPORT:?drive@@YAXH@Z -MAP:l.map -OUT:l.dll $O >>l.log 2>&1; chmod 666 *'
grep -i "error" l.log
a=$(grep "?probe" l.map | awk '{print $3}')
objdump -d -M intel --no-show-raw-insn --start-address=0x$a l.dll | sed -n 8,20p | cut -f2-
