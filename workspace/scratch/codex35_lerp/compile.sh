#!/bin/sh
set -eu
mkdir -p scratch/codex35_lerp/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
for middle in 0 1; do
    for cursor in 0 1; do
        wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DMIDDLE_CLEANUP=$middle /DCURSOR_FIRST=$cursor /Foscratch/codex35_lerp/obj/lerp_${middle}_${cursor}.obj scratch/codex35_lerp/lerp.cpp
    done
done
for cursor in 0 1; do
    wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DMIDDLE_CLEANUP=1 /DCURSOR_FIRST=$cursor /DSHARED_EMIT=1 /Foscratch/codex35_lerp/obj/shared_$cursor.obj scratch/codex35_lerp/lerp.cpp
done
