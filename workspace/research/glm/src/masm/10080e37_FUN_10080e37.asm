.686
.MODEL FLAT, C
EXTRN sub_10062DE4:PROC
EXTRN sub_1007DAFB:PROC
EXTRN sub_1008097C:PROC
EXTRN sub_10082021:PROC
EXTRN sub_100F78B9:PROC
EXTRN sub_100F7902:PROC
EXTRN sub_100F79D2:PROC
.CODE
FUN_10080e37 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    cmp dword ptr [ebp + 8], 0
    push ebx
    mov ebx, ecx
    jne L0
    mov eax, 08876086Ch
    jmp L18
L0:
    push esi
    lea esi, [ebx + 12]
    push esi
    lea eax, [ebp - 8]
    push eax
    push 042415443h
    push dword ptr [ebp + 8]
    call sub_10062DE4
    test eax, eax
    jl L17
    cmp eax, 1
    jne L1
    mov eax, 088760B59h
    jmp L17
L1:
    push dword ptr [esi]
    call sub_100F78B9
    test eax, eax
    pop ecx
    mov dword ptr [ebx + 8], eax
    jne L2
    mov eax, 08007000Eh
    jmp L17
L2:
    mov ecx, dword ptr [esi]
    mov esi, dword ptr [ebp - 8]
    push edi
    mov edi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebx + 8]
    mov dword ptr [ebx + 16], eax
    cmp dword ptr [eax], 28
    jae L4
L3:
    mov eax, 088760B59h
    jmp L16
L4:
    mov eax, dword ptr [eax + 12]
    shl eax, 2
    push eax
    call sub_100F7902
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebx + 20], edi
    jne L6
L5:
    mov eax, 08007000Eh
    jmp L16
L6:
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [eax + 12]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [ebx + 24], ecx
    mov ecx, dword ptr [eax + 16]
    mov eax, dword ptr [eax + 12]
    lea eax, [eax + eax*4]
    lea eax, [ecx + eax*4]
    cmp eax, dword ptr [ebx + 12]
    ja L3
    mov esi, dword ptr [ebx + 8]
    and dword ptr [ebp + 8], 0
    add esi, ecx
    xor edi, edi
    cmp dword ptr [ebx + 24], edi
    mov dword ptr [ebp - 12], esi
    jbe L9
    lea ecx, [esi + 12]
    mov dword ptr [ebp - 4], ecx
    jmp L8
L7:
    mov ecx, dword ptr [ebp - 4]
L8:
    mov edx, dword ptr [ecx]
    lea eax, [edx + 16]
    cmp eax, dword ptr [ebx + 12]
    ja L3
    mov eax, dword ptr [ebx + 8]
    push 0
    add eax, edx
    push eax
    add ecx, -12
    push ecx
    push ebx
    call sub_1008097C
    mov ecx, dword ptr [ebx + 20]
    mov dword ptr [ecx + edi*4], eax
    mov eax, dword ptr [ebx + 20]
    lea eax, [eax + edi*4]
    cmp dword ptr [eax], 0
    je L5
    mov eax, dword ptr [eax]
    mov cx, word ptr [eax + 8]
    mov edx, dword ptr [eax + 24]
    movzx edx, word ptr [edx + 8]
    neg cx
    sbb ecx, ecx
    and ecx, 3
    add dword ptr [ebp - 4], 20
    inc ecx
    imul ecx, edx
    imul ecx, dword ptr [eax + 44]
    add dword ptr [ebp + 8], ecx
    inc edi
    cmp edi, dword ptr [ebx + 24]
    jb L7
L9:
    mov eax, dword ptr [ebp + 8]
    shl eax, 2
    push eax
    call sub_100F79D2
    xor edi, edi
    cmp eax, edi
    pop ecx
    mov dword ptr [ebx + 28], eax
    je L5
    cmp dword ptr [ebx + 24], edi
    mov dword ptr [ebp + 8], edi
    jbe L11
    mov ecx, dword ptr [ebx + 20]
L10:
    mov eax, dword ptr [ebx + 28]
    mov edx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + edi*4]
    lea eax, [eax + edx*4]
    push eax
    call sub_1007DAFB
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + edi*4]
    mov dx, word ptr [eax + 8]
    mov esi, dword ptr [eax + 24]
    movzx esi, word ptr [esi + 8]
    neg dx
    sbb edx, edx
    and edx, 3
    inc edx
    imul edx, esi
    imul edx, dword ptr [eax + 44]
    add dword ptr [ebp + 8], edx
    inc edi
    cmp edi, dword ptr [ebx + 24]
    jb L10
    mov esi, dword ptr [ebp - 12]
L11:
    xor ecx, ecx
    cmp dword ptr [ebp + 12], ecx
    je L15
    cmp dword ptr [ebx + 24], ecx
    jbe L14
    mov ebx, dword ptr [ebx + 24]
    lea eax, [esi + 8]
L12:
    cmp word ptr [eax - 4], 2
    jne L13
    movzx edx, word ptr [eax - 2]
    movzx esi, word ptr [eax]
    add edx, esi
    cmp ecx, edx
    jae L13
    mov ecx, edx
L13:
    add eax, 20
    dec ebx
    jne L12
L14:
    push dword ptr [ebp + 12]
    shl ecx, 4
    push ecx
    call sub_10082021
    test eax, eax
    jl L16
L15:
    xor eax, eax
L16:
    pop edi
L17:
    pop esi
L18:
    pop ebx
    leave
    ret 8
FUN_10080e37 ENDP
END
