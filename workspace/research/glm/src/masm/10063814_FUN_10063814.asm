.686
.MODEL FLAT, C
.CODE
FUN_10063814 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 44
    pop ecx
    mov eax, 01010C438h
L0:
    mov edx, dword ptr [eax - 16]
    sub eax, 12
    dec ecx
    cmp edx, dword ptr [ebp + 8]
    jne L1
    mov edx, dword ptr [eax]
    and edx, dword ptr [ebp + 12]
    cmp edx, dword ptr [ebp + 12]
    je L3
L1:
    cmp eax, 01010C228h
    ja L0
    mov eax, 080004005h
L2:
    pop ebp
    ret 12
L3:
    push edi
    mov edi, dword ptr [ebp + 16]
    test edi, edi
    je L4
    push esi
    lea esi, [ecx + ecx*2]
    lea esi, [esi*4 + 01010C220h]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    pop esi
L4:
    xor eax, eax
    pop edi
    jmp L2
FUN_10063814 ENDP
END
