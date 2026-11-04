; FUN_10038c00 @ 0x10038c00 — auto-synthesized
    EXTRN g_1072d9bc:DWORD
    sub_10038963 PROTO C
    sub_10038976 PROTO C
.CODE
FUN_10038c00 PROC
    push ebp
    push esi
    push edi
    mov edi, dword ptr [g_1072d9bc]
    movzx ecx, word ptr [edi + 0x34]
    mov esi, eax
    xor eax, eax
    test ecx, ecx
    jle L0
    mov edi, dword ptr [edi + 0x3c]
    cmp ebx, dword ptr [edi]
    je L1
    inc eax
    add edi, 0xc
    cmp eax, ecx
    jl L2
    pop edi
    pop esi
    pop ebp
    ret
    cmp byte ptr [edi + 5], 5
    jne L3
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [eax + 0x1c]
    mov eax, dword ptr [ecx + 0x40]
    mov dword ptr [edx], eax
    mov al, byte ptr [edi + 4]
    mov byte ptr [esi], al
    call sub_10038963
    pop edi
    pop esi
    pop ebp
    ret
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [edx], ecx
    mov al, byte ptr [edi + 4]
    mov byte ptr [esi], al
    call sub_10038976
    pop edi
    pop esi
    pop ebp
    ret
FUN_10038c00 ENDP
END