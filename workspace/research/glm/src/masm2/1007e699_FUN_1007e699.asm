.686
.MODEL FLAT, C
EXTRN sub_1007E959:PROC
EXTRN sub_1007E970:PROC
EXTRN sub_1007E97E:PROC
EXTRN sub_1007E98F:PROC
EXTRN sub_1007E99F:PROC
EXTRN sub_1007E9A2:PROC
EXTRN sub_1007E9CF:PROC
EXTRN sub_1007E9D5:PROC
EXTRN sub_1007E9E7:PROC
EXTRN sub_1007E9FB:PROC
EXTRN sub_1007EA22:PROC
EXTRN sub_1007EA98:PROC
EXTRN sub_1007EAB9:PROC
EXTRN sub_1007EADC:PROC
EXTRN sub_1007EAF5:PROC
EXTRN sub_1007EAF8:PROC
EXTRN sub_1007EB01:PROC
EXTRN sub_1007EB3A:PROC
EXTRN sub_1007EB42:PROC
EXTRN sub_1007EB91:PROC
EXTRN sub_1007EBC7:PROC
.CODE
FUN_1007e699 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [edi + 32]
    mov mov esi, dword ptr [edi + 24]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 4], eax
    movzx movzx eax, word ptr [esi]
    xor xor ecx, ecx
    sub sub eax, ecx
    je L7
    dec dec eax
    je L6
    dec dec eax
    je L5
    dec dec eax
    je L3
    dec dec eax
    dec dec eax
    je L0
    mov mov eax, 080004001h
    jmp sub_1007E97E
    mov mov eax, dword ptr [ebp + 20]
    xor xor edx, edx
    div div dword ptr [edi + 52]
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jbe L2
    mov mov dword ptr [ebp + 20], eax
    cmp cmp dword ptr [ebp + 20], ecx
    mov mov dword ptr [ebp + 8], ecx
    jbe sub_1007E99F
    and and dword ptr [ebp + 16], 0
    cmp cmp word ptr [esi + 10], 0
    jbe L4
    push push dword ptr [ebp + 24]
    mov mov eax, dword ptr [edi + 56]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov ebx, dword ptr [eax + ecx*4]
    push push dword ptr [ebx + 48]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 12]
L0:
    push push edi
    call L1
