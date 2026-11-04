.686
.MODEL FLAT, C
EXTRN sub_100822CF:PROC
EXTRN sub_100822E6:PROC
.CODE
FUN_1008226b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    push push edi
    push push 4
    pop pop ecx
    mov mov edi, 010118028h
    xor xor eax, eax
    repe cmpsd repe cmpsd dword ptr [esi], dword ptr es:[edi]
    je L0
    mov mov esi, dword ptr [ebp + 12]
    push push 4
    pop pop ecx
    mov mov edi, 01017C3C4h
    xor xor eax, eax
    repe cmpsd repe cmpsd dword ptr [esi], dword ptr es:[edi]
    jne sub_100822CF
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov dword ptr [ecx], eax
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 4]
    xor xor eax, eax
    jmp sub_100822E6
    mov mov eax, 080004002h
    pop pop edi
L0:
    pop pop esi
    pop pop ebp
    ret ret 12
FUN_1008226b ENDP
END
