.686
.MODEL FLAT, C
.CODE
FUN_1007db60 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 12]
    test esi, esi
    jne L0
    mov eax, 08876086Ch
    jmp L5
L0:
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx + 12]
    cmp eax, 28
    jb L1
    mov ecx, dword ptr [edx + 8]
    cmp dword ptr [ecx], 28
    jb L1
    cmp dword ptr [ecx + 4], eax
    jb L2
L1:
    mov eax, 088760B59h
    jmp L5
L2:
    push edi
    xor eax, eax
    mov edi, esi
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov edi, dword ptr [ecx + 4]
    test edi, edi
    je L3
    mov eax, dword ptr [edx + 8]
    add eax, edi
    jmp L4
L3:
    xor eax, eax
L4:
    mov dword ptr [esi], eax
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [esi + 4], eax
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [esi + 8], eax
    xor eax, eax
    pop edi
L5:
    pop esi
    pop ebp
    ret 8
FUN_1007db60 ENDP
END
