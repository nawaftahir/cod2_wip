.686
.MODEL FLAT, C
.CODE
FUN_100a7dc4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 12]
    push esi
    xor esi, esi
    sub ecx, eax
L0:
    mov edx, dword ptr [eax]
    cmp edx, -1
    je L1
    cmp edx, dword ptr [ecx + eax]
    jne L3
L1:
    inc esi
    add eax, 4
    cmp esi, 4
    jb L0
    xor eax, eax
    inc eax
L2:
    pop esi
    pop ebp
    ret 8
L3:
    xor eax, eax
    jmp L2
FUN_100a7dc4 ENDP
END
