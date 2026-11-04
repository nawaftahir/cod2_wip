; FUN_1002bf50 @ 0x1002bf50 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN g_101d1bf8:DWORD
    sub_1002bed7 PROTO C
.CODE
FUN_1002bf50 PROC
    push esi
    push edi
    call sub_1002bed7
    mov edi, eax
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x10]
    mov esi, eax
    shr esi, 0x14
    test edi, edi
    push esi
    jne L0
    push 0x101975a0
    push edi
    call dword ptr [fp_101d49c8]
    add esp, 0xc
    pop edi
    mov eax, esi
    pop esi
    ret
    push edi
    push 0x10197550
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 0x10
    cmp edi, esi
    jae L1
    lea esi, [edi - 0x10]
    push esi
    push 0x1019750c
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 0xc
    pop edi
    mov eax, esi
    pop esi
    ret
FUN_1002bf50 ENDP
END