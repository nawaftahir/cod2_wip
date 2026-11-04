.686
.MODEL FLAT, C
EXTRN sub_10081D0A:PROC
EXTRN sub_10081D2A:PROC
EXTRN sub_10081D3E:PROC
.CODE
FUN_10081cbd PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 16]
    and and dword ptr [eax], 0
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    push push edi
    push push 4
    pop pop ecx
    mov mov edi, 01017C3C4h
    xor xor edx, edx
    repe cmpsd repe cmpsd dword ptr [esi], dword ptr es:[edi]
    je sub_10081D0A
    mov mov esi, dword ptr [ebp + 12]
    push push 4
    pop pop ecx
    mov mov edi, 010118308h
    xor xor edx, edx
    repe cmpsd repe cmpsd dword ptr [esi], dword ptr es:[edi]
    jne sub_10081D2A
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [eax], ecx
    mov mov eax, dword ptr [ecx]
    push push ecx
    call call dword ptr [eax + 4]
    xor xor eax, eax
    jmp sub_10081D3E
    mov mov eax, 080004002h
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 12
FUN_10081cbd ENDP
END
