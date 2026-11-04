#!/bin/sh
set -eu
mkdir -p scratch/codex31_program/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Foscratch/codex31_program/obj/program.obj scratch/codex31_program/program.cpp
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DPROGRAM_MATCHED_ONLY /Foscratch/codex31_program/obj/program_matched.obj scratch/codex31_program/program.cpp
