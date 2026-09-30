#!/bin/sh
set -eu
mkdir -p scratch/codex19_crt/asm
cd scratch/codex19_crt/asm
cmp /w/scratch/codex_crt14asm/case/Intel/MEMCPY.ASM /opt/msvc710/Vc7/crt/src/intel/memcpy.asm
for name in memcpy memmove strchr strcmp
do
    cmp "/crt/crt71/$name.asm" "/opt/msvc710/Vc7/crt/src/intel/$name.asm"
    wine /opt/msvc710/Vc7/bin/ml.exe -c -coff -nologo -Cx -Zm \
        '-D?QUIET' -DQUIET -Di386 -D_WIN32 -DWIN32 \
        -IZ:/crt/crt71 -IZ:/opt/msvc710/Vc7/crt/src \
        -IZ:/w/scratch/codex_crt14asm/case \
        "Z:/crt/crt71/$name.asm"
done
