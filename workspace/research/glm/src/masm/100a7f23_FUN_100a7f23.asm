.686
.MODEL FLAT, C
.CODE
FUN_100a7f23 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    and dword ptr [ebp - 4], 0
    push ebx
    xor eax, eax
    push esi
    push edi
    lea edi, [ebp - 20]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 12]
    xor ebx, ebx
    xor edi, edi
    inc ebx
    test edx, edx
    jbe L1
    mov esi, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + 16]
L0:
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [esi + ecx*4]
    mov ecx, dword ptr [ecx + 16]
    cmp ecx, 3
    ja L3
    inc edi
    add eax, 4
    cmp edi, edx
    mov dword ptr [ebp + ecx*4 - 20], ebx
    jb L0
L1:
    xor ecx, ecx
    mov edx, ebx
    xor eax, eax
L2:
    cmp dword ptr [ebp + eax*4 - 20], 0
    je L4
    xor edx, edx
    jmp L5
L3:
    xor eax, eax
    jmp L7
L4:
    mov ecx, ebx
L5:
    inc eax
    cmp eax, 3
    jb L2
    test ecx, ecx
    je L6
    test edx, edx
    jne L6
    mov dword ptr [ebp - 4], ebx
L6:
    mov eax, dword ptr [ebp - 4]
L7:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_100a7f23 ENDP
END
