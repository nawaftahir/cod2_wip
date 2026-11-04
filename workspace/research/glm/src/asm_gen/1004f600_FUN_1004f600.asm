; FUN_1004f600 @ 0x1004f600 — auto-synthesized
    sub_1004f0f5 PROTO C
.CODE
FUN_1004f600 PROC
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi + 0x184]
    test eax, eax
    jne L0
    push esi
    call sub_1004f0f5
    add esp, 4
    test al, al
    je L1
    mov eax, dword ptr [esi + 0x19c]
    mov eax, dword ptr [eax + 0x10]
    mov edx, dword ptr [esi + 0x184]
    lea ecx, [eax + 0xd0]
    cmp edx, ecx
    jne L2
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 0x14], 0x62
    mov eax, dword ptr [esi + 0x19c]
    mov edx, dword ptr [eax + 0x10]
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 0x18], edx
    mov eax, dword ptr [esi]
    push 3
    push esi
    call dword ptr [eax + 4]
    add esp, 8
    mov dword ptr [esi + 0x184], 0
    mov esi, dword ptr [esi + 0x19c]
    mov edx, dword ptr [esi + 0x10]
    inc edx
    and edx, 7
    mov dword ptr [esi + 0x10], edx
    mov al, 1
    pop esi
    ret
    mov ecx, dword ptr [esi + 0x20]
    push eax
    push esi
    call dword ptr [ecx + 0x14]
    add esp, 8
    test al, al
    jne L3
    xor al, al
    pop esi
    ret
FUN_1004f600 ENDP
END