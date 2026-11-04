.686
.MODEL FLAT, C
.CODE
FUN_100b3f49 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    sub edx, dword ptr [ebp + 12]
    and dword ptr [ebp + 8], 0
    push ebx
    push esi
    mov ecx, 0101A4218h
    push edi
L0:
    mov eax, dword ptr [ebp + 12]
    xor edi, edi
    push 4
    inc edi
    pop esi
L1:
    mov ebx, dword ptr [edx + eax]
    cmp ebx, dword ptr [ecx]
    je L2
    cmp dword ptr [eax], -1
    je L2
    xor edi, edi
L2:
    add ecx, 4
    add eax, 4
    dec esi
    jne L1
    test edi, edi
    jne L4
    add dword ptr [ebp + 8], 16
    cmp dword ptr [ebp + 8], 000000080h
    jb L0
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
L4:
    xor eax, eax
    inc eax
    jmp L3
FUN_100b3f49 ENDP
END
