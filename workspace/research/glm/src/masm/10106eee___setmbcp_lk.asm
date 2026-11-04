.686
.MODEL FLAT, C
EXTRN sub_10100EDB:PROC
EXTRN sub_10106D9C:PROC
EXTRN sub_10106DE6:PROC
EXTRN sub_10106E41:PROC
EXTRN sub_10106E6F:PROC
EXTRN fp_1010C188:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_101AE1D8:DWORD
EXTRN g_1076AA30:DWORD
EXTRN g_1076AA38:DWORD
EXTRN g_1076AB44:DWORD
.CODE
__setmbcp_lk PROC
    push ebp
    mov ebp, esp
    sub esp, 28
    mov eax, dword ptr [g_101A50D0]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    xor ebx, ebx
    cmp esi, ebx
    mov dword ptr [ebp - 4], eax
    push edi
    je L16
    xor edx, edx
    xor eax, eax
L0:
    cmp dword ptr [eax + 0101A54C8h], esi
    je L2
    add eax, 48
    inc edx
    cmp eax, 0000000F0h
    jb L0
    lea eax, [ebp - 24]
    push eax
    push esi
    call dword ptr [fp_1010C188]
    cmp eax, 1
    jne L15
    push 64
    xor eax, eax
    cmp dword ptr [ebp - 24], 1
    pop ecx
    mov edi, 01076AA40h
    rep stosd dword ptr es:[edi], eax
    stosb byte ptr es:[edi], al
    mov dword ptr [g_1076AB44], esi
    mov dword ptr [g_1076AA30], ebx
    jbe L13
    cmp byte ptr [ebp - 18], 0
    je L11
    lea ecx, [ebp - 17]
L1:
    mov dl, byte ptr [ecx]
    test dl, dl
    je L11
    movzx eax, byte ptr [ecx - 1]
    movzx edx, dl
    jmp L10
L2:
    push 64
    xor eax, eax
    pop ecx
    mov edi, 01076AA40h
    rep stosd dword ptr es:[edi], eax
    lea ecx, [edx + edx*2]
    shl ecx, 4
    mov dword ptr [ebp - 28], ebx
    stosb byte ptr es:[edi], al
    lea ebx, [ecx + 0101A54D8h]
L3:
    mov al, byte ptr [ebx]
    mov esi, ebx
    jmp L7
L4:
    mov dl, byte ptr [esi + 1]
    test dl, dl
    je L8
    movzx eax, al
    movzx edi, dl
    cmp eax, edi
    ja L6
    mov edx, dword ptr [ebp - 28]
    mov dl, byte ptr [edx + 0101A54C0h]
L5:
    or byte ptr [eax + 01076AA41h], dl
    inc eax
    cmp eax, edi
    jbe L5
L6:
    inc esi
    inc esi
    mov al, byte ptr [esi]
L7:
    test al, al
    jne L4
L8:
    inc dword ptr [ebp - 28]
    add ebx, 8
    cmp dword ptr [ebp - 28], 4
    jb L3
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [g_1076AB44], eax
    mov dword ptr [g_1076AA38], 1
    call sub_10106D9C
    lea ecx, [ecx + 0101A54CCh]
    mov esi, ecx
    mov edi, 01076AB50h
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [g_1076AA30], eax
    movsd dword ptr es:[edi], dword ptr [esi]
    jmp L17
L9:
    or byte ptr [eax + 01076AA41h], 4
    inc eax
L10:
    cmp eax, edx
    jbe L9
    inc ecx
    inc ecx
    cmp byte ptr [ecx - 1], 0
    jne L1
L11:
    xor ecx, ecx
    inc ecx
    mov eax, ecx
L12:
    or byte ptr [eax + 01076AA41h], 8
    inc eax
    cmp eax, 0000000FFh
    jb L12
    mov eax, esi
    call sub_10106DE6
    mov dword ptr [g_1076AA30], eax
    mov dword ptr [g_1076AA38], ecx
    jmp L14
L13:
    mov dword ptr [g_1076AA38], ebx
L14:
    xor eax, eax
    mov edi, 01076AB50h
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    jmp L17
L15:
    cmp dword ptr [g_101AE1D8], ebx
    je L18
L16:
    call sub_10106E41
L17:
    call sub_10106E6F
    xor eax, eax
    jmp L19
L18:
    or eax, 0FFFFFFFFh
L19:
    mov ecx, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    call sub_10100EDB
    leave
    ret
__setmbcp_lk ENDP
END
