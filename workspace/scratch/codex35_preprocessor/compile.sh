#!/bin/sh
set -eu
mkdir -p scratch/codex35_preprocessor/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /Foscratch/codex35_preprocessor/obj/ scratch/codex35_preprocessor/preprocessor.cpp
