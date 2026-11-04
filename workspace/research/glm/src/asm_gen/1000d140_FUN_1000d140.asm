; FUN_1000d140 @ 0x1000d140 — auto-synthesized
.CODE
FUN_1000d140 PROC
    mov cl, byte ptr [ebx]
    xor edx, edx
    test cl, cl
    mov eax, 0x77
    je L0
    lea ecx, [ecx]
    movsx ecx, cl
    imul ecx, eax
    add edx, ecx
    mov cl, byte ptr [ebx + eax - 0x76]
    inc eax
    test cl, cl
    jne L1
    and edx, 0x7ff
    push ebp
    mov ebp, edx
    push edi
    mov edi, dword ptr [ebp*4 + 0x101cea68]
    test edi, edi
    je L2
    push esi
    mov esi, dword ptr [edi + 0x20]
    mov eax, ebx
    lea esp, [esp]
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
    inc ebp
    and ebp, 0x7ff
    mov edi, dword ptr [ebp*4 + 0x101cea68]
    test edi, edi
    jne L8
    pop esi
    cmp edi, 0x101ce890
    jb L9
    cmp edi, 0x101cea64
    jae L9
    xor ecx, ecx
    mov eax, 1
    test al, al
    setne cl
    dec ecx
    and ecx, edi
    pop edi
    mov eax, ecx
    pop ebp
    ret
    xor eax, eax
    xor ecx, ecx
    test al, al
    setne cl
    dec ecx
    and ecx, edi
    pop edi
    mov eax, ecx
    pop ebp
    ret
FUN_1000d140 ENDP
END