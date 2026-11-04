; FUN_10014f30 @ 0x10014f30 — auto-synthesized
    sub_10014e6f PROTO C
    sub_10014e82 PROTO C
.CODE
FUN_10014f30 PROC
    push ebx
    push ebp
    push esi
    push edi
    mov edi, eax
    mov ebx, dword ptr [esp + 0x14]
    mov ebp, dword ptr [edi]
    xor esi, esi
    mov edi, edi
    inc esi
    cmp esi, ebx
    jge L0
    mov ecx, dword ptr [edi + esi*4]
    mov eax, ebp
    call sub_10014e6f
    test al, al
    jne L1
    dec ebx
    cmp ebx, esi
    jl L2
    mov eax, dword ptr [edi + ebx*4]
    mov ecx, ebp
    call sub_10014e82
    test al, al
    jne L0
    cmp esi, ebx
    jg L2
    mov ecx, dword ptr [edi + ebx*4]
    mov eax, dword ptr [edi + esi*4]
    mov dword ptr [edi + esi*4], ecx
    mov dword ptr [edi + ebx*4], eax
    jmp L1
    cmp esi, dword ptr [esp + 0x14]
    jne L3
    mov edx, dword ptr [edi + ebx*4]
    mov eax, dword ptr [edi]
    mov dword ptr [edi], edx
    mov dword ptr [edi + ebx*4], eax
    dec esi
    mov eax, dword ptr [esp + 0x18]
    cmp esi, eax
    je L4
    jge L5
    mov edx, dword ptr [esp + 0x14]
    sub edx, esi
    sub eax, esi
    lea edi, [edi + esi*4]
    mov dword ptr [esp + 0x14], edx
    mov dword ptr [esp + 0x18], eax
    jmp L6
    mov dword ptr [esp + 0x14], esi
    jmp L6
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10014f30 ENDP
END