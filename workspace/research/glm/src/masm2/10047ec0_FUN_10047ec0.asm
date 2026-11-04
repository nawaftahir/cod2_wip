.686
.MODEL FLAT, C
EXTRN sub_10047AAD:PROC
EXTRN sub_10047B16:PROC
EXTRN sub_10047B25:PROC
EXTRN sub_10047C3B:PROC
EXTRN sub_10047C81:PROC
EXTRN sub_10047D2E:PROC
EXTRN sub_100480B3:PROC
EXTRN sub_100480C6:PROC
EXTRN sub_100480E3:PROC
EXTRN sub_100480EB:PROC
EXTRN sub_100480F1:PROC
EXTRN sub_10048107:PROC
EXTRN sub_1004810F:PROC
EXTRN sub_1004811F:PROC
EXTRN sub_1004812D:PROC
EXTRN sub_10048173:PROC
EXTRN sub_1004819A:PROC
EXTRN sub_10048225:PROC
EXTRN sub_10048235:PROC
EXTRN sub_1004828B:PROC
EXTRN sub_1004828F:PROC
.CODE
FUN_10047ec0 PROC
    sub sub esp, 16
    push push ebx
    mov mov ebx, dword ptr [esp + 24]
    mov mov ecx, dword ptr [ebx + 32]
    mov mov eax, dword ptr [ebx + 0140h]
    mov mov edx, dword ptr [ecx]
    push push esi
    mov mov esi, dword ptr [ebx + 0164h]
    push push edi
    mov mov edi, dword ptr [ebx + 0138h]
    mov mov dword ptr [esi + 16], edx
    mov mov dword ptr [esp + 12], eax
    mov mov eax, dword ptr [ebx + 32]
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [esi + 20], ecx
    mov mov eax, dword ptr [ebx + 0C4h]
    test test eax, eax
    mov mov dword ptr [esp + 24], edi
    je L0
    mov mov eax, dword ptr [esi + 68]
    test test eax, eax
    jne L1
    mov mov edx, dword ptr [esi + 72]
    push push edx
    mov mov eax, esi
    call sub_10047C81
    add add esp, 4
    mov mov eax, dword ptr [esp + 36]
    mov mov edx, dword ptr [ebx + 0134h]
    mov mov ecx, dword ptr [eax]
    push push ebp
    xor xor ebp, ebp
    cmp cmp edx, edi
    mov mov dword ptr [esp + 24], ecx
    mov mov dword ptr [esp + 20], edx
    jg sub_100480F1
    jmp L2
    lea lea esp, [esp]
    lea lea esp, [esp]
    mov mov eax, dword ptr [edx*4 + 010191200h]
    mov mov ecx, dword ptr [esp + 24]
    movsx movsx edi, word ptr [ecx + eax*2]
    test test edi, edi
    jne L3
L0:
    inc inc ebp
    jmp sub_100480EB
    mov mov ecx, dword ptr [esp + 16]
    jge L4
    neg neg edi
    sar sar edi, cl
    mov mov eax, edi
    not not eax
    mov mov dword ptr [esp + 40], eax
    jmp L5
    sar sar edi, cl
    mov mov dword ptr [esp + 40], edi
    test test edi, edi
    jne L6
    inc inc ebp
    jmp sub_1004810F
    mov mov eax, dword ptr [esi + 56]
    test test eax, eax
    jbe L7
    mov mov eax, esi
    call sub_10047C3B
    cmp cmp ebp, 15
    jle L9
    lea lea ebx, [ebp - 16]
    shr shr ebx, 4
    inc inc ebx
    mov mov edx, ebx
    neg neg edx
    shl shl edx, 4
    add add ebp, edx
    mov mov cl, byte ptr [esi + 12]
    test test cl, cl
    mov mov eax, dword ptr [esi + 52]
    je L8
    mov mov eax, dword ptr [esi + eax*4 + 92]
    inc inc dword ptr [eax + 03C0h]
    jmp sub_100480C6
    mov mov ecx, dword ptr [esi + eax*4 + 76]
    movsx movsx eax, byte ptr [ecx + 04F0h]
    mov mov ecx, dword ptr [ecx + 03C0h]
    push push ecx
    call sub_10047AAD
    add add esp, 4
    dec dec ebx
    jne sub_100480B3
    sar sar edi, 1
    test test edi, edi
    mov mov ebx, 1
    je sub_1004811F
    mov mov edi, edi
    sar sar edi, 1
    inc inc ebx
    test test edi, edi
    jne sub_10048107
    cmp cmp ebx, 10
    jle sub_1004812D
L3:
    mov mov eax, dword ptr [esp + 36]
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [edx + 20], 6
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx]
    add add esp, 4
    mov mov dl, byte ptr [esi + 12]
    mov mov eax, dword ptr [esi + 52]
    shl shl ebp, 4
    add add ebp, ebx
L4:
    test test dl, dl
    mov mov ecx, ebp
    je sub_10048173
    mov mov edx, dword ptr [esi + eax*4 + 92]
    mov mov eax, dword ptr [edx + ecx*4]
    lea lea ecx, [edx + ecx*4]
    inc inc eax
    mov mov dword ptr [ecx], eax
    jmp sub_1004819A
    mov mov edx, dword ptr [esi + eax*4 + 76]
    movsx movsx eax, byte ptr [edx + ecx + 0400h]
    mov mov ecx, dword ptr [edx + ecx*4]
    push push ecx
    call sub_10047B16
    add add esp, 4
    mov mov edx, dword ptr [esp + 40]
    push push edx
    mov mov eax, ebx
    call sub_10047B25
    mov mov ebx, dword ptr [esp + 40]
    mov mov edx, dword ptr [esp + 24]
    add add esp, 4
    xor xor ebp, ebp
    mov mov eax, dword ptr [esp + 28]
    inc inc edx
    cmp cmp edx, eax
    mov mov dword ptr [esp + 20], edx
    jle sub_100480E3
    test test ebp, ebp
    jle sub_10048225
    mov mov ecx, dword ptr [esi + 56]
    inc inc ecx
    mov mov eax, ecx
    cmp cmp eax, 07FFFh
    mov mov dword ptr [esi + 56], ecx
    jne sub_10048235
    mov mov eax, esi
    call sub_10047D2E
    mov mov eax, dword ptr [ebx + 32]
    mov mov ecx, dword ptr [esi + 16]
    mov mov dword ptr [eax], ecx
    mov mov edx, dword ptr [ebx + 32]
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [edx + 4], eax
    mov mov ebx, dword ptr [ebx + 0C4h]
    test test ebx, ebx
    pop pop ebp
    je sub_1004828B
    mov mov eax, dword ptr [esi + 68]
    test test eax, eax
    jne sub_1004828F
    mov mov ecx, dword ptr [esi + 72]
    inc inc ecx
    and and ecx, 7
    mov mov dword ptr [esi + 68], ebx
    mov mov dword ptr [esi + 72], ecx
FUN_10047ec0 ENDP
END
