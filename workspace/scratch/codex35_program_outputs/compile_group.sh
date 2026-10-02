#!/bin/sh
set -eu
mkdir -p scratch/codex35_program_outputs/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
for order in 0 2
do
    wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DOUTPUT_ARRAY_LOOP=0 /DOUTPUT_FLAG_ORDER=$order /Foscratch/codex35_program_outputs/obj/group_$order.obj scratch/codex35_program_outputs/outputs_group.cpp
done
