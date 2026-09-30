#!/bin/sh
set -eu
mkdir -p scratch/codex35_sdk/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT \
    /Iscratch/codex35_sdk /Foscratch/codex35_sdk/obj/ \
    scratch/codex35_sdk/shader_constants.cpp scratch/codex35_sdk/instruction_predicates.cpp
