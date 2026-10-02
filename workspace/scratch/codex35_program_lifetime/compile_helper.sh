#!/bin/sh
set -eu
mkdir -p scratch/codex35_program_lifetime/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
for form in 8 9
do
    wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DFLOW_POINTER_SCOPE=3 /DFLOW_INPUT_INDEXED=1 /DFLOW_OPCODE_FORM=2 /DFLOW_VARYING_FORM=$form /Foscratch/codex35_program_lifetime/obj/helper_$form.obj scratch/codex35_program_lifetime/flow.cpp
done
