#!/bin/sh
set -eu
mkdir -p scratch/codex35_program_outputs/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
for opcode in 0 1
do
    for order in 4
    do
        wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DOUTPUT_ARRAY_LOOP=0 /DOUTPUT_OPCODE_FIELDS=$opcode /DOUTPUT_FLAG_ORDER=$order /Foscratch/codex35_program_outputs/obj/fields_${opcode}_${order}.obj scratch/codex35_program_outputs/outputs.cpp
    done
done
