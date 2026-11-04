.686
.MODEL FLAT, C
EXTRN sub_1007EC45:PROC
EXTRN sub_1007EC80:PROC
EXTRN sub_1007ECA1:PROC
EXTRN sub_1007ECAA:PROC
EXTRN sub_1007ECAE:PROC
EXTRN sub_1007ECB0:PROC
EXTRN sub_1007ECB3:PROC
EXTRN sub_1007ECBA:PROC
EXTRN sub_1007ECC0:PROC
EXTRN sub_1007ECC4:PROC
EXTRN sub_1007ECD3:PROC
EXTRN sub_1007ECE2:PROC
EXTRN sub_1007ECE6:PROC
EXTRN sub_1007ECEE:PROC
EXTRN sub_1007ECFF:PROC
EXTRN sub_1007ED3A:PROC
EXTRN sub_1007ED4C:PROC
EXTRN sub_1007ED87:PROC
EXTRN sub_1007EDFD:PROC
EXTRN sub_1007EE1E:PROC
EXTRN sub_1007EE41:PROC
EXTRN sub_1007EE5A:PROC
EXTRN sub_1007EE5D:PROC
EXTRN sub_1007EE66:PROC
EXTRN sub_1007EE9F:PROC
EXTRN sub_1007EEA7:PROC
EXTRN sub_1007EEF6:PROC
EXTRN sub_1007EF2C:PROC
.CODE
FUN_1007e938 PROC
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
    je L8
    dec dec eax
    je L7
    dec dec eax
    je L6
    dec dec eax
    je L4
    dec dec eax
    dec dec eax
    je L0
    mov mov eax, 080004001h
    jmp sub_1007EC80
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
    jbe sub_1007ECA1
    jmp L3
    xor xor ecx, ecx
    cmp cmp word ptr [esi + 10], cx
    mov mov dword ptr [ebp + 16], ecx
    jbe L5
    push push dword ptr [ebp + 24]
    mov mov eax, dword ptr [edi + 56]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov ebx, dword ptr [eax + ecx*4]
    push push dword ptr [ebx + 48]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 12]
    push push edi
    call L1
L1:
    test test eax, eax
    jl sub_1007ECD3
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebx + 48]
    lea lea eax, [ecx + eax*4]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebx + 40]
    add add dword ptr [ebp + 24], eax
    movzx movzx eax, word ptr [esi + 10]
    inc inc dword ptr [ebp + 16]
    cmp cmp dword ptr [ebp + 16], eax
    jb L5
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [ebp + 20]
    jb L5
    jmp sub_1007ECFF
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
    jbe L9
    mov mov dword ptr [ebp + 20], eax
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [ebp + 20], 0
    mov mov edx, dword ptr [ebp - 8]
    jbe L11
    movzx movzx eax, word ptr [esi + 6]
    and and dword ptr [ebp - 4], 0
    test test eax, eax
    jbe L12
    xor xor eax, eax
    test test ecx, ecx
    jbe L10
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
    jb L10
    movzx movzx eax, word ptr [esi + 6]
    inc inc dword ptr [ebp - 4]
L5:
    cmp cmp dword ptr [ebp - 4], eax
    jb L12
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebp + 20]
    jb L11
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], eax
    jmp L14
    movzx movzx ecx, word ptr [esi + 6]
    movzx movzx eax, word ptr [esi + 4]
    imul imul ecx, eax
    jmp L13
    movzx movzx ecx, word ptr [esi + 6]
    mov mov eax, dword ptr [ebp + 20]
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jmp L15
    movzx movzx eax, word ptr [esi + 8]
    mov mov ecx, dword ptr [ebp + 20]
    mov mov dword ptr [ebp + 20], ecx
    cmp cmp ecx, eax
    jbe sub_1007EC45
    mov mov dword ptr [ebp + 20], eax
    mov mov cx, word ptr [esi + 2]
    cmp cmp cx, 1
    je sub_1007ECB3
    mov mov eax, dword ptr [edi + 52]
    imul imul eax, dword ptr [ebp + 20]
    movzx movzx ecx, cx
    dec dec ecx
    je sub_1007ECBA
    dec dec ecx
    je sub_1007ECA1
    dec dec ecx
    jne sub_1007ECC0
    test test eax, eax
    jbe sub_1007ECC4
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 4]
    sub sub edx, ecx
    cmp cmp dword ptr [edx + ecx], 0
    je sub_1007ECAA
    fld1 fld1
    jmp sub_1007ECB0
    fldz fldz
    fstp fstp dword ptr [ecx]
    add add ecx, 4
    dec dec eax
    jne sub_1007ECAE
    jmp sub_1007ECE2
    test test eax, eax
    jbe sub_1007ECE6
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 4]
    sub sub edx, ecx
    xor xor ebx, ebx
    cmp cmp dword ptr [ecx + edx], ebx
    setne setne bl
    mov mov dword ptr [ecx], ebx
    add add ecx, 4
    dec dec eax
    jne sub_1007ECEE
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], eax
    mov mov cx, word ptr [edi + 8]
    test test cx, cx
    je sub_1007EDFD
    cmp cmp word ptr [esi], 3
    je sub_1007ED3A
    movzx movzx ebx, word ptr [esi + 6]
    movzx movzx eax, word ptr [esi + 4]
    jmp sub_1007ED4C
    movzx movzx ebx, word ptr [esi + 4]
    movzx movzx eax, word ptr [esi + 6]
    test test bl, 3
    je sub_1007EE1E
    cmp cmp cx, 1
    mov mov dword ptr [ebp - 16], 01010FE0Ch
    je sub_1007ED87
    mov mov dword ptr [ebp - 16], 01010FDFCh
    imul imul eax, dword ptr [ebp + 20]
    lea lea esi, [ebx + 3]
    and and esi, -4
    test test eax, eax
    mov mov dword ptr [ebp + 16], eax
    jbe sub_1007EE41
    mov mov edi, dword ptr [ebp - 8]
    lea lea edx, [eax*4 + 4]
L12:
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
    jbe sub_1007EE5A
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
    ja sub_1007EE5D
    test test ebx, ebx
    jbe sub_1007EE9F
    mov mov edx, eax
    mov mov dword ptr [ebp + 16], ecx
    mov mov dword ptr [ebp - 4], ebx
    sub sub dword ptr [ebp + 16], 4
    mov mov edi, dword ptr [ebp + 16]
    mov mov edi, dword ptr [edi]
    sub sub edx, 4
    dec dec dword ptr [ebp - 4]
    mov mov dword ptr [edx], edi
    jne sub_1007EEA7
    dec dec dword ptr [ebp - 20]
L13:
    jne sub_1007EE66
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [edi + 44]
    imul imul eax, dword ptr [ebp + 20]
    movzx movzx ecx, word ptr [edi + 12]
    cmp cmp eax, ecx
    jbe sub_1007EEF6
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
    jl sub_1007EF2C
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_1007e938 ENDP
END
