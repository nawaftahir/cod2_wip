#!/bin/sh
set -eu
mkdir -p scratch/codex30_constants/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Ob2 /Oy- /hotpatch /MT /Gy \
    /Foscratch/codex30_constants/obj/set_typed.obj scratch/codex30_constants/set_typed.cpp
