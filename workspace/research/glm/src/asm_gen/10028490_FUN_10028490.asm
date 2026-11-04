; FUN_10028490 @ 0x10028490 — auto-synthesized
    sub_100287e8 PROTO C
.CODE
FUN_10028490 PROC
    push esi
    push edi
    mov edi, eax
    mov esi, ecx
    sub esi, edi
    mov eax, esi
    sar eax, 3
    cmp eax, 1
    jle L0
    mov ecx, dword ptr [edi + esi - 4]
    mov eax, dword ptr [edi + esi - 8]
    mov edx, dword ptr [edi]
    push ebx
    push ecx
    push eax
    lea eax, [esi - 8]
    sar eax, 3
    mov dword ptr [edi + esi - 8], edx
    mov edx, dword ptr [edi + 4]
    push eax
    xor eax, eax
    mov dword ptr [edi + esi - 4], edx
    call sub_100287e8
    sub esi, 8
    mov eax, esi
    sar eax, 3
    add esp, 0x10
    cmp eax, 1
    jg L1
    pop edi
    pop esi
    ret
FUN_10028490 ENDP
END