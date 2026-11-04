; FUN_1000a7f0 @ 0x1000a7f0 — auto-synthesized
    EXTRN g_101ce580:DWORD
    EXTRN g_101d1b9c:DWORD
.CODE
FUN_1000a7f0 PROC
    mov eax, dword ptr [g_101d1b9c]
    test eax, eax
    mov dword ptr [g_101ce580], 0
    je L0
    mov edx, dword ptr [eax + 0xfc]
    xor ecx, ecx
    test edx, edx
    jle L0
    xor edx, edx
    push edi
    mov eax, dword ptr [eax + 0x100]
    mov dword ptr [eax + edx + 0x38], 0
    mov eax, dword ptr [g_101d1b9c]
    mov edi, dword ptr [eax + 0xfc]
    inc ecx
    add edx, 0x3c
    cmp ecx, edi
    jl L1
    pop edi
    ret
FUN_1000a7f0 ENDP
END