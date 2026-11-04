.686
.MODEL FLAT, C
EXTRN sub_10100EDB:PROC
EXTRN sub_10106D9C:PROC
EXTRN sub_10106DE6:PROC
EXTRN sub_10106E41:PROC
EXTRN sub_10106E6F:PROC
EXTRN sub_1010707E:PROC
EXTRN sub_10107083:PROC
EXTRN sub_10107084:PROC
EXTRN sub_10107086:PROC
EXTRN sub_1010708F:PROC
EXTRN sub_10107094:PROC
EXTRN sub_10107097:PROC
EXTRN sub_1010709D:PROC
EXTRN sub_101070A1:PROC
EXTRN sub_101070B2:PROC
EXTRN sub_1010712A:PROC
EXTRN sub_10107167:PROC
EXTRN sub_1010717D:PROC
EXTRN sub_101071A4:PROC
EXTRN sub_101071CF:PROC
EXTRN sub_101071E0:PROC
EXTRN sub_101071F1:PROC
EXTRN EXTRN fp_1010C188:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_101AE1D8:DWORD:DWORD
EXTRN EXTRN g_1076AA30:DWORD:DWORD
EXTRN EXTRN g_1076AA38:DWORD:DWORD
EXTRN EXTRN g_1076AB44:DWORD:DWORD
.CODE
__setmbcp_lk PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 28
    mov mov eax, dword ptr [g_101A50D0]
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    xor xor ebx, ebx
    cmp cmp esi, ebx
    mov mov dword ptr [ebp - 4], eax
    push push edi
    je sub_1010707E
    xor xor edx, edx
    xor xor eax, eax
    cmp cmp dword ptr [eax + 0101A54C8h], esi
    je L1
    add add eax, 48
    inc inc edx
    cmp cmp eax, 0F0h
    jb L0
    lea lea eax, [ebp - 24]
    push push eax
    push push esi
    call dword ptr [fp_1010C188]
    cmp cmp eax, 1
    jne sub_101070A1
    push push 64
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 24], 1
    pop pop ecx
    mov mov edi, 01076AA40h
L0:
    rep stosd rep stosd dword ptr es:[edi], eax
    stosb stosb byte ptr es:[edi], al
    mov mov dword ptr [g_1076AB44], esi
    mov mov dword ptr [g_1076AA30], ebx
    jbe sub_101070B2
    cmp cmp byte ptr [ebp - 18], 0
    je sub_10107094
    lea lea ecx, [ebp - 17]
    mov mov dl, byte ptr [ecx]
    test test dl, dl
    je sub_101070A1
    movzx movzx eax, byte ptr [ecx - 1]
    movzx movzx edx, dl
    jmp sub_1010709D
    push push 64
    xor xor eax, eax
    pop pop ecx
    mov mov edi, 01076AA40h
    rep stosd rep stosd dword ptr es:[edi], eax
    lea lea ecx, [edx + edx*2]
    shl shl ecx, 4
    mov mov dword ptr [ebp - 28], ebx
    stosb stosb byte ptr es:[edi], al
    lea lea ebx, [ecx + 0101A54D8h]
    mov mov al, byte ptr [ebx]
    mov mov esi, ebx
    jmp L2
    mov mov dl, byte ptr [esi + 1]
    test test dl, dl
    je sub_10107084
    movzx movzx eax, al
    movzx movzx edi, dl
    cmp cmp eax, edi
    ja sub_10107086
    mov mov edx, dword ptr [ebp - 28]
    mov mov dl, byte ptr [edx + 0101A54C0h]
    or or byte ptr [eax + 01076AA41h], dl
    inc inc eax
    cmp cmp eax, edi
    jbe sub_1010708F
    inc inc esi
    inc inc esi
    mov mov al, byte ptr [esi]
    test test al, al
    jne L3
    inc inc dword ptr [ebp - 28]
    add add ebx, 8
    cmp cmp dword ptr [ebp - 28], 4
    jb sub_10107083
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [g_1076AB44], eax
    mov mov dword ptr [g_1076AA38], 1
    call sub_10106D9C
    lea lea ecx, [ecx + 0101A54CCh]
    mov mov esi, ecx
    mov mov edi, 01076AB50h
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    mov mov dword ptr [g_1076AA30], eax
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    jmp sub_1010717D
    or or byte ptr [eax + 01076AA41h], 4
    inc inc eax
    cmp cmp eax, edx
    jbe sub_1010712A
    inc inc ecx
    inc inc ecx
    cmp cmp byte ptr [ecx - 1], 0
    jne sub_10107097
    xor xor ecx, ecx
    inc inc ecx
    mov mov eax, ecx
    or or byte ptr [eax + 01076AA41h], 8
    inc inc eax
    cmp cmp eax, 0FFh
    jb sub_10107167
    mov mov eax, esi
    call sub_10106DE6
    mov mov dword ptr [g_1076AA30], eax
    mov mov dword ptr [g_1076AA38], ecx
    jmp sub_101071A4
    mov mov dword ptr [g_1076AA38], ebx
    xor xor eax, eax
    mov mov edi, 01076AB50h
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    jmp sub_101071CF
    cmp cmp dword ptr [g_101AE1D8], ebx
    je sub_101071E0
    call sub_10106E41
    call sub_10106E6F
    xor xor eax, eax
    jmp sub_101071F1
    or or eax, -1
    mov mov ecx, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    call sub_10100EDB
    leave leave
L3:
    ret ret
__setmbcp_lk ENDP
END
