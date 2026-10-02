#!/bin/sh
set -eu
mkdir -p scratch/codex31_instructions/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Foscratch/codex31_instructions/obj/initialize.obj scratch/codex31_instructions/initialize.cpp
