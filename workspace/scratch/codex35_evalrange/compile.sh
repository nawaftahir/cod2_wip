#!/bin/sh
set -eu
mkdir -p scratch/codex35_evalrange/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Foscratch/codex35_evalrange/obj/ scratch/codex35_evalrange/baseline.cpp scratch/codex35_evalrange/scratch_array.cpp scratch/codex35_evalrange/dot_index.cpp scratch/codex35_evalrange/array_dot_index.cpp
