; FUN_10032f90 @ 0x10032f90 — auto-synthesized
    EXTRN fp_1010c028:DWORD
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d492d:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076a830:DWORD
    sub_10032cd5 PROTO C
    sub_10032cdf PROTO C
    sub_10032d1a PROTO C
    sub_100f6c95 PROTO C
    sub_100f6d51 PROTO C
.CODE
FUN_10032f90 PROC
    call sub_10032cd5
    call sub_10032d1a
    call sub_10032cdf
    mov eax, dword ptr [esp + 4]
    push eax
    call dword ptr [fp_1010c028]
    mov byte ptr [g_101d492d], 1
    mov ecx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L0
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L0
    push 0x10197ed8
    push 0x10193358
    push eax
    call sub_100f6d51
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100f6c95
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xa4]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L1
    ret
FUN_10032f90 ENDP
END