; FUN_10028580 @ 0x10028580 — auto-synthesized
    sub_10028763 PROTO C
    sub_1002877c PROTO C
    sub_10028796 PROTO C
    sub_100287aa PROTO C
    sub_100287c3 PROTO C
.CODE
FUN_10028580 PROC
    sub esp, 8
    push ebx
    mov ebx, dword ptr [esp + 0x14]
    push esi
    push edi
    mov edi, eax
    mov eax, ebx
    sub eax, edi
    sar eax, 3
    cmp eax, 0x28
    jle L0
    inc eax
    cdq
    and edx, 7
    add eax, edx
    sar eax, 3
    push ebp
    mov ebp, eax
    shl eax, 3
    lea esi, [eax + edi]
    mov dword ptr [esp + 0x10], eax
    mov eax, dword ptr [esp + 0x24]
    shl ebp, 4
    push eax
    lea ebx, [edi + ebp]
    mov dword ptr [esp + 0x18], esi
    call sub_10028763
    mov esi, dword ptr [esp + 0x20]
    mov eax, dword ptr [esp + 0x14]
    mov ecx, dword ptr [esp + 0x28]
    mov edi, esi
    push ecx
    lea ebx, [eax + esi]
    sub edi, eax
    call sub_1002877c
    mov ebx, dword ptr [esp + 0x28]
    mov edx, dword ptr [esp + 0x18]
    mov esi, ebx
    sub esi, edx
    mov edx, dword ptr [esp + 0x2c]
    mov edi, ebx
    push edx
    sub edi, ebp
    call sub_10028796
    mov eax, dword ptr [esp + 0x30]
    mov edi, dword ptr [esp + 0x20]
    mov ebx, esi
    mov esi, dword ptr [esp + 0x28]
    push eax
    call sub_100287aa
    add esp, 0x10
    pop ebp
    pop edi
    pop esi
    pop ebx
    add esp, 8
    ret
    mov ecx, dword ptr [esp + 0x20]
    mov esi, dword ptr [esp + 0x18]
    push ecx
    call sub_100287c3
    add esp, 4
    pop edi
    pop esi
    pop ebx
    add esp, 8
    ret
FUN_10028580 ENDP
END