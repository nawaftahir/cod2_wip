.686
.MODEL FLAT, C
.CODE
FUN_100a7ec8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp + 16], 0
    push ebx
    push esi
    push edi
    jbe L3
    mov edi, dword ptr [ebp + 8]
    sub edi, dword ptr [ebp + 12]
    mov ecx, 0101A4020h
L0:
    mov eax, dword ptr [ebp + 12]
    xor esi, esi
    push 4
    inc esi
    pop edx
L1:
    mov ebx, dword ptr [edi + eax]
    cmp ebx, dword ptr [ecx]
    je L2
    cmp dword ptr [eax], -1
    je L2
    xor esi, esi
L2:
    add ecx, 4
    add eax, 4
    dec edx
    jne L1
    test esi, esi
    jne L5
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 16]
    jb L0
L3:
    xor eax, eax
L4:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
L5:
    xor eax, eax
    inc eax
    jmp L4
FUN_100a7ec8 ENDP
END
