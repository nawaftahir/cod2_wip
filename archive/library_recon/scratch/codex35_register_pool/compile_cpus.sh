#!/bin/sh
set -eu
mkdir -p scratch/codex35_register_pool/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
for cpu in G5 G6 G7
do
    wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /$cpu /Foscratch/codex35_register_pool/obj/register_pool_$cpu.obj scratch/codex35_register_pool/register_pool.cpp
done
