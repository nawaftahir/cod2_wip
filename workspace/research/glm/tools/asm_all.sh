#!/bin/bash
mkdir -p /work/build/objs_masm
cd /work/src/masm
ls *.asm | xargs -P 8 -I{} sh -c '
    obj="/work/build/objs_masm/{}.obj"
    wine /opt/msvc710/Vc7/bin/ml.exe /c /coff /nologo "-D?QUIET" -DQUIET /Cp "{}" >/dev/null 2>&1
    if [ -f "{}.obj" ]; then mv "{}.obj" "$obj"; fi
'
ls /work/build/objs_masm/*.obj 2>/dev/null | wc -l
