; FUN_1004a1d0 @ 0x1004a1d0 — auto-synthesized
    sub_10049ff4 PROTO C
.CODE
FUN_1004a1d0 PROC
    push esi
    mov esi, eax
    mov eax, dword ptr [esi + 0x14]
    push edi
    add eax, 0xffffff38
    xor edi, edi
    cmp eax, 0xa
    ja L0
    movzx eax, byte ptr [eax + 0x1004a27c]
    jmp dword ptr [eax*4 + 0x1004a268]
    mov ecx, dword ptr [esi + 0x198]
    push esi
    call dword ptr [ecx + 4]
    mov edx, dword ptr [esi + 0x20]
    push esi
    call dword ptr [edx + 8]
    add esp, 8
    mov dword ptr [esi + 0x14], 0xc9
    mov eax, dword ptr [esi + 0x198]
    push esi
    call dword ptr [eax]
    mov edi, eax
    add esp, 4
    cmp edi, 1
    jne L1
    call sub_10049ff4
    mov eax, edi
    pop edi
    mov dword ptr [esi + 0x14], 0xca
    pop esi
    ret
    pop edi
    mov eax, 1
    pop esi
    ret
    mov ecx, dword ptr [esi + 0x198]
    push esi
    call dword ptr [ecx]
    add esp, 4
    pop edi
    pop esi
    ret
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 0x14], 0x14
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esi + 0x14]
    mov dword ptr [eax + 0x18], ecx
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
    mov eax, edi
    pop edi
    pop esi
    ret
FUN_1004a1d0 ENDP
END