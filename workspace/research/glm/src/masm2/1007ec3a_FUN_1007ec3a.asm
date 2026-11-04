.686
.MODEL FLAT, C
EXTRN sub_1007EF32:PROC
EXTRN sub_1007EF45:PROC
EXTRN sub_1007EF75:PROC
EXTRN sub_1007EF94:PROC
EXTRN sub_1007EF98:PROC
EXTRN sub_1007EFA3:PROC
EXTRN sub_1007EFA8:PROC
EXTRN sub_1007EFB2:PROC
EXTRN sub_1007EFB5:PROC
EXTRN sub_1007EFB9:PROC
EXTRN sub_1007EFC8:PROC
EXTRN sub_1007EFCD:PROC
EXTRN sub_1007EFD1:PROC
EXTRN sub_1007EFD8:PROC
EXTRN sub_1007EFF4:PROC
EXTRN sub_1007F024:PROC
EXTRN sub_1007F036:PROC
EXTRN sub_1007F071:PROC
EXTRN sub_1007F0E7:PROC
EXTRN sub_1007F108:PROC
EXTRN sub_1007F12B:PROC
EXTRN sub_1007F144:PROC
EXTRN sub_1007F147:PROC
EXTRN sub_1007F150:PROC
EXTRN sub_1007F189:PROC
EXTRN sub_1007F191:PROC
EXTRN sub_1007F1E0:PROC
EXTRN sub_1007F216:PROC
.CODE
FUN_1007ec3a PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    mov mov eax, dword ptr [ebp + 16]
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov esi, dword ptr [edi + 24]
    mov mov ebx, dword ptr [edi + 32]
    mov mov dword ptr [ebp - 4], eax
    movzx movzx eax, word ptr [esi]
    sub sub eax, 0
    mov mov dword ptr [ebp - 8], ebx
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
    jmp sub_1007EF75
    mov mov eax, dword ptr [ebp + 20]
    xor xor edx, edx
    div div dword ptr [edi + 52]
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jbe L2
    mov mov dword ptr [ebp + 20], eax
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [ebp + 20], 0
    jbe sub_1007EF98
    and and dword ptr [ebp + 16], 0
    cmp cmp word ptr [esi + 10], 0
    jbe L4
    push push dword ptr [ebp + 24]
    mov mov eax, dword ptr [edi + 56]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov ebx, dword ptr [eax + ecx*4]
    push push dword ptr [ebx + 48]
    push push dword ptr [ebp - 4]
L0:
    push push dword ptr [ebp + 12]
    push push edi
    call L1
L1:
    test test eax, eax
    jl sub_1007EFC8
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
L2:
    cmp cmp eax, dword ptr [ebp + 20]
    jb L4
    jmp sub_1007EFF4
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
L3:
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
    mov mov ebx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], ebx
    jmp L13
    movzx movzx ecx, word ptr [esi + 6]
    movzx movzx eax, word ptr [esi + 4]
    imul imul ecx, eax
    jmp L12
    movzx movzx ecx, word ptr [esi + 6]
    mov mov eax, dword ptr [ebp + 20]
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jmp sub_1007EF32
    movzx movzx eax, word ptr [esi + 8]
    mov mov ecx, dword ptr [ebp + 20]
    mov mov dword ptr [ebp + 20], ecx
    cmp cmp ecx, eax
    jbe sub_1007EF45
    mov mov dword ptr [ebp + 20], eax
    mov mov cx, word ptr [esi + 2]
    cmp cmp cx, 2
L6:
    je sub_1007EFA8
    mov mov eax, dword ptr [edi + 52]
    imul imul eax, dword ptr [ebp + 20]
    movzx movzx ecx, cx
    dec dec ecx
    je sub_1007EF94
    dec dec ecx
L7:
    je sub_1007EFB2
    dec dec ecx
    jne sub_1007EFB5
    test test eax, eax
    jbe sub_1007EFB9
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, ebx
    sub sub edx, ebx
    fild fild dword ptr [edx + ecx]
    fstp fstp dword ptr [ecx]
    add add ecx, 4
    dec dec eax
    jne sub_1007EFA3
    jmp sub_1007EFCD
    test test eax, eax
    jbe sub_1007EFD1
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, ebx
    sub sub edx, ebx
    xor xor ebx, ebx
    cmp cmp dword ptr [ecx + edx], ebx
    setne setne bl
    mov mov dword ptr [ecx], ebx
    add add ecx, 4
    dec dec eax
    jne sub_1007EFD8
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], eax
L8:
    mov mov cx, word ptr [edi + 8]
    test test cx, cx
    je sub_1007F0E7
    cmp cmp word ptr [esi], 3
    je sub_1007F024
    movzx movzx ebx, word ptr [esi + 6]
    movzx movzx eax, word ptr [esi + 4]
    jmp sub_1007F036
    movzx movzx ebx, word ptr [esi + 4]
    movzx movzx eax, word ptr [esi + 6]
    test test bl, 3
    je sub_1007F108
    cmp cmp cx, 1
    mov mov dword ptr [ebp - 16], 01010FE2Ch
    je sub_1007F071
    mov mov dword ptr [ebp - 16], 01010FE1Ch
    imul imul eax, dword ptr [ebp + 20]
    lea lea esi, [ebx + 3]
    and and esi, -4
    test test eax, eax
    mov mov dword ptr [ebp + 16], eax
    jbe sub_1007F12B
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
    jbe sub_1007F144
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
    ja sub_1007F147
    test test ebx, ebx
    jbe sub_1007F189
    mov mov edx, eax
    mov mov dword ptr [ebp + 16], ecx
    mov mov dword ptr [ebp - 4], ebx
    sub sub dword ptr [ebp + 16], 4
    mov mov edi, dword ptr [ebp + 16]
    mov mov edi, dword ptr [edi]
    sub sub edx, 4
    dec dec dword ptr [ebp - 4]
    mov mov dword ptr [edx], edi
    jne sub_1007F191
    dec dec dword ptr [ebp - 20]
    jne sub_1007F150
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [edi + 44]
    imul imul eax, dword ptr [ebp + 20]
    movzx movzx ecx, word ptr [edi + 12]
    cmp cmp eax, ecx
    jbe sub_1007F1E0
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
    jl sub_1007F216
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_1007ec3a ENDP
END
