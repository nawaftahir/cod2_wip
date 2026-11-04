.686
.MODEL FLAT, C
.CODE
FUN_10085b72 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ecx]
    mov eax, edx
    and eax, 0FFF00000h
    je L3
    cmp eax, 050000000h
    je L2
    cmp eax, 050200000h
    je L1
    cmp eax, 070800000h
    je L2
    mov eax, edx
    and eax, 0F0000000h
    cmp eax, 060000000h
    jne L0
    push 4
    pop eax
    jmp L4
L0:
    and edx, 0000FFFFFh
    mov eax, edx
    jmp L4
L1:
    xor eax, eax
    inc eax
    jmp L4
L2:
    mov eax, dword ptr [ecx + 12]
    jmp L4
L3:
    xor eax, eax
L4:
    mov edx, eax
    imul edx, dword ptr [ebp + 8]
    push esi
    lea esi, [edx + eax]
    cmp esi, dword ptr [ecx + 12]
    jbe L6
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L5
    and dword ptr [eax], 0
L5:
    xor eax, eax
    jmp L7
L6:
    mov esi, dword ptr [ebp + 12]
    test esi, esi
    je L7
    mov ecx, dword ptr [ecx + 16]
    lea ecx, [ecx + edx*4]
    mov dword ptr [esi], ecx
L7:
    pop esi
    pop ebp
    ret 8
FUN_10085b72 ENDP
END
