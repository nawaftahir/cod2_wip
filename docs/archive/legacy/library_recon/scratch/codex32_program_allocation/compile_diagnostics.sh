#!/bin/sh
set -eu
mkdir -p scratch/codex32_program_allocation/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Foscratch/codex32_program_allocation/obj/diagnostics.obj scratch/codex32_program_allocation/diagnostics.cpp
