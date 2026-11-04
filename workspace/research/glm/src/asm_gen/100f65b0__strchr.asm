; _strchr @ 0x100f65b0 — auto-synthesized
    sub_100f65c1 PROTO C
.CODE
_strchr PROC
    xor eax, eax
    mov al, byte ptr [esp + 8]
    push ebx
    mov ebx, eax
    shl eax, 8
    mov edx, dword ptr [esp + 8]
    test edx, 3
    je L0
    mov cl, byte ptr [edx]
    add edx, 1
    cmp cl, bl
    je sub_100f65c1
    test cl, cl
    je L1
    test edx, 3
    jne L2
    or ebx, eax
    push edi
    mov eax, ebx
    shl ebx, 0x10
    push esi
    or ebx, eax
    mov ecx, dword ptr [edx]
    mov edi, 0x7efefeff
    mov eax, ecx
    mov esi, edi
    xor ecx, ebx
    add esi, eax
    add edi, ecx
    xor ecx, 0xffffffff
    xor eax, 0xffffffff
    xor ecx, edi
    xor eax, esi
    add edx, 4
    and ecx, 0x81010100
    jne L3
    and eax, 0x81010100
    je L4
    and eax, 0x1010100
    jne L5
    and esi, 0x80000000
    jne L4
    pop esi
    pop edi
    pop ebx
    xor eax, eax
    ret
    mov eax, dword ptr [edx - 4]
    cmp al, bl
    je L6
    test al, al
    je L5
    cmp ah, bl
    je L7
    test ah, ah
    je L5
    shr eax, 0x10
    cmp al, bl
    je L8
    test al, al
    je L5
    cmp ah, bl
    je L9
    test ah, ah
    je L5
    jmp L4
    pop esi
    pop edi
    lea eax, [edx - 1]
    pop ebx
    ret
    lea eax, [edx - 2]
    pop esi
    pop edi
    pop ebx
    ret
    lea eax, [edx - 3]
    pop esi
    pop edi
    pop ebx
    ret
    lea eax, [edx - 4]
    pop esi
    pop edi
    pop ebx
    ret
    int3
    int3
_strchr ENDP
END