.686
.MODEL FLAT, C
.CODE
FUN_1006508a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 12]
    push edi
    xor eax, eax
    xor edi, edi
    xor edx, edx
    test ecx, ecx
    je L6
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebp + 12], ecx
    mov ecx, dword ptr [ebp + 16]
L0:
    cmp byte ptr [esi], 34
    jne L2
    test ecx, ecx
    je L1
    mov byte ptr [eax + ecx], 92
L1:
    inc eax
    test edi, edi
    jne L2
    xor ebx, ebx
    test edx, edx
    sete bl
    mov edx, ebx
L2:
    xor edi, edi
    test edx, edx
    je L4
    cmp byte ptr [esi], 92
    jne L4
    test ecx, ecx
    je L3
    mov byte ptr [eax + ecx], 92
L3:
    xor edi, edi
    inc eax
    inc edi
L4:
    test ecx, ecx
    je L5
    mov bl, byte ptr [esi]
    mov byte ptr [eax + ecx], bl
L5:
    inc eax
    inc esi
    dec dword ptr [ebp + 12]
    jne L0
    pop esi
    pop ebx
L6:
    pop edi
    pop ebp
    ret 12
FUN_1006508a ENDP
END
