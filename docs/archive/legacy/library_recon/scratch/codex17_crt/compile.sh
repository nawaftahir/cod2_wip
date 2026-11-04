#!/bin/sh
set -eu
sources='_newmode newmode winxfltr umask atox crt0dat crtexe nlsdata1 nlsdata2 nlsdata3
fflush _sftbuf initmon initnum setlocal strftime strdate strtime time clock fgetc fputc
fgetws fputws fgets fputs fseek fseeki64 ftell ftelli64 fileno fgetpos fsetpos rewind
setbuf setvbuf perror strerror _strerr strtod wcstod wcstol wcstoq strtol strtoq scanf
fscanf sscanf snscanf swscanf wscanf fwscanf sprintf printf fprintf vprintf vfprintf
vfwprint vwprintf vsprintf vsnprint vsnwprnt vswprint swprintf snprintf _wopen creat
woutput winput a_map a_str w_map w_str a_cmp w_cmp wctomb mbtowc wcstombs mbstowcs
_mbslen mbslen mbsnbcmp mbscmp memicmp strcoll strxfrm strtok strdup getcwd wgetcwd
chdir access chmod dup dup2 pipe locking spawnve execve getenv putenv setenv getpath
dosmap errmode heapchk heapwalk heapmin malloc realloc calloc free expand msize _file
seterrm charmax'
if test "${1:-}" = globals
then
    sources='txtmode binmode xtxtmode initcoll'
fi
args=''
for base in $sources
do
    cmp "/crt/crt71/$base.c" "/opt/msvc710/Vc7/crt/src/$base.c"
    args="$args ../crt/crt71/$base.c"
done
for mode in st mt
do
    mkdir -p "scratch/codex17_crt/obj/$mode"
    flags=''
    if test "$mode" = mt
    then
        flags='-D_MT'
    fi
    cl -c -nologo -Zelp8 -W3 -GFy -DWIN32 -GB -Gi- -GS \
        -Zc:wchar_t -Zc:forScope -DWIN32_LEAN_AND_MEAN -DNOSERVICE \
        -D_MBCS -D_MB_MAP_DIRECT -D_CRTBLD -DWINHEAP -O1 $flags \
        -I../crt/crt71 $args "/Foscratch/codex17_crt/obj/$mode/"
done
