#!/bin/sh
set -eu
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include'
for stem in name_w description_a description_w
do
    wine /w/scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT \
        "/Foscratch/codex25_dxerr/$stem.obj" "scratch/codex25_dxerr/$stem.cpp"
done
