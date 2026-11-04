; FUN_10019e10 @ 0x10019e10 — auto-synthesized
.CODE
FUN_10019e10 PROC
    mov eax, dword ptr [esp + 0xc]
    mov ecx, dword ptr [eax]
    push ebx
    push ebp
    xor edx, edx
    push esi
    xor ebp, ebp
    cmp ecx, edx
    push edi
    je L0
    mov edi, eax
    cmp dword ptr [eax + 8], edx
    jne L1
    mov esi, dword ptr [eax]
    mov eax, dword ptr [esp + 0x14]
    nop
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L2
    cmp cl, dl
    je L3
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L2
    add eax, 2
    add esi, 2
    cmp cl, dl
    jne L4
    xor eax, eax
    jmp L5
    sbb eax, eax
    sbb eax, -1
    cmp eax, edx
    je L6
    mov ecx, dword ptr [edi + 0x14]
    add edi, 0x14
    inc ebp
    cmp ecx, edx
    mov eax, edi
    jne L7
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
    mov ecx, dword ptr [esp + 0x1c]
    lea eax, [ebp + ebp*4]
    movzx eax, byte ptr [ecx + eax*4 + 4]
    cmp eax, 0xbb
    jge L8
    mov ecx, dword ptr [esp + 0x20]
    pop edi
    mov byte ptr [ecx + 6], dl
    mov edx, dword ptr [esp + 0x14]
    mov word ptr [ecx + 4], ax
    mov al, byte ptr [edx + 5]
    pop esi
    pop ebp
    mov byte ptr [ecx + 7], al
    mov al, 1
    pop ebx
    ret
    mov esi, dword ptr [esp + 0x18]
    mov ecx, dword ptr [esi + 0xc]
    cmp word ptr [ecx], 3
    jne L9
    xor eax, 2
    mov ecx, dword ptr [esp + 0x20]
    mov word ptr [ecx + 4], ax
    pop edi
    mov byte ptr [ecx + 6], dl
    mov edx, dword ptr [esi + 8]
    mov al, byte ptr [edx + 8]
    pop esi
    pop ebp
    mov byte ptr [ecx + 7], al
    mov al, 1
    pop ebx
    ret
FUN_10019e10 ENDP
END