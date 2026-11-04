; FUN_10056520 @ 0x10056520 — auto-synthesized
    sub_10055b0c PROTO C
    sub_10055c92 PROTO C
    sub_10056452 PROTO C
.CODE
FUN_10056520 PROC
    push esi
    push 0x58
    mov esi, eax
    mov eax, dword ptr [esi + 4]
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0x1b0], eax
    xor ecx, ecx
    mov dword ptr [eax], 0x10056400
    mov dword ptr [eax + 8], 0x100564f0
    mov dword ptr [eax + 0xc], 0x10056500
    mov dword ptr [eax + 0x44], ecx
    mov dword ptr [eax + 0x34], ecx
    mov ecx, dword ptr [esi + 0x6c]
    mov eax, 4
    add esp, 0xc
    cmp ecx, eax
    jle L0
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 0x14], 0x37
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 0x18], eax
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    mov ecx, dword ptr [esi + 0x5c]
    mov eax, 0x100
    cmp ecx, eax
    jle L1
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 0x14], 0x39
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 0x18], eax
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    push esi
    call sub_10055b0c
    push esi
    call sub_10055c92
    mov eax, dword ptr [esi + 0x54]
    add esp, 8
    cmp eax, 2
    jne L2
    call sub_10056452
    pop esi
    ret
FUN_10056520 ENDP
END