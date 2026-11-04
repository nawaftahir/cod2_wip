; FUN_10023af0 @ 0x10023af0 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN g_101ce64c:DWORD
    EXTRN g_101da9c8:DWORD
    EXTRN g_1067850c:DWORD
    EXTRN g_1076a860:DWORD
.CODE
FUN_10023af0 PROC
    mov eax, dword ptr [g_101ce64c]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L0
    mov eax, dword ptr [g_1067850c]
    cmp eax, 0x7fe
    jae L1
    mov edx, dword ptr [g_101da9c8]
    mov ecx, dword ptr [edx + 0xa000c]
    cmp ecx, 0x1ff8
    jae L2
    inc ecx
    mov dword ptr [edx + 0xa000c], ecx
    inc dword ptr [g_1067850c]
    ret
    mov edx, dword ptr [edx]
    cmp dword ptr [g_1076a860], edx
    je L0
    push 0x1ff8
    push 0x10196d6c
    push 2
    mov dword ptr [g_1076a860], edx
    call dword ptr [fp_101d49c8]
    add esp, 0xc
    or eax, 0xffffffff
    ret
    mov ecx, dword ptr [g_101da9c8]
    mov eax, dword ptr [ecx]
    cmp dword ptr [g_1076a860], eax
    je L0
    push 0x7fe
    push 0x10196d44
    push 2
    mov dword ptr [g_1076a860], eax
    call dword ptr [fp_101d49c8]
    add esp, 0xc
    or eax, 0xffffffff
    ret
FUN_10023af0 ENDP
END