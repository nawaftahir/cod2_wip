; FUN_10033010 @ 0x10033010 — auto-synthesized
    EXTRN fp_1010c028:DWORD
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d492d:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076a830:DWORD
    sub_10032d2c PROTO C
    sub_10032d36 PROTO C
    sub_10032d71 PROTO C
    sub_100f6c73 PROTO C
    sub_100f6d2f PROTO C
.CODE
FUN_10033010 PROC
    mov eax, dword ptr [g_101ce7ec]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L0
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L0
    push 0x10197ec0
    push 0x10193358
    push eax
    call sub_100f6d2f
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100f6c73
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 0xa8]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L1
    mov byte ptr [g_101d492d], 0
    call sub_10032d2c
    call sub_10032d71
    call sub_10032d36
    mov eax, dword ptr [esp + 4]
    push eax
    call dword ptr [fp_1010c028]
    ret
FUN_10033010 ENDP
END