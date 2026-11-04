.686
.MODEL FLAT, C
.CODE
FUN_1000d140 PROC
    mov cl, byte ptr [ebx]
    xor edx, edx
    test cl, cl
    mov eax, 119
    je L1
    lea ecx, [ecx]
L0:
    movsx ecx, cl
    imul ecx, eax
    add edx, ecx
    mov cl, byte ptr [ebx + eax - 118]
    inc eax
    test cl, cl
    jne L0
L1:
    and edx, 0000007FFh
    push ebp
    mov ebp, edx
    push edi
    mov edi, dword ptr [ebp*4 + 0101CEA68h]
    test edi, edi
    je L8
    push esi
L2:
    mov esi, dword ptr [edi + 32]
    mov eax, ebx
    lea esp, [esp]
L3:
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L5
    test cl, cl
    je L4
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L5
    add eax, 2
    add esi, 2
    test cl, cl
    jne L3
L4:
    xor eax, eax
    jmp L6
L5:
    sbb eax, eax
    sbb eax, -1
L6:
    test eax, eax
    je L7
    inc ebp
    and ebp, 0000007FFh
    mov edi, dword ptr [ebp*4 + 0101CEA68h]
    test edi, edi
    jne L2
L7:
    pop esi
L8:
    cmp edi, 0101CE890h
    jb L9
    cmp edi, 0101CEA64h
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
L9:
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
