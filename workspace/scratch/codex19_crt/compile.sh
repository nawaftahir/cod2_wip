#!/bin/sh
set -eu
sources='asctime gmtime ctime mktime difftime ftime time64 ftime64 gmtime64 localtime64
asctime64 ctime64 mktime64 _getstrm _flswbuf getinfo a_env w_env envrnmnt getenv
wtombenv mbstowcs wcstombs inithelp initcrit initcon winsig signal abort crt0init
crtdll dllcrt0 crtexe crt0dat secchk secfail secinit fp10 gcvt fcvt ecvt atof wtof
strlwr strupr tolower toupper _tolower _toupper mbschr mbctoupper mbctolower
setmode setargv setenv _setargv stdargv stdenvp cenvarg cerrno cinitexe charmax
crtlib crtmbox getpid initum lconv nlsdata nlsdata1 nlsdata2 nlsdata3 _wctype
getqloc _sftbuf _getbuf _freebuf _flsbuf _filbuf filebuf stbuf fltused crt0fp'
args=''
for base in $sources
do
    if test -f "/crt/crt71/$base.c"
    then
        cmp "/crt/crt71/$base.c" "/opt/msvc710/Vc7/crt/src/$base.c"
        args="$args ../crt/crt71/$base.c"
    fi
done
for mode in st mt
do
    mkdir -p "scratch/codex19_crt/obj/$mode"
    flags=''
    if test "$mode" = mt
    then
        flags='-D_MT'
    fi
    cl -c -nologo -Zelp8 -W3 -GFy -DWIN32 -GB -Gi- -GS \
        -Zc:wchar_t -Zc:forScope -DWIN32_LEAN_AND_MEAN -DNOSERVICE \
        -D_MBCS -D_MB_MAP_DIRECT -D_CRTBLD -DWINHEAP -O1 $flags \
        -I../crt/crt71 $args "/Foscratch/codex19_crt/obj/$mode/"
done
