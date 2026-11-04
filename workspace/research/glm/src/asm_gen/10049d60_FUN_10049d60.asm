; FUN_10049d60 @ 0x10049d60 — auto-synthesized
.CODE
FUN_10049d60 PROC
    push esi
    push edi
    push 0x44
    mov edi, eax
    mov eax, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [eax]
    mov ecx, dword ptr [esp + 0x18]
    mov esi, eax
    mov dword ptr [edi + 0x150], esi
    push 0x500
    mov dword ptr [esi], 0x10049a60
    mov dword ptr [esi + 4], 0x10049ad0
    mov dword ptr [esi + 0x18], ecx
    mov edx, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [edx + 4]
    mov edx, eax
    xor eax, eax
    mov edi, edx
    mov ecx, 0x140
    rep stosd dword ptr es:[edi], eax
    lea eax, [edx + 0x80]
    lea ecx, [edx + 0x100]
    mov dword ptr [esi + 0x20], eax
    mov dword ptr [esi + 0x24], ecx
    lea eax, [edx + 0x180]
    lea ecx, [edx + 0x200]
    mov dword ptr [esi + 0x28], eax
    mov dword ptr [esi + 0x2c], ecx
    lea eax, [edx + 0x280]
    lea ecx, [edx + 0x300]
    mov dword ptr [esi + 0x30], eax
    mov dword ptr [esi + 0x34], ecx
    add esp, 0x18
    mov dword ptr [esi + 0x1c], edx
    lea eax, [edx + 0x380]
    lea ecx, [edx + 0x400]
    add edx, 0x480
    pop edi
    mov dword ptr [esi + 0x38], eax
    mov dword ptr [esi + 0x3c], ecx
    mov dword ptr [esi + 0x40], edx
    pop esi
    ret
FUN_10049d60 ENDP
END