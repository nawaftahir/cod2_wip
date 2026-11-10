#!/bin/sh
# r.sh: probe b.cpp linked against the REAL com_math.obj (LTCG, /FORCE)
cd /home/nawaf/cod2/test/dev/cod2_wip/.worktrees/w7-b/lab/cp
cp ../../build/obj/universal/com_math.obj rcm.obj
docker run --rm -v $(pwd):/p -w /p cod2-msvc71-vs2003 sh -c '
wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /GL /DA=1 /DV=0 b.cpp c.cpp >r.log 2>&1
wine /opt/msvc710/Vc7/bin/link.exe -nologo -LTCG -FORCE -DLL -NOENTRY -NODEFAULTLIB libcmt.lib kernel32.lib user32.lib -EXPORT:?probe@@YAXPAM0@Z -MAP:r.map -OUT:r.dll b.obj c.obj rcm.obj >>r.log 2>&1; chmod 666 *'
grep -ci "error" r.log
a=$(grep "?probe" r.map | awk '{print $3}')
objdump -d -M intel --no-show-raw-insn --start-address=0x$a r.dll | sed -n 8,16p | cut -f2-
