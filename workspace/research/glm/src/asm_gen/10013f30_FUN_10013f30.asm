; FUN_10013f30 @ 0x10013f30 — auto-synthesized
    sub_10014121 PROTO C
    sub_10014136 PROTO C
    sub_1001414c PROTO C
    sub_1001415c PROTO C
    sub_10014173 PROTO C
.CODE
FUN_10013f30 PROC
    push ecx
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [esp + 0x14]
    mov ecx, eax
    sub ecx, edi
    sar ecx, 4
    cmp ecx, 0x28
    jle L0
    lea eax, [ecx + 1]
    cdq
    and edx, 7
    add eax, edx
    sar eax, 3
    push ebx
    mov ebx, eax
    shl eax, 4
    push ebp
    mov ebp, eax
    mov eax, dword ptr [esp + 0x20]
    shl ebx, 5
    lea esi, [edi + ebp]
    push eax
    lea eax, [ebx + edi]
    mov dword ptr [esp + 0x14], esi
    call sub_10014121
    mov esi, dword ptr [esp + 0x1c]
    mov ecx, dword ptr [esp + 0x24]
    mov edi, esi
    push ecx
    lea eax, [esi + ebp]
    sub edi, ebp
    call sub_10014136
    mov eax, dword ptr [esp + 0x24]
    mov esi, eax
    sub esi, ebp
    mov ebp, dword ptr [esp + 0x28]
    mov edi, eax
    push ebp
    sub edi, ebx
    call sub_1001414c
    mov edi, dword ptr [esp + 0x1c]
    mov eax, esi
    mov esi, dword ptr [esp + 0x24]
    push ebp
    call sub_1001415c
    add esp, 0x10
    pop ebp
    pop ebx
    pop edi
    pop esi
    pop ecx
    ret
    mov edx, dword ptr [esp + 0x18]
    mov esi, dword ptr [esp + 0x10]
    push edx
    call sub_10014173
    add esp, 4
    pop edi
    pop esi
    pop ecx
    ret
FUN_10013f30 ENDP
END