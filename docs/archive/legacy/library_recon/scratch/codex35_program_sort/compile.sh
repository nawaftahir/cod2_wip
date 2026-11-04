#!/bin/sh
set -eu
mkdir -p scratch/codex35_program_sort/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
for scope in 0 1
do
    wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /DSORT_SHARED_LOCALS=$scope /Foscratch/codex35_program_sort/obj/scope_$scope.obj scratch/codex35_program_sort/sort.cpp
done
