; FUN_1000dd70 @ 0x1000dd70 — auto-synthesized
    EXTRN g_101d5d28:DWORD
    sub_1002ca6f PROTO C
    sub_1002cd65 PROTO C
    sub_10061cbb PROTO C
.CODE
FUN_1000dd70 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, dword ptr [g_101d5d28]
    xor esi, esi
    test edi, edi
    jle L0
    mov edx, 0x101d5d2c
    mov ecx, ebp
    call sub_1002ca6f
    test eax, eax
    jne L1
    inc esi
    add edx, 0x44
    cmp esi, edi
    jl L2
    cmp esi, 0x10
    jne L0
    push esi
    push 0x101931d8
    call sub_10061cbb
    add esp, 8
    pop edi
    pop esi
    xor eax, eax
    pop ebp
    ret
    mov eax, esi
    imul eax, eax, 0x44
    pop edi
    pop esi
    add eax, 0x101d5d2c
    pop ebp
    ret
    mov eax, esi
    imul eax, eax, 0x44
    push ebx
    push esi
    lea ebx, [eax + 0x101d5d2c]
    push ebp
    call sub_1002cd65
    mov eax, dword ptr [g_101d5d28]
    add esp, 8
    inc eax
    mov dword ptr [g_101d5d28], eax
    mov eax, ebx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
FUN_1000dd70 ENDP
END