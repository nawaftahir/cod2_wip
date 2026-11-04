.686
.MODEL FLAT, C
EXTRN sub_10047A0A:PROC
EXTRN sub_10047A1C:PROC
EXTRN sub_10047A45:PROC
.CODE
FUN_10047b70 PROC
    push esi
    mov esi, eax
    mov eax, dword ptr [esi + 56]
    test eax, eax
    jbe L7
    push ebp
    push edi
    sar eax, 1
    xor edi, edi
    test eax, eax
    je L1
L0:
    sar eax, 1
    inc edi
    test eax, eax
    jne L0
    cmp edi, 14
    jle L1
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    mov dword ptr [ecx + 20], 40
    mov eax, dword ptr [esi + 32]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx]
    add esp, 4
L1:
    mov dl, byte ptr [esi + 12]
    mov eax, dword ptr [esi + 52]
    mov ecx, edi
    shl ecx, 4
    test dl, dl
    je L2
    mov eax, dword ptr [esi + eax*4 + 92]
    lea eax, [eax + ecx*4]
    inc dword ptr [eax]
    jmp L3
L2:
    mov edx, dword ptr [esi + eax*4 + 76]
    movsx eax, byte ptr [edx + ecx + 000000400h]
    mov ecx, dword ptr [edx + ecx*4]
    push ecx
    call sub_10047A0A
    add esp, 4
L3:
    test edi, edi
    je L4
    mov edx, dword ptr [esi + 56]
    push edx
    mov eax, edi
    call sub_10047A1C
    add esp, 4
L4:
    mov al, byte ptr [esi + 12]
    test al, al
    mov ebp, dword ptr [esi + 60]
    mov edi, dword ptr [esi + 64]
    mov dword ptr [esi + 56], 0
    jne L6
    test ebp, ebp
    jbe L6
L5:
    movsx eax, byte ptr [edi]
    push eax
    mov eax, 1
    call sub_10047A45
    add esp, 4
    inc edi
    dec ebp
    jne L5
L6:
    pop edi
    mov dword ptr [esi + 60], 0
    pop ebp
L7:
    pop esi
    ret
FUN_10047b70 ENDP
END
