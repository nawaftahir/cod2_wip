; FUN_1001e5b0 @ 0x1001e5b0 — auto-synthesized
    EXTRN fp_1010c024:DWORD
    EXTRN fp_1010c080:DWORD
    EXTRN fp_101d49c8:DWORD
    EXTRN g_101ce708:DWORD
    EXTRN g_101d49b0:DWORD
    EXTRN g_101da9c8:DWORD
    EXTRN g_1076a864:DWORD
.CODE
FUN_1001e5b0 PROC
    mov eax, dword ptr [g_101d49b0]
    test eax, eax
    jne L0
    or eax, 0xffffffff
    ret
    mov ecx, dword ptr [g_101ce708]
    mov edx, dword ptr [ecx + 8]
    xor eax, eax
    cmp edx, 2
    mov edx, dword ptr [g_101da9c8]
    setne al
    push esi
    dec eax
    and eax, 0xffffffe4
    add eax, 0x40
    imul eax, dword ptr [esp + 8]
    push eax
    mov eax, dword ptr [edx + 0x217c78]
    push eax
    call dword ptr [fp_1010c024]
    mov edx, dword ptr [g_101da9c8]
    mov ecx, dword ptr [edx + 0x217c78]
    mov esi, dword ptr [ecx]
    cmp esi, dword ptr [ecx + 4]
    jle L1
    cmp eax, dword ptr [ecx + 4]
    jg L2
    push eax
    push ecx
    call dword ptr [fp_1010c080]
    mov edx, dword ptr [g_101da9c8]
    mov edx, dword ptr [edx]
    cmp dword ptr [g_1076a864], edx
    je L3
    push 0x101969ac
    push 2
    mov dword ptr [g_1076a864], edx
    call dword ptr [fp_101d49c8]
    add esp, 8
    or eax, 0xffffffff
    pop esi
    ret
FUN_1001e5b0 ENDP
END