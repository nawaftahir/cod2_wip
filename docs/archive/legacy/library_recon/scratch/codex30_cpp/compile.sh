#!/bin/sh
set -eu
here=scratch/codex30_cpp
mkdir -p "$here/obj/st" "$here/obj/mt"
find /opt/msvc710/Vc7/crt/src -name '*.cpp' | sort > "$here/sources.txt"
sed 's|^|"Z:|; s|/|\\|g; s|$|"|' "$here/sources.txt" > "$here/sources.rsp"
sha256sum /opt/msvc710/Vc7/crt/src/*.cpp /opt/msvc710/Vc7/crt/src/*.h > "$here/source_hashes.txt"
for mode in st mt
do
    flags=''
    if test "$mode" = mt
    then
        flags='-D_MT'
    fi
    if cl -c -nologo -Zelp8 -W3 -GFy -DWIN32 -GB -Gi- -GS \
        -Zc:wchar_t -Zc:forScope -DWIN32_LEAN_AND_MEAN -DNOSERVICE \
        -D_MBCS -D_MB_MAP_DIRECT -D_CRTBLD -DWINHEAP -O1 -GX $flags \
        -IZ:/opt/msvc710/Vc7/crt/src "@$here/sources.rsp" "/Fo$here/obj/$mode/" > "$here/compile_$mode.log" 2>&1
    then
        printf '%s batch PASS\n' "$mode"
    else
        printf '%s batch has compile failures; see compile_%s.log\n' "$mode" "$mode"
    fi
done
