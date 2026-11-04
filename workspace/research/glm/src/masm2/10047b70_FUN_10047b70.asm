.686
.MODEL FLAT, C
EXTRN sub_10047A0A:PROC
EXTRN sub_10047A1C:PROC
EXTRN sub_10047A45:PROC
EXTRN sub_10047C32:PROC
EXTRN sub_10047C33:PROC
EXTRN sub_10047C60:PROC
EXTRN sub_10047CAF:PROC
EXTRN sub_10047CB3:PROC
.CODE
FUN_10047b70 PROC
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [esi + 56]
    test test eax, eax
    jbe sub_10047C33
    push push ebp
    push push edi
    sar sar eax, 1
    xor xor edi, edi
    test test eax, eax
    je L1
    sar sar eax, 1
    inc inc edi
    test test eax, eax
    jne L0
    cmp cmp edi, 14
    jle L2
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [ecx + 20], 40
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx]
    add add esp, 4
    mov mov dl, byte ptr [esi + 12]
    mov mov eax, dword ptr [esi + 52]
    mov mov ecx, edi
    shl shl ecx, 4
    test test dl, dl
    je L3
    mov mov eax, dword ptr [esi + eax*4 + 92]
    lea lea eax, [eax + ecx*4]
    inc inc dword ptr [eax]
L1:
    jmp sub_10047C32
    mov mov edx, dword ptr [esi + eax*4 + 76]
    movsx movsx eax, byte ptr [edx + ecx + 0400h]
    mov mov ecx, dword ptr [edx + ecx*4]
    push push ecx
    call sub_10047A0A
    add add esp, 4
    test test edi, edi
    je sub_10047C60
    mov mov edx, dword ptr [esi + 56]
    push push edx
    mov mov eax, edi
    call sub_10047A1C
    add add esp, 4
    mov mov al, byte ptr [esi + 12]
    test test al, al
    mov mov ebp, dword ptr [esi + 60]
    mov mov edi, dword ptr [esi + 64]
    mov mov dword ptr [esi + 56], 0
    jne sub_10047CAF
    test test ebp, ebp
    jbe sub_10047CB3
    movsx movsx eax, byte ptr [edi]
    push push eax
    mov mov eax, 1
    call sub_10047A45
    add add esp, 4
    inc inc edi
    dec dec ebp
    jne sub_10047CB3
    pop pop edi
    mov mov dword ptr [esi + 60], 0
    pop pop ebp
    pop pop esi
    ret ret
FUN_10047b70 ENDP
END
