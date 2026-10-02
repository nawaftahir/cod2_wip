#!/bin/sh
set -eu
mkdir -p scratch/codex35_program_lifetime/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
for scope in 0 1 2 3
do
    wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DFLOW_POINTER_SCOPE=$scope /Foscratch/codex35_program_lifetime/obj/flow_$scope.obj scratch/codex35_program_lifetime/flow.cpp
done
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DFLOW_POINTER_SCOPE=3 /DFLOW_TOKEN_LOCAL=1 /Foscratch/codex35_program_lifetime/obj/flow_token.obj scratch/codex35_program_lifetime/flow.cpp
