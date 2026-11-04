; FUN_10017c50 @ 0x10017c50 — auto-synthesized
    sub_100180ab PROTO C
.CODE
FUN_10017c50 PROC
    push esi
    mov esi, eax
    sub esi, edi
    mov eax, esi
    sar eax, 2
    cmp eax, 1
    jle L0
    mov eax, dword ptr [edi + esi - 4]
    mov ecx, dword ptr [edi]
    push ebx
    push eax
    lea edx, [esi - 4]
    sar edx, 2
    mov dword ptr [edi + esi - 4], ecx
    push edx
    xor eax, eax
    mov ecx, edi
    call sub_100180ab
    sub esi, 4
    mov eax, esi
    sar eax, 2
    add esp, 0xc
    cmp eax, 1
    jg L1
    pop esi
    ret
FUN_10017c50 ENDP
END