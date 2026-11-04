#!/bin/sh
set -eu
mkdir -p scratch/codex35_program_coalesce/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Foscratch/codex35_program_coalesce/obj/coalesce.obj scratch/codex35_program_coalesce/coalesce.cpp
