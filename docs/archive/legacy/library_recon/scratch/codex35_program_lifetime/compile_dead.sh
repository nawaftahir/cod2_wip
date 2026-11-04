#!/bin/sh
set -eu
mkdir -p scratch/codex35_program_lifetime/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
for guard in 0 1
do
    for buffer in 0 1
    do
        for flags in 0 1
        do
            wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DFLOW_POINTER_SCOPE=3 /DFLOW_INPUT_INDEXED=1 /DFLOW_OPCODE_FORM=2 /DFLOW_VARYING_FORM=9 /DFLOW_STRIP_INDEXED=1 /DFLOW_VARYING_INDEXED=1 /DFLOW_TOKEN_BITS=1 /DFLOW_STRIP_GUARD=2 /DFLOW_VARYING_RELOAD=1 /DFLOW_DEAD_GUARD=$guard /DFLOW_DEAD_BUFFER=$buffer /DFLOW_DEAD_FLAGS=$flags /Foscratch/codex35_program_lifetime/obj/dead_${guard}_${buffer}_${flags}.obj scratch/codex35_program_lifetime/flow.cpp
        done
    done
done