L1:
    test test eax, eax
    jl sub_1007E9CF
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebx + 48]
    lea lea eax, [ecx + eax*4]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebx + 40]
    add add dword ptr [ebp + 24], eax
    movzx movzx eax, word ptr [esi + 10]
    inc inc dword ptr [ebp + 16]
    cmp cmp dword ptr [ebp + 16], eax
    jb L4
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [ebp + 20]
L2:
    jb L4
    jmp sub_1007E9FB
    movzx movzx ecx, word ptr [esi + 4]
    movzx movzx eax, word ptr [esi + 6]
    mov mov ebx, ecx
    imul imul ebx, eax
    mov mov eax, dword ptr [ebp + 20]
    xor xor edx, edx
    div div ebx
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jbe L8
    mov mov dword ptr [ebp + 20], eax
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [ebp + 20], 0
    mov mov edx, dword ptr [ebp - 8]
    jbe L10
    movzx movzx eax, word ptr [esi + 6]
    and and dword ptr [ebp - 4], 0
    test test eax, eax
    jbe L11
    xor xor eax, eax
    test test ecx, ecx
    jbe L9
    imul imul ecx, dword ptr [ebp - 12]
    movzx movzx ebx, word ptr [esi + 6]
    add add ecx, eax
    imul imul ecx, ebx
    add add ecx, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebx + ecx*4]
    mov mov dword ptr [edx], ecx
    movzx movzx ecx, word ptr [esi + 4]
    add add edx, 4
    inc inc eax
    cmp cmp eax, ecx
    jb L9
    movzx movzx eax, word ptr [esi + 6]
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], eax
    jb L11
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebp + 20]
    jb L10
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], eax
    jmp sub_1007E970
    movzx movzx ecx, word ptr [esi + 6]
    movzx movzx eax, word ptr [esi + 4]
    imul imul ecx, eax
    jmp sub_1007E959
    movzx movzx ecx, word ptr [esi + 6]
    mov mov eax, dword ptr [ebp + 20]
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jmp sub_1007E98F
    movzx movzx eax, word ptr [esi + 8]
    mov mov ecx, dword ptr [ebp + 20]
    mov mov dword ptr [ebp + 20], ecx
    cmp cmp ecx, eax
    jbe sub_1007E9A2
    mov mov dword ptr [ebp + 20], eax
    mov mov cx, word ptr [edi + 8]
    test test cx, cx
    je sub_1007EA98
    cmp cmp word ptr [esi], 3
    je sub_1007E9D5
    movzx movzx ebx, word ptr [esi + 6]
    movzx movzx eax, word ptr [esi + 4]
    jmp sub_1007E9E7
    movzx movzx ebx, word ptr [esi + 4]
    movzx movzx eax, word ptr [esi + 6]
    test test bl, 3
    je sub_1007EAB9
    cmp cmp cx, 1
    mov mov dword ptr [ebp - 16], 01010FDECh
    je sub_1007EA22
    mov mov dword ptr [ebp - 16], 01010FDDCh
    imul imul eax, dword ptr [ebp + 20]
    lea lea esi, [ebx + 3]
    and and esi, -4
    test test eax, eax
    mov mov dword ptr [ebp + 16], eax
    jbe sub_1007EADC
    mov mov edi, dword ptr [ebp - 8]
    lea lea edx, [eax*4 + 4]
    imul imul eax, esi
    mov mov ecx, edx
    imul imul edx, esi
    imul imul ecx, ebx
    add add ecx, dword ptr [ebp - 4]
    add add eax, ebx
    add add edx, edi
    mov mov dword ptr [ebp - 12], edx
    mov mov edx, dword ptr [ebp + 16]
    lea lea eax, [edi + eax*4]
    mov mov dword ptr [ebp - 20], edx
    mov mov edi, esi
    shl shl edi, 2
    sub sub dword ptr [ebp - 12], edi
    mov mov edx, ebx
    shl shl edx, 2
    sub sub eax, edi
    sub sub ecx, edx
    cmp cmp esi, ebx
    mov mov dword ptr [ebp + 16], esi
    jbe sub_1007EAF5
    mov mov edx, dword ptr [ebp - 12]
    dec dec dword ptr [ebp + 16]
    mov mov edi, dword ptr [ebp - 16]
    sub sub edx, 4
    mov mov dword ptr [ebp - 4], edx
    mov mov edx, dword ptr [ebp + 16]
    and and edx, 3
    cmp cmp dword ptr [ebp + 16], ebx
    mov mov edi, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [edx], edi
    ja sub_1007EAF8
    test test ebx, ebx
    jbe sub_1007EB3A
    mov mov edx, eax
L10:
    mov mov dword ptr [ebp + 16], ecx
    mov mov dword ptr [ebp - 4], ebx
    sub sub dword ptr [ebp + 16], 4
    mov mov edi, dword ptr [ebp + 16]
    mov mov edi, dword ptr [edi]
    sub sub edx, 4
    dec dec dword ptr [ebp - 4]
    mov mov dword ptr [edx], edi
    jne sub_1007EB42
    dec dec dword ptr [ebp - 20]
    jne sub_1007EB01
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [edi + 44]
    imul imul eax, dword ptr [ebp + 20]
    movzx movzx ecx, word ptr [edi + 12]
    cmp cmp eax, ecx
    jbe sub_1007EB91
    mov mov eax, ecx
    push push eax
    push push dword ptr [ebp - 8]
    movzx movzx eax, word ptr [edi + 10]
    push push dword ptr [ebp - 4]
    add add eax, dword ptr [ebp + 24]
    push push eax
    push push dword ptr [ebp + 12]
    call call dword ptr [edi + 28]
    test test eax, eax
    jl sub_1007EBC7
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_1007e699 ENDP
END
