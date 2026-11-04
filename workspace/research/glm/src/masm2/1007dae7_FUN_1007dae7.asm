.686
.MODEL FLAT, C
EXTRN sub_1007DB34:PROC
EXTRN sub_1007DB54:PROC
EXTRN sub_1007DB68:PROC
.CODE
FUN_1007dae7 PROC
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
    je sub_1007DB34
    mov mov esi, dword ptr [ebp + 12]
    push push 4
    pop pop ecx
    mov mov edi, 010118038h
    xor xor edx, edx
    repe cmpsd repe cmpsd dword ptr [esi], dword ptr es:[edi]
    jne sub_1007DB54
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [eax], ecx
    mov mov eax, dword ptr [ecx]
    push push ecx
    call call dword ptr [eax + 4]
    xor xor eax, eax
    jmp sub_1007DB68
    mov mov eax, 080004002h
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 12
FUN_1007dae7 ENDP
END
