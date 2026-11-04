; _memcmp @ 0x10100d60 — auto-synthesized
.CODE
_memcmp PROC
    mov eax, dword ptr [esp + 0xc]
    test eax, eax
    je L0
    mov edx, dword ptr [esp + 4]
    push esi
    push edi
    mov esi, edx
    mov edi, dword ptr [esp + 0x10]
    or edx, edi
    and edx, 3
    je L1
    test eax, 1
    je L2
    mov cl, byte ptr [esi]
    cmp cl, byte ptr [edi]
    jne L3
    add esi, 1
    add edi, 1
    sub eax, 1
    je L4
    mov cl, byte ptr [esi]
    mov dl, byte ptr [edi]
    cmp cl, dl
    jne L3
    mov cl, byte ptr [esi + 1]
    mov dl, byte ptr [edi + 1]
    cmp cl, dl
    jne L3
    add edi, 2
    add esi, 2
    sub eax, 2
    jne L2
    pop edi
    pop esi
    ret
    mov ecx, eax
    and eax, 3
    shr ecx, 2
    je L5
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    je L5
    mov ecx, dword ptr [esi - 4]
    mov edx, dword ptr [edi - 4]
    cmp cl, dl
    jne L6
    cmp ch, dh
    jne L6
    shr ecx, 0x10
    shr edx, 0x10
    cmp cl, dl
    jne L6
    cmp ch, dh
    mov eax, 0
    sbb eax, eax
    pop edi
    sbb eax, -1
    pop esi
    ret
    test eax, eax
    je L4
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [edi]
    cmp dl, cl
    jne L6
    sub eax, 1
    je L7
    cmp dh, ch
    jne L6
    sub eax, 1
    je L7
    and ecx, 0xff0000
    and edx, 0xff0000
    cmp edx, ecx
    jne L6
    sub eax, 1
    pop edi
    pop esi
    ret
_memcmp ENDP
END