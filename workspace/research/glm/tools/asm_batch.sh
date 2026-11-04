#!/bin/bash
# Assemble all .asm files in /work/src/asm_gen -> /work/build/asm_objs/
mkdir -p /work/build/asm_objs
cd /work/src/asm_gen
ls *.asm | xargs -P 8 -I{} sh -c '
    base="{}"
    objname="${base%.asm}.obj"
    sed "s/0x\([0-9a-fA-F]*\)/0\1h/g; s/\b0\([0-9a-fA-F]\{1,\}h\)/0\1/g" "{}" > /tmp/fixed.asm
    wine /opt/msvc710/Vc7/bin/ml.exe /c /coff /nologo "-D?QUIET" -DQUIET /Cp /tmp/fixed.asm >/dev/null 2>&1
    if [ -f /tmp/fixed.obj ]; then
        cp /tmp/fixed.obj "/work/build/asm_objs/$objname"
        rm -f /tmp/fixed.asm /tmp/fixed.obj
    fi
'
ls /work/build/asm_objs/*.obj 2>/dev/null | wc -l
