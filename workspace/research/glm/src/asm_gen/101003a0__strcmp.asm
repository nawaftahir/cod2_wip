; _strcmp @ 0x101003a0 — auto-synthesized
.CODE
_strcmp PROC
    mov edx, dword ptr [esp + 4]
    mov ecx, dword ptr [esp + 8]
    test edx, 3
    jne L0
    mov eax, dword ptr [edx]
    cmp al, byte ptr [ecx]
    jne L1
    or al, al
    je L2
    cmp ah, byte ptr [ecx + 1]
    jne L1
    or ah, ah
    je L2
    shr eax, 0x10
    cmp al, byte ptr [ecx + 2]
    jne L1
    or al, al
    je L2
    cmp ah, byte ptr [ecx + 3]
    jne L1
    add ecx, 4
    add edx, 4
    or ah, ah
    jne L3
    mov edi, edi
    xor eax, eax
    ret
    nop
    sbb eax, eax
    shl eax, 1
    add eax, 1
    ret
    test edx, 1
    je L4
    mov al, byte ptr [edx]
    add edx, 1
    cmp al, byte ptr [ecx]
    jne L1
    add ecx, 1
    or al, al
    je L2
    test edx, 2
    je L3
    mov ax, word ptr [edx]
    add edx, 2
    cmp al, byte ptr [ecx]
    jne L1
    or al, al
    je L2
    cmp ah, byte ptr [ecx + 1]
    jne L1
    or ah, ah
    je L2
    add ecx, 2
_strcmp ENDP
END