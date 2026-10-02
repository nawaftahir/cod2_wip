#!/bin/sh
set -eu
here=scratch/codex31_crt
mkdir -p "$here/obj/st" "$here/obj/mt"
response="$here/sources.rsp"
: > "$response"
for source in /crt/crt71/*.c
do
    base=${source##*/}
    cmp "$source" "/opt/msvc710/Vc7/crt/src/$base"
    printf '"../crt/crt71/%s"\n' "$base" >> "$response"
done
for mode in st mt
do
    flags=''
    if test "$mode" = mt
    then
        flags='-D_MT'
    fi
    if cl -c -nologo -Zelp8 -W3 -GFy -DWIN32 -GB -Gi- -GS \
        -Zc:wchar_t -Zc:forScope -DWIN32_LEAN_AND_MEAN -DNOSERVICE \
        -D_MBCS -D_MB_MAP_DIRECT -D_CRTBLD -DWINHEAP -O2 $flags \
        -I../crt/crt71 "@$response" "/Fo$here/obj/$mode/" > "$here/compile_$mode.log" 2>&1
    then
        printf '%s batch PASS\n' "$mode"
    else
        printf '%s batch has compile failures; inspect compile_%s.log\n' "$mode" "$mode"
    fi
done
