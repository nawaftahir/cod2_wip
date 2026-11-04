.686
.MODEL FLAT, C
EXTRN sub_10047A9D:PROC
EXTRN sub_10047AB0:PROC
EXTRN sub_10047C73:PROC
EXTRN sub_10047EC7:PROC
EXTRN sub_10047ED2:PROC
EXTRN sub_10047ED3:PROC
EXTRN sub_10047EE5:PROC
EXTRN sub_10047F05:PROC
EXTRN sub_10047F28:PROC
EXTRN sub_10047F57:PROC
EXTRN sub_10047FF9:PROC
EXTRN sub_10047FFD:PROC
.CODE
FUN_10047d40 PROC
    sub sub esp, 12
    push push ebp
    mov mov ebp, dword ptr [esp + 20]
    mov mov eax, dword ptr [ebp + 32]
    mov mov ecx, dword ptr [eax]
    push push esi
    mov mov esi, dword ptr [ebp + 0164h]
    push push edi
    mov mov edi, dword ptr [ebp + 0140h]
    mov mov dword ptr [esi + 16], ecx
    mov mov edx, dword ptr [ebp + 32]
    mov mov eax, dword ptr [edx + 4]
    mov mov dword ptr [esi + 20], eax
    mov mov eax, dword ptr [ebp + 0C4h]
    test test eax, eax
    je L0
    mov mov eax, dword ptr [esi + 68]
    test test eax, eax
    jne L1
    mov mov ecx, dword ptr [esi + 72]
    push push ecx
    mov mov eax, esi
    call sub_10047C73
    add add esp, 4
    mov mov eax, dword ptr [ebp + 0108h]
    test test eax, eax
    mov mov dword ptr [esp + 12], 0
    jle sub_10047ED2
    movsx movsx edx, di
    lea lea eax, [ebp + 010Ch]
    mov mov dword ptr [esp + 20], edx
    mov mov dword ptr [esp + 16], eax
    push push ebx
    mov mov edi, edi
    mov mov ecx, dword ptr [esp + 20]
    mov mov edi, dword ptr [ecx]
    mov mov edx, dword ptr [esp + 36]
    mov mov eax, dword ptr [esp + 16]
L1:
    mov mov ecx, dword ptr [edx + eax*4]
    movsx movsx edx, word ptr [ecx]
    mov mov cl, byte ptr [esp + 24]
    mov mov ebx, dword ptr [ebp + edi*4 + 0F0h]
    sar sar edx, cl
    mov mov ecx, dword ptr [esi + edi*4 + 36]
    mov mov eax, edx
    sub sub eax, ecx
    mov mov dword ptr [esi + edi*4 + 36], edx
    mov mov dword ptr [esp + 32], eax
    jns L2
    mov mov ecx, dword ptr [esp + 32]
    neg neg eax
    dec dec ecx
    mov mov dword ptr [esp + 32], ecx
    xor xor edi, edi
    test test eax, eax
    je sub_10047EC7
    sar sar eax, 1
    inc inc edi
    test test eax, eax
    jne L3
    cmp cmp edi, 11
    jle sub_10047ED3
    mov mov edx, dword ptr [ebp]
    mov mov dword ptr [edx + 20], 6
    mov mov eax, dword ptr [ebp]
    push push ebp
    call call dword ptr [eax]
    add add esp, 4
    mov mov cl, byte ptr [esi + 12]
    test test cl, cl
    mov mov eax, dword ptr [ebx + 20]
    je sub_10047F05
    mov mov ecx, dword ptr [esi + eax*4 + 92]
    lea lea eax, [ecx + edi*4]
    inc inc dword ptr [eax]
    jmp sub_10047F28
    mov mov ecx, dword ptr [esi + eax*4 + 76]
    mov mov edx, dword ptr [ecx + edi*4]
    movsx movsx eax, byte ptr [ecx + edi + 0400h]
    push push edx
    call sub_10047A9D
    add add esp, 4
    test test edi, edi
    je sub_10047F57
    mov mov eax, dword ptr [esp + 32]
    push push eax
    mov mov eax, edi
    call sub_10047AB0
    add add esp, 4
    mov mov eax, dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 20]
    mov mov ecx, dword ptr [ebp + 0108h]
    inc inc eax
    add add edx, 4
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 20], edx
    jl sub_10047EE5
    pop pop ebx
    mov mov ecx, dword ptr [ebp + 32]
    mov mov edx, dword ptr [esi + 16]
    mov mov dword ptr [ecx], edx
    mov mov eax, dword ptr [ebp + 32]
    mov mov ecx, dword ptr [esi + 20]
    mov mov dword ptr [eax + 4], ecx
    mov mov ebp, dword ptr [ebp + 0C4h]
    test test ebp, ebp
    je sub_10047FF9
L2:
    mov mov eax, dword ptr [esi + 68]
    test test eax, eax
    jne sub_10047FFD
    mov mov edx, dword ptr [esi + 72]
    inc inc edx
    and and edx, 7
    mov mov dword ptr [esi + 68], ebp
    mov mov dword ptr [esi + 72], edx
    dec dec dword ptr [esi + 68]
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebp
    add add esp, 12
    ret ret
FUN_10047d40 ENDP
END
