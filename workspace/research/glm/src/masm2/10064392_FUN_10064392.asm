.686
.MODEL FLAT, C
EXTRN sub_10064407:PROC
EXTRN sub_10064447:PROC
EXTRN sub_1006444C:PROC
EXTRN sub_10067C7D:PROC
.CODE
FUN_10064392 PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0268h]
    mov mov eax, dword ptr [eax + 56]
    xor xor edx, edx
    cmp cmp eax, edx
    jne L0
    push push 01010C6C8h
    push push 05E5h
    jmp L1
    cmp cmp dword ptr [eax + 8], edx
    je sub_10064407
    push push 01010C6A4h
    push push 05EAh
    lea lea eax, [esi + 0278h]
    push push eax
    lea lea eax, [esi + 24]
    push push eax
    call sub_10067C7D
    add add esp, 16
    mov mov dword ptr [esi + 68], 1
    mov mov eax, 080004005h
    pop pop esi
L1:
    ret ret
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp dword ptr [eax], edx
    jne sub_10064447
    cmp cmp dword ptr [eax + 4], edx
    je sub_1006444C
    mov mov edx, ecx
    mov mov dword ptr [esi + 84], edx
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [eax + 8], ecx
    xor xor eax, eax
    pop pop esi
    ret ret
FUN_10064392 ENDP
END
