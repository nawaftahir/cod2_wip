.686
.MODEL FLAT, C
.CODE
FUN_10081cbd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 16]
    and dword ptr [eax], 0
    push esi
    mov esi, dword ptr [ebp + 12]
    push edi
    push 4
    pop ecx
    mov edi, 01017C3C4h
    xor edx, edx
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    je L0
    mov esi, dword ptr [ebp + 12]
    push 4
    pop ecx
    mov edi, 010118308h
    xor edx, edx
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    jne L1
L0:
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ecx]
    push ecx
    call dword ptr [eax + 4]
    xor eax, eax
    jmp L2
L1:
    mov eax, 080004002h
L2:
    pop edi
    pop esi
    pop ebp
    ret 12
FUN_10081cbd ENDP
END
