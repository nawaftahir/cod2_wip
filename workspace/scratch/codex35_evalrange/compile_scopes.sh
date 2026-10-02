#!/bin/sh
set -eu
mkdir -p scratch/codex35_evalrange/obj
export INCLUDE='Z:\opt\msvc710\Vc7\include;Z:\opt\msvc710\Vc7\PlatformSDK\include;Z:\dxsdk\Include'
wine scratch/codex19_dxerr/compiler/cl.exe /nologo /c /O1 /Oy- /hotpatch /MT /Gy /d2QIftol /Foscratch/codex35_evalrange/obj/ scratch/codex35_evalrange/binary_scope.cpp scratch/codex35_evalrange/literal_order.cpp scratch/codex35_evalrange/scope_literal.cpp scratch/codex35_evalrange/branch_scopes.cpp
