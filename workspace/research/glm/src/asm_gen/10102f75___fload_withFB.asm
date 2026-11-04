; __fload_withFB @ 0x10102f75 — auto-synthesized
.CODE
__fload_withFB PROC
    mov eax, dword ptr [edx + 4]
    and eax, 0x7ff00000
    cmp eax, 0x7ff00000
    je L0
    fld qword ptr [edx]
    ret
    mov eax, dword ptr [edx + 4]
    sub esp, 0xa
    or eax, 0x7fff0000
    mov dword ptr [esp + 6], eax
    mov eax, dword ptr [edx + 4]
    mov ecx, dword ptr [edx]
    shld eax, ecx, 0xb
    shl ecx, 0xb
    mov dword ptr [esp + 4], eax
    mov dword ptr [esp], ecx
    fld xword ptr [esp]
    add esp, 0xa
    test eax, 0
    mov eax, dword ptr [edx + 4]
    ret
__fload_withFB ENDP
END