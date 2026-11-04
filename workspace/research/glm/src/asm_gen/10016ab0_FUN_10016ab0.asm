; FUN_10016ab0 @ 0x10016ab0 — auto-synthesized
.CODE
FUN_10016ab0 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    mov cl, byte ptr [ebp]
    push esi
    xor edx, edx
    test cl, cl
    push edi
    mov eax, 0x77
    je L0
    movsx ecx, cl
    imul ecx, eax
    add edx, ecx
    mov cl, byte ptr [eax + ebp - 0x76]
    inc eax
    test cl, cl
    jne L1
    and edx, 0x1f
    mov edi, edx
    mov eax, dword ptr [edi*4 + 0x101da3dc]
    test eax, eax
    je L2
    mov eax, dword ptr [eax]
    mov esi, ebp
    lea ebx, [ebx]
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
    and edi, 0x1f
    mov eax, dword ptr [edi*4 + 0x101da3dc]
    test eax, eax
    jne L8
    mov dword ptr [ebx], edi
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
    mov dword ptr [ebx], edi
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
FUN_10016ab0 ENDP
END