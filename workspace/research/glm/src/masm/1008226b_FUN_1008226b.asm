.686
.MODEL FLAT, C
.CODE
FUN_1008226b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 12]
    push edi
    push 4
    pop ecx
    mov edi, 010118028h
    xor eax, eax
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    je L0
    mov esi, dword ptr [ebp + 12]
    push 4
    pop ecx
    mov edi, 01017C3C4h
    xor eax, eax
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    jne L1
L0:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 16]
    mov dword ptr [ecx], eax
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 4]
    xor eax, eax
    jmp L2
L1:
    mov eax, 080004002h
L2:
    pop edi
    pop esi
    pop ebp
    ret 12
FUN_1008226b ENDP
END
