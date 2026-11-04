.686
.MODEL FLAT, C
EXTRN sub_10062DE4:PROC
EXTRN sub_1007DAFB:PROC
EXTRN sub_1008097C:PROC
EXTRN sub_1008104F:PROC
EXTRN sub_10081054:PROC
EXTRN sub_10081071:PROC
EXTRN sub_10081080:PROC
EXTRN sub_10081085:PROC
EXTRN sub_1008108D:PROC
EXTRN sub_10081099:PROC
EXTRN sub_100810C3:PROC
EXTRN sub_100810E3:PROC
EXTRN sub_10081175:PROC
EXTRN sub_100811F1:PROC
EXTRN sub_100811F7:PROC
EXTRN sub_100811F8:PROC
EXTRN sub_100811FC:PROC
EXTRN sub_10081205:PROC
EXTRN sub_10081235:PROC
EXTRN sub_10082021:PROC
EXTRN sub_100F78B9:PROC
EXTRN sub_100F7902:PROC
EXTRN sub_100F79D2:PROC
.CODE
FUN_10080e37 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    cmp cmp dword ptr [ebp + 8], 0
    push push ebx
    mov mov ebx, ecx
    jne L0
    mov mov eax, 08876086Ch
    jmp sub_10081054
    push push esi
    lea lea esi, [ebx + 12]
    push push esi
    lea lea eax, [ebp - 8]
    push push eax
    push push 042415443h
    push push dword ptr [ebp + 8]
L0:
    call sub_10062DE4
    test test eax, eax
    jl sub_10081071
    cmp cmp eax, 1
    jne L1
    mov mov eax, 088760B59h
    jmp sub_10081080
    push push dword ptr [esi]
    call sub_100F78B9
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebx + 8], eax
    jne L2
    mov mov eax, 08007000Eh
    jmp sub_10081099
    mov mov ecx, dword ptr [esi]
    mov mov esi, dword ptr [ebp - 8]
    push push edi
    mov mov edi, eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebx + 8]
    mov mov dword ptr [ebx + 16], eax
    cmp cmp dword ptr [eax], 28
    jae L3
    mov mov eax, 088760B59h
    jmp sub_100810C3
    mov mov eax, dword ptr [eax + 12]
    shl shl eax, 2
    push push eax
    call sub_100F7902
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebx + 20], edi
    jne L4
    mov mov eax, 08007000Eh
    jmp sub_100810E3
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [eax + 12]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [eax + 12]
    mov mov dword ptr [ebx + 24], ecx
    mov mov ecx, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + 12]
    lea lea eax, [eax + eax*4]
    lea lea eax, [ecx + eax*4]
    cmp cmp eax, dword ptr [ebx + 12]
    ja L5
    mov mov esi, dword ptr [ebx + 8]
    and and dword ptr [ebp + 8], 0
    add add esi, ecx
    xor xor edi, edi
    cmp cmp dword ptr [ebx + 24], edi
    mov mov dword ptr [ebp - 12], esi
    jbe sub_10081085
    lea lea ecx, [esi + 12]
    mov mov dword ptr [ebp - 4], ecx
    jmp L8
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [ecx]
    lea lea eax, [edx + 16]
    cmp cmp eax, dword ptr [ebx + 12]
    ja L6
    mov mov eax, dword ptr [ebx + 8]
L3:
    push push 0
    add add eax, edx
    push push eax
    add add ecx, -12
    push push ecx
    push push ebx
    call sub_1008097C
    mov mov ecx, dword ptr [ebx + 20]
    mov mov dword ptr [ecx + edi*4], eax
    mov mov eax, dword ptr [ebx + 20]
    lea lea eax, [eax + edi*4]
    cmp cmp dword ptr [eax], 0
    je L7
    mov mov eax, dword ptr [eax]
    mov mov cx, word ptr [eax + 8]
    mov mov edx, dword ptr [eax + 24]
    movzx movzx edx, word ptr [edx + 8]
    neg neg cx
    sbb sbb ecx, ecx
    and and ecx, 3
    add add dword ptr [ebp - 4], 20
    inc inc ecx
    imul imul ecx, edx
    imul imul ecx, dword ptr [eax + 44]
    add add dword ptr [ebp + 8], ecx
    inc inc edi
    cmp cmp edi, dword ptr [ebx + 24]
    jb sub_1008108D
    mov mov eax, dword ptr [ebp + 8]
    shl shl eax, 2
    push push eax
    call sub_100F79D2
    xor xor edi, edi
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebx + 28], eax
    je sub_1008104F
    cmp cmp dword ptr [ebx + 24], edi
    mov mov dword ptr [ebp + 8], edi
    jbe sub_10081175
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ebx + 28]
    mov mov edx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx + edi*4]
    lea lea eax, [eax + edx*4]
L6:
    push push eax
    call sub_1007DAFB
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + edi*4]
    mov mov dx, word ptr [eax + 8]
    mov mov esi, dword ptr [eax + 24]
    movzx movzx esi, word ptr [esi + 8]
    neg neg dx
    sbb sbb edx, edx
    and and edx, 3
    inc inc edx
    imul imul edx, esi
    imul imul edx, dword ptr [eax + 44]
    add add dword ptr [ebp + 8], edx
    inc inc edi
    cmp cmp edi, dword ptr [ebx + 24]
    jb sub_10081175
    mov mov esi, dword ptr [ebp - 12]
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 12], ecx
    je sub_100811FC
    cmp cmp dword ptr [ebx + 24], ecx
    jbe sub_100811F1
    mov mov ebx, dword ptr [ebx + 24]
    lea lea eax, [esi + 8]
    cmp cmp word ptr [eax - 4], 2
    jne sub_100811F8
    movzx movzx edx, word ptr [eax - 2]
    movzx movzx esi, word ptr [eax]
    add add edx, esi
    cmp cmp ecx, edx
    jae sub_10081205
    mov mov ecx, edx
    add add eax, 20
    dec dec ebx
    jne sub_100811F7
    push push dword ptr [ebp + 12]
    shl shl ecx, 4
    push push ecx
    call sub_10082021
    test test eax, eax
    jl sub_10081235
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_10080e37 ENDP
END
