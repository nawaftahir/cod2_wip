; FUN_10057280 @ 0x10057280 — auto-synthesized
    sub_100571ec PROTO C
.CODE
FUN_10057280 PROC
    sub esp, 0x14
    mov eax, dword ptr [esp + 0x18]
    mov ecx, dword ptr [eax + 0x1b0]
    mov edx, dword ptr [ecx + 0x18]
    push esi
    mov esi, dword ptr [esp + 0x28]
    test esi, esi
    mov dword ptr [esp + 0xc], edx
    mov edx, dword ptr [eax + 0x64]
    mov dword ptr [esp + 0x10], edx
    jle L0
    mov eax, dword ptr [esp + 0x24]
    mov ecx, dword ptr [esp + 0x20]
    push ebx
    sub ecx, eax
    push ebp
    mov dword ptr [esp + 0xc], eax
    mov dword ptr [esp + 0x1c], ecx
    mov dword ptr [esp + 0x10], esi
    push edi
    test edx, edx
    mov esi, dword ptr [ecx + eax]
    mov ebx, dword ptr [eax]
    jbe L1
    mov dword ptr [esp + 0x34], edx
    mov edi, edi
    movzx ecx, byte ptr [esi]
    movzx eax, byte ptr [esi + 1]
    mov ebp, dword ptr [esp + 0x18]
    shr ecx, 3
    mov ebp, dword ptr [ebp + ecx*4]
    inc esi
    movzx edx, byte ptr [esi + 1]
    shr eax, 2
    inc esi
    shr edx, 3
    mov edi, eax
    shl edi, 5
    add edi, edx
    lea edi, [ebp + edi*2]
    inc esi
    cmp word ptr [edi], 0
    jne L2
    push edx
    push ecx
    mov ecx, dword ptr [esp + 0x30]
    push ecx
    call sub_100571ec
    add esp, 0xc
    mov dl, byte ptr [edi]
    mov eax, dword ptr [esp + 0x34]
    dec dl
    mov byte ptr [ebx], dl
    inc ebx
    dec eax
    mov dword ptr [esp + 0x34], eax
    jne L3
    mov edx, dword ptr [esp + 0x1c]
    mov eax, dword ptr [esp + 0x10]
    mov ecx, dword ptr [esp + 0x20]
    mov esi, dword ptr [esp + 0x14]
    add eax, 4
    dec esi
    mov dword ptr [esp + 0x10], eax
    mov dword ptr [esp + 0x14], esi
    jne L4
    pop edi
    pop ebp
    pop ebx
    pop esi
    add esp, 0x14
    ret
FUN_10057280 ENDP
END