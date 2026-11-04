; FUN_1004fc10 @ 0x1004fc10 — auto-synthesized
.CODE
FUN_1004fc10 PROC
    push esi
    push edi
    push 0x580
    mov esi, eax
    mov eax, dword ptr [esi + 4]
    push 1
    push esi
    call dword ptr [eax]
    mov edx, eax
    add edx, 0x100
    add esp, 0xc
    mov ecx, 0x40
    xor eax, eax
    lea edi, [edx - 0x100]
    mov dword ptr [esi + 0x128], edx
    rep stosd dword ptr es:[edi], eax
    mov byte ptr [eax + edx], al
    inc eax
    cmp eax, 0xff
    jle L0
    add edx, 0x80
    or eax, 0xffffffff
    lea edi, [edx + 0x80]
    mov ecx, 0x60
    rep stosd dword ptr es:[edi], eax
    mov ecx, 0x60
    xor eax, eax
    lea edi, [edx + 0x200]
    rep stosd dword ptr es:[edi], eax
    mov esi, dword ptr [esi + 0x128]
    lea edi, [edx + 0x380]
    mov ecx, 0x20
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    pop esi
    ret
FUN_1004fc10 ENDP
END