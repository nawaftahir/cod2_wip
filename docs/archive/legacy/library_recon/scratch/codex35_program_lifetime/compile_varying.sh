#!/bin/sh
set -eu
mkdir -p scratch/codex35_program_lifetime/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
for buffer in 0 1
do
    for reload in 0 1
    do
        wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DFLOW_POINTER_SCOPE=3 /DFLOW_INPUT_INDEXED=1 /DFLOW_OPCODE_FORM=2 /DFLOW_VARYING_FORM=9 /DFLOW_STRIP_INDEXED=1 /DFLOW_VARYING_INDEXED=1 /DFLOW_TOKEN_BITS=1 /DFLOW_STRIP_GUARD=2 /DFLOW_VARYING_BUFFER=$buffer /DFLOW_VARYING_RELOAD=$reload /Foscratch/codex35_program_lifetime/obj/varying_${buffer}_${reload}.obj scratch/codex35_program_lifetime/flow.cpp
    done
done
