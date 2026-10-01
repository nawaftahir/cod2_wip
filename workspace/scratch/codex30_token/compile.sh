#!/bin/sh
set -eu
mkdir -p scratch/codex30_token/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy \
    /Foscratch/codex30_token/obj/ "$@"
