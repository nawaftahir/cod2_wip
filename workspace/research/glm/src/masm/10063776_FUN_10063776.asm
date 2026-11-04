.686
.MODEL FLAT, C
.CODE
FUN_10063776 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    xor edx, edx
    cmp dword ptr [ebp + 8], edx
    jne L0
    mov eax, 08876086Ch
    jmp L10
L0:
    push 44
    pop eax
    push ebx
    push esi
    mov dword ptr [ebp - 4], eax
    push edi
L1:
    mov edi, dword ptr [ebp + 8]
    add eax, edx
    shr eax, 1
    lea ecx, [eax + eax*2]
    mov esi, dword ptr [ecx*4 + 01010C220h]
L2:
    mov bl, byte ptr [esi]
    mov cl, bl
    cmp bl, byte ptr [edi]
    jne L4
    test cl, cl
    je L3
    mov bl, byte ptr [esi + 1]
    mov cl, bl
    cmp bl, byte ptr [edi + 1]
    jne L4
    inc esi
    inc esi
    inc edi
    inc edi
    test cl, cl
    jne L2
L3:
    xor ecx, ecx
    jmp L5
L4:
    sbb ecx, ecx
    sbb ecx, -1
L5:
    test ecx, ecx
    je L11
    jge L6
    lea edx, [eax + 1]
    jmp L7
L6:
    mov dword ptr [ebp - 4], eax
L7:
    mov eax, dword ptr [ebp - 4]
    cmp edx, eax
    jb L1
L8:
    mov eax, 080004005h
L9:
    pop edi
    pop esi
    pop ebx
L10:
    leave
    ret 12
L11:
    lea eax, [eax + eax*2]
    shl eax, 2
    mov ecx, dword ptr [eax + 01010C228h]
    and ecx, dword ptr [ebp + 12]
    cmp ecx, dword ptr [ebp + 12]
    jne L8
    mov edi, dword ptr [ebp + 16]
    test edi, edi
    je L12
    lea esi, [eax + 01010C220h]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
L12:
    xor eax, eax
    jmp L9
FUN_10063776 ENDP
END
