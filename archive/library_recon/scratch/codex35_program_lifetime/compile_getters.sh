#!/bin/sh
set -eu
mkdir -p scratch/codex35_program_lifetime/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
for inline in 1 2
do
    wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Ob$inline /Oy- /hotpatch /MT /Gy /d2QIftol /DFLOW_POINTER_SCOPE=3 /DFLOW_INPUT_INDEXED=1 /DFLOW_OPCODE_FORM=2 /DFLOW_VARYING_FORM=9 /DFLOW_STRIP_INDEXED=1 /DFLOW_VARYING_INDEXED=1 /DFLOW_TOKEN_BITS=1 /DFLOW_STRIP_GUARD=2 /DFLOW_REFERENCE_EARLY=1 /DFLOW_ORIGIN_INLINE=1 /DFLOW_BASE_GETTERS=1 /Foscratch/codex35_program_lifetime/obj/getters_$inline.obj scratch/codex35_program_lifetime/flow.cpp
done
