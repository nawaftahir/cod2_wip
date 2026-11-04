.686
.MODEL FLAT, C
EXTRN sub_10047AAD:PROC
EXTRN sub_10047B16:PROC
EXTRN sub_10047B25:PROC
EXTRN sub_10047C3B:PROC
EXTRN sub_10047C81:PROC
EXTRN sub_10047D2E:PROC
EXTRN sub_1004828B:PROC
.CODE
FUN_10047ec0 PROC
    sub esp, 16
    push ebx
    mov ebx, dword ptr [esp + 24]
    mov ecx, dword ptr [ebx + 32]
    mov eax, dword ptr [ebx + 000000140h]
    mov edx, dword ptr [ecx]
    push esi
    mov esi, dword ptr [ebx + 000000164h]
    push edi
    mov edi, dword ptr [ebx + 000000138h]
    mov dword ptr [esi + 16], edx
    mov dword ptr [esp + 12], eax
    mov eax, dword ptr [ebx + 32]
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [esi + 20], ecx
    mov eax, dword ptr [ebx + 0000000C4h]
    test eax, eax
    mov dword ptr [esp + 24], edi
    je L0
    mov eax, dword ptr [esi + 68]
    test eax, eax
    jne L0
    mov edx, dword ptr [esi + 72]
    push edx
    mov eax, esi
    call sub_10047C81
    add esp, 4
L0:
    mov eax, dword ptr [esp + 36]
    mov edx, dword ptr [ebx + 000000134h]
    mov ecx, dword ptr [eax]
    push ebp
    xor ebp, ebp
    cmp edx, edi
    mov dword ptr [esp + 24], ecx
    mov dword ptr [esp + 20], edx
    jg L16
    jmp L1
    lea esp, [esp]
    lea esp, [esp]
L1:
    mov eax, dword ptr [edx*4 + 010191200h]
    mov ecx, dword ptr [esp + 24]
    movsx edi, word ptr [ecx + eax*2]
    test edi, edi
    jne L2
    inc ebp
    jmp L15
L2:
    mov ecx, dword ptr [esp + 16]
    jge L3
    neg edi
    sar edi, cl
    mov eax, edi
    not eax
    mov dword ptr [esp + 40], eax
    jmp L4
L3:
    sar edi, cl
    mov dword ptr [esp + 40], edi
L4:
    test edi, edi
    jne L5
    inc ebp
    jmp L15
L5:
    mov eax, dword ptr [esi + 56]
    test eax, eax
    jbe L6
    mov eax, esi
    call sub_10047C3B
L6:
    cmp ebp, 15
    jle L10
    lea ebx, [ebp - 16]
    shr ebx, 4
    inc ebx
    mov edx, ebx
    neg edx
    shl edx, 4
    add ebp, edx
L7:
    mov cl, byte ptr [esi + 12]
    test cl, cl
    mov eax, dword ptr [esi + 52]
    je L8
    mov eax, dword ptr [esi + eax*4 + 92]
    inc dword ptr [eax + 0000003C0h]
    jmp L9
L8:
    mov ecx, dword ptr [esi + eax*4 + 76]
    movsx eax, byte ptr [ecx + 0000004F0h]
    mov ecx, dword ptr [ecx + 0000003C0h]
    push ecx
    call sub_10047AAD
    add esp, 4
L9:
    dec ebx
    jne L7
L10:
    sar edi, 1
    test edi, edi
    mov ebx, 1
    je L12
    mov edi, edi
L11:
    sar edi, 1
    inc ebx
    test edi, edi
    jne L11
    cmp ebx, 10
    jle L12
    mov eax, dword ptr [esp + 36]
    mov edx, dword ptr [eax]
    mov dword ptr [edx + 20], 6
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx]
    add esp, 4
L12:
    mov dl, byte ptr [esi + 12]
    mov eax, dword ptr [esi + 52]
    shl ebp, 4
    add ebp, ebx
    test dl, dl
    mov ecx, ebp
    je L13
    mov edx, dword ptr [esi + eax*4 + 92]
    mov eax, dword ptr [edx + ecx*4]
    lea ecx, [edx + ecx*4]
    inc eax
    mov dword ptr [ecx], eax
    jmp L14
L13:
    mov edx, dword ptr [esi + eax*4 + 76]
    movsx eax, byte ptr [edx + ecx + 000000400h]
    mov ecx, dword ptr [edx + ecx*4]
    push ecx
    call sub_10047B16
    add esp, 4
L14:
    mov edx, dword ptr [esp + 40]
    push edx
    mov eax, ebx
    call sub_10047B25
    mov ebx, dword ptr [esp + 40]
    mov edx, dword ptr [esp + 24]
    add esp, 4
    xor ebp, ebp
L15:
    mov eax, dword ptr [esp + 28]
    inc edx
    cmp edx, eax
    mov dword ptr [esp + 20], edx
    jle L1
    test ebp, ebp
    jle L16
    mov ecx, dword ptr [esi + 56]
    inc ecx
    mov eax, ecx
    cmp eax, 000007FFFh
    mov dword ptr [esi + 56], ecx
    jne L16
    mov eax, esi
    call sub_10047D2E
L16:
    mov eax, dword ptr [ebx + 32]
    mov ecx, dword ptr [esi + 16]
    mov dword ptr [eax], ecx
    mov edx, dword ptr [ebx + 32]
    mov eax, dword ptr [esi + 20]
    mov dword ptr [edx + 4], eax
    mov ebx, dword ptr [ebx + 0000000C4h]
    test ebx, ebx
    pop ebp
    je sub_1004828B
    mov eax, dword ptr [esi + 68]
    test eax, eax
    jne L17
    mov ecx, dword ptr [esi + 72]
    inc ecx
    and ecx, 7
    mov dword ptr [esi + 68], ebx
    mov dword ptr [esi + 72], ecx
FUN_10047ec0 ENDP
END
