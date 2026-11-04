.686
.MODEL FLAT, C
.CODE
FUN_1006a087 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [ecx]
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax]
    push ebx
    push esi
    mov ecx, 01010F000h
    mov esi, ecx
    mov si, word ptr [esi]
    cmp si, word ptr [edx]
    push edi
    je L6
    mov ebx, 01010EFFCh
    mov esi, ebx
    mov si, word ptr [esi]
    cmp si, word ptr [edx]
    je L6
    mov esi, 01010EFF8h
    mov edi, esi
    mov di, word ptr [edi]
    cmp di, word ptr [edx]
    je L6
    mov edi, dword ptr [eax]
    mov cx, word ptr [ecx]
    cmp cx, word ptr [edi]
    je L6
    mov cx, word ptr [ebx]
    cmp cx, word ptr [edi]
    je L6
    mov cx, word ptr [esi]
    cmp cx, word ptr [edi]
    je L6
    lea esi, [edi + 2]
    lea eax, [edx + 2]
L0:
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L2
    test cl, cl
    je L1
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L2
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L0
L1:
    xor eax, eax
    jmp L3
L2:
    sbb eax, eax
    sbb eax, -1
L3:
    test eax, eax
    jne L5
    push 2
    pop ecx
    mov esi, edx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L5
L4:
    sbb eax, eax
    sbb eax, -1
L5:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
L6:
    mov eax, dword ptr [eax]
    mov esi, edx
L7:
    mov dl, byte ptr [esi]
    mov cl, dl
    cmp dl, byte ptr [eax]
    jne L4
    test cl, cl
    je L8
    mov dl, byte ptr [esi + 1]
    mov cl, dl
    cmp dl, byte ptr [eax + 1]
    jne L4
    inc esi
    inc esi
    inc eax
    inc eax
    test cl, cl
    jne L7
L8:
    xor eax, eax
    jmp L5
FUN_1006a087 ENDP
END
