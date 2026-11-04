; FUN_1006a087 @ 0x1006a087 — auto-synthesized
.CODE
FUN_1006a087 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [ecx]
    mov eax, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax]
    push ebx
    push esi
    mov ecx, 0x1010f000
    mov esi, ecx
    mov si, word ptr [esi]
    cmp si, word ptr [edx]
    push edi
    je L0
    mov ebx, 0x1010effc
    mov esi, ebx
    mov si, word ptr [esi]
    cmp si, word ptr [edx]
    je L0
    mov esi, 0x1010eff8
    mov edi, esi
    mov di, word ptr [edi]
    cmp di, word ptr [edx]
    je L0
    mov edi, dword ptr [eax]
    mov cx, word ptr [ecx]
    cmp cx, word ptr [edi]
    je L0
    mov cx, word ptr [ebx]
    cmp cx, word ptr [edi]
    je L0
    mov cx, word ptr [esi]
    cmp cx, word ptr [edi]
    je L0
    lea esi, [edi + 2]
    lea eax, [edx + 2]
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L1
    test cl, cl
    je L2
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L1
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L3
    xor eax, eax
    jmp L4
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    jne L5
    push 2
    pop ecx
    mov esi, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L5
    sbb eax, eax
    sbb eax, -1
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
    mov eax, dword ptr [eax]
    mov esi, edx
    mov dl, byte ptr [esi]
    mov cl, dl
    cmp dl, byte ptr [eax]
    jne L6
    test cl, cl
    je L7
    mov dl, byte ptr [esi + 1]
    mov cl, dl
    cmp dl, byte ptr [eax + 1]
    jne L6
    inc esi
    inc esi
    inc eax
    inc eax
    test cl, cl
    jne L8
    xor eax, eax
    jmp L5
FUN_1006a087 ENDP
END