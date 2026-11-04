; FUN_10017050 @ 0x10017050 — auto-synthesized
.CODE
FUN_10017050 PROC
    mov cl, byte ptr [ebx]
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    xor edx, edx
    test cl, cl
    push edi
    mov eax, 0x77
    je L0
    movsx ecx, cl
    imul ecx, eax
    add edx, ecx
    mov cl, byte ptr [ebx + eax - 0x76]
    inc eax
    test cl, cl
    jne L1
    and edx, 0x3ff
    mov word ptr [ebp], dx
    movzx edx, dx
    mov eax, dword ptr [edx*4 + 0x101d4d28]
    test eax, eax
    je L2
    lea ecx, [ecx]
    mov di, word ptr [ebp]
    movzx eax, di
    mov ecx, dword ptr [eax*4 + 0x101d4d28]
    mov eax, dword ptr [ecx]
    mov esi, ebx
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L3
    test cl, cl
    je L4
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L3
    add eax, 2
    add esi, 2
    test cl, cl
    jne L5
    xor eax, eax
    jmp L6
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    je L7
    inc edi
    and edi, 0x3ff
    movzx eax, di
    mov word ptr [ebp], di
    mov ecx, dword ptr [eax*4 + 0x101d4d28]
    test ecx, ecx
    jne L8
    mov edx, dword ptr [esp + 0x14]
    pop edi
    pop esi
    mov byte ptr [edx], 0
    pop ebp
    ret
    mov ecx, dword ptr [esp + 0x14]
    pop edi
    pop esi
    mov byte ptr [ecx], 1
    pop ebp
    ret
FUN_10017050 ENDP
END