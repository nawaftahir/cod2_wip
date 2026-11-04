.686
.MODEL FLAT, C
EXTRN sub_1007EFC7:PROC
EXTRN sub_1007FB28:PROC
EXTRN sub_1007FB33:PROC
EXTRN sub_1007FB41:PROC
EXTRN sub_1007FB4E:PROC
EXTRN sub_1007FB7B:PROC
EXTRN sub_1007FB92:PROC
EXTRN sub_1007FBA4:PROC
EXTRN sub_1007FBAC:PROC
EXTRN sub_1007FBB1:PROC
EXTRN sub_1007FBBA:PROC
EXTRN sub_1007FC19:PROC
EXTRN sub_1007FC99:PROC
EXTRN sub_1007FCB2:PROC
EXTRN sub_1007FCB9:PROC
EXTRN sub_1007FCBB:PROC
EXTRN sub_1007FCC8:PROC
EXTRN sub_1007FD06:PROC
EXTRN sub_1007FD0A:PROC
EXTRN sub_1007FD11:PROC
EXTRN sub_1007FD19:PROC
EXTRN sub_1007FD20:PROC
EXTRN sub_1007FD74:PROC
EXTRN sub_1007FD86:PROC
EXTRN sub_1007FDC1:PROC
EXTRN sub_1007FE35:PROC
EXTRN sub_1007FE56:PROC
EXTRN sub_1007FE79:PROC
EXTRN sub_1007FE96:PROC
EXTRN sub_1007FE99:PROC
EXTRN sub_1007FEA2:PROC
EXTRN sub_1007FEDB:PROC
EXTRN sub_1007FEE3:PROC
EXTRN sub_1007FF32:PROC
EXTRN sub_1007FF68:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_1007f64e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    mov mov ecx, dword ptr [ebp + 8]
    push push ebx
    mov mov ebx, dword ptr [ebp + 16]
    push push esi
    mov mov esi, dword ptr [ecx + 24]
    movzx movzx eax, word ptr [esi]
    sub sub eax, 0
    push push edi
    mov mov edi, dword ptr [ecx + 32]
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp - 8], ebx
    je L13
    dec dec eax
    je L11
    dec dec eax
    je L6
    dec dec eax
    je L2
    dec dec eax
    dec dec eax
    je L0
    mov mov eax, 080004001h
    jmp sub_1007FB28
    mov mov eax, dword ptr [ebp + 20]
    shl shl eax, 4
    xor xor edx, edx
    div div dword ptr [ecx + 52]
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jbe L1
    mov mov dword ptr [ebp + 20], eax
    and and dword ptr [ebp + 16], 0
    cmp cmp dword ptr [ebp + 20], 0
    jbe sub_1007FB4E
    xor xor ebx, ebx
    cmp cmp word ptr [esi + 10], bx
    jbe L3
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [ebp + 24]
    mov mov ecx, dword ptr [eax + 56]
    mov mov edi, dword ptr [ecx + ebx*4]
    push push dword ptr [edi + 48]
    push push dword ptr [ebp - 8]
L0:
    push push dword ptr [ebp + 12]
    push push eax
    call sub_1007EFC7
    test test eax, eax
    jl sub_1007FB7B
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [edi + 48]
    lea lea eax, [ecx + eax*4]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [edi + 40]
    add add dword ptr [ebp + 24], eax
    movzx movzx eax, word ptr [esi + 10]
    inc inc ebx
    cmp cmp ebx, eax
    jb L3
    inc inc dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 16]
    cmp cmp eax, dword ptr [ebp + 20]
    jb L4
    jmp sub_1007FBA4
    movzx movzx eax, word ptr [esi + 8]
    mov mov ecx, dword ptr [ebp + 20]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe L5
    mov mov dword ptr [ebp + 20], eax
    mov mov dx, word ptr [esi + 4]
    cmp cmp dx, 4
    jne L7
    cmp cmp word ptr [esi + 6], dx
    jne L9
    cmp cmp dword ptr [ebp + 20], 0
    jbe L8
    mov mov edx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [ebp + 16]
    lea lea ecx, [edx + 8]
    lea lea eax, [edi + 32]
    sub sub edx, edi
    mov mov edi, dword ptr [ebp + 20]
    mov mov ebx, dword ptr [eax - 32]
    mov mov dword ptr [ecx - 8], ebx
    mov mov ebx, dword ptr [eax - 16]
    mov mov dword ptr [ecx - 4], ebx
    mov mov ebx, dword ptr [eax]
    mov mov dword ptr [ecx], ebx
    mov mov ebx, dword ptr [eax + 16]
    mov mov dword ptr [ecx + 4], ebx
    mov mov ebx, dword ptr [eax - 28]
    mov mov dword ptr [ecx + 8], ebx
    mov mov ebx, dword ptr [eax - 12]
    mov mov dword ptr [ecx + 12], ebx
    mov mov ebx, dword ptr [eax + 4]
    mov mov dword ptr [ecx + 16], ebx
    mov mov ebx, dword ptr [eax + 20]
    mov mov dword ptr [ecx + 20], ebx
    fld fld dword ptr [eax - 24]
    fstp fstp dword ptr [eax + edx]
    mov mov ebx, dword ptr [eax - 8]
    mov mov dword ptr [ecx + 28], ebx
    mov mov ebx, dword ptr [eax + 8]
    mov mov dword ptr [ecx + 32], ebx
    mov mov ebx, dword ptr [eax + 24]
    mov mov dword ptr [ecx + 36], ebx
    mov mov ebx, dword ptr [eax - 20]
    mov mov dword ptr [ecx + 40], ebx
    mov mov ebx, dword ptr [eax - 4]
    mov mov dword ptr [ecx + 44], ebx
    mov mov ebx, dword ptr [eax + 12]
    mov mov dword ptr [ecx + 48], ebx
    mov mov ebx, dword ptr [eax + 28]
    mov mov dword ptr [ecx + 52], ebx
    add add eax, 64
    add add ecx, 64
    dec dec edi
    jne L10
    mov mov ebx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 8], ebx
    jmp L29
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 20], ebx
    jbe L12
    and and dword ptr [ebp - 8], 0
    cmp cmp word ptr [esi + 6], 0
    jbe L19
    movzx movzx eax, dx
    xor xor ecx, ecx
    test test eax, eax
    jbe L18
    cmp cmp ecx, 4
    ja L15
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, 4
    ja L16
    lea lea edx, [ecx + ebx*4]
    lea lea eax, [eax + edx*4]
    mov mov edx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [edx + eax*4]
    jmp L21
    xor xor eax, eax
    mov mov dword ptr [edi], eax
    mov mov dx, word ptr [esi + 4]
    add add edi, 4
    movzx movzx eax, dx
    inc inc ecx
    cmp cmp ecx, eax
    jb L18
    movzx movzx ecx, word ptr [esi + 6]
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 8], ecx
    jb L20
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp + 20]
    jb L17
    jmp L14
    movzx movzx eax, word ptr [esi + 8]
    mov mov ecx, dword ptr [ebp + 20]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe L23
    mov mov dword ptr [ebp + 20], eax
    mov mov cx, word ptr [esi + 4]
    cmp cmp cx, 4
    jne L25
    cmp cmp word ptr [esi + 6], cx
    je sub_1007FB33
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp + 20], 0
    mov mov edi, dword ptr [ebp - 4]
    jbe L22
    xor xor edx, edx
    test test cx, cx
    jbe L32
    movzx movzx eax, word ptr [esi + 6]
    xor xor ecx, ecx
    test test eax, eax
    jbe L31
    cmp cmp edx, 4
    ja L28
    cmp cmp ecx, 4
    ja L30
    mov mov eax, dword ptr [ebp - 8]
    mov mov ebx, dword ptr [ebp + 16]
    lea lea eax, [edx + eax*4]
    lea lea eax, [ecx + eax*4]
    mov mov eax, dword ptr [ebx + eax*4]
    jmp L34
    xor xor eax, eax
    mov mov dword ptr [edi], eax
    movzx movzx eax, word ptr [esi + 6]
    add add edi, 4
    inc inc ecx
    cmp cmp ecx, eax
    jb L31
    mov mov cx, word ptr [esi + 4]
    movzx movzx ebx, cx
    inc inc edx
    cmp cmp edx, ebx
    jb L33
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp + 20]
    jb L33
    jmp L24
    mov mov ecx, dword ptr [ebp + 20]
L8:
    movzx movzx eax, word ptr [esi + 8]
    shl shl ecx, 2
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe sub_1007FB41
    mov mov dword ptr [ebp + 20], eax
L10:
    mov mov ax, word ptr [esi + 6]
    cmp cmp ax, 4
    je sub_1007FBBA
    mov mov edx, edi
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 20], edi
    jbe L26
    movzx movzx eax, ax
    xor xor ecx, ecx
L11:
    test test eax, eax
    jbe sub_1007FBB1
    cmp cmp ecx, 4
    jbe sub_1007FB92
    xor xor eax, eax
    jmp sub_1007FBAC
    mov mov eax, edi
    shr shr eax, 2
    mov mov ebx, edi
    and and ebx, 3
    lea lea eax, [ebx + eax*4]
    mov mov ebx, dword ptr [ebp + 16]
    lea lea eax, [ecx + eax*4]
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov dword ptr [edx], eax
    movzx movzx eax, word ptr [esi + 6]
    add add edx, 4
    inc inc ecx
    cmp cmp ecx, eax
    jb sub_1007FBB1
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 20]
    jb sub_1007FBB1
    jmp L27
    mov mov ecx, dword ptr [ebp + 20]
    movzx movzx eax, word ptr [esi + 8]
    shl shl ecx, 4
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe sub_1007FC19
    mov mov dword ptr [ebp + 20], eax
    mov mov ax, word ptr [esi + 2]
    cmp cmp ax, 3
    je sub_1007FCBB
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx + 52]
    imul imul ecx, dword ptr [ebp + 20]
    movzx movzx eax, ax
    dec dec eax
    je sub_1007FC99
    dec dec eax
    jne sub_1007FCC8
    fnstcw fnstcw word ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 16]
    or or eax, 0C00h
    mov mov dword ptr [ebp - 20], eax
    fldcw fldcw word ptr [ebp - 20]
    test test ecx, ecx
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 16], eax
    jbe sub_1007FCB2
    mov mov eax, dword ptr [ebp - 4]
    mov mov edx, ebx
    sub sub edx, eax
    fld fld dword ptr [edx + eax]
    fstp fstp dword ptr [ebp + 16]
    fld fld dword ptr [ebp + 16]
    fistp fistp dword ptr [ebp - 20]
    mov mov edi, dword ptr [ebp - 20]
    mov mov dword ptr [eax], edi
    add add eax, 4
    dec dec ecx
    jne sub_1007FCB9
    fldcw fldcw word ptr [ebp - 16]
    jmp sub_1007FD06
    test test ecx, ecx
    jbe sub_1007FD0A
L14:
    mov mov edx, dword ptr [ebp - 4]
    mov mov edi, ebx
    sub sub edi, edx
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [edx + edi]
L17:
    fucompp fucompp
L18:
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1007FD19
    xor xor eax, eax
    inc inc eax
L21:
    jmp sub_1007FD20
    xor xor eax, eax
    mov mov dword ptr [edx], eax
    add add edx, 4
    dec dec ecx
    jne sub_1007FD11
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp + 8]
    mov mov ax, word ptr [eax + 8]
    test test ax, ax
    je sub_1007FE35
    cmp cmp word ptr [esi], 3
    je sub_1007FD74
    movzx movzx edx, word ptr [esi + 6]
    movzx movzx edi, word ptr [esi + 4]
    jmp sub_1007FD86
    movzx movzx edx, word ptr [esi + 4]
    movzx movzx edi, word ptr [esi + 6]
    test test dl, 3
    je sub_1007FE56
    cmp cmp ax, 1
    mov mov dword ptr [ebp - 12], 01010FE8Ch
    je sub_1007FDC1
    mov mov dword ptr [ebp - 12], 01010FE7Ch
    imul imul edi, dword ptr [ebp + 20]
    lea lea esi, [edx + 3]
    and and esi, -4
    test test edi, edi
    mov mov dword ptr [ebp + 16], edi
    jbe sub_1007FE79
    mov mov ebx, dword ptr [ebp - 4]
    lea lea ecx, [edi*4 + 4]
    imul imul edi, esi
    mov mov eax, ecx
    imul imul ecx, esi
    imul imul eax, edx
    add add eax, dword ptr [ebp - 8]
    add add edi, edx
    add add ecx, dword ptr [ebp - 4]
    lea lea ebx, [ebx + edi*4]
L25:
    mov mov dword ptr [ebp - 8], ecx
    mov mov ecx, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 20], ecx
    mov mov edi, esi
    shl shl edi, 2
    sub sub dword ptr [ebp - 8], edi
L26:
    mov mov ecx, edx
    shl shl ecx, 2
    sub sub ebx, edi
    sub sub eax, ecx
    cmp cmp esi, edx
    mov mov dword ptr [ebp + 16], esi
    jbe sub_1007FE96
    mov mov ecx, dword ptr [ebp - 8]
    dec dec dword ptr [ebp + 16]
    mov mov edi, dword ptr [ebp - 12]
    sub sub ecx, 4
    mov mov dword ptr [ebp - 16], ecx
    mov mov ecx, dword ptr [ebp + 16]
    and and ecx, 3
    cmp cmp dword ptr [ebp + 16], edx
    mov mov edi, dword ptr [edi + ecx*4]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [ecx], edi
    ja sub_1007FE99
    test test edx, edx
    jbe sub_1007FEDB
    mov mov ecx, ebx
    mov mov dword ptr [ebp + 16], eax
    mov mov dword ptr [ebp - 16], edx
    sub sub dword ptr [ebp + 16], 4
    mov mov edi, dword ptr [ebp + 16]
    mov mov edi, dword ptr [edi]
    sub sub ecx, 4
    dec dec dword ptr [ebp - 16]
    mov mov dword ptr [ecx], edi
    jne sub_1007FEE3
    dec dec dword ptr [ebp - 20]
    jne sub_1007FEA2
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 8], eax
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ecx + 44]
L30:
    imul imul eax, dword ptr [ebp + 20]
    movzx movzx edx, word ptr [ecx + 12]
L32:
    cmp cmp eax, edx
    jbe sub_1007FF32
L33:
    mov mov eax, edx
    push push eax
    push push dword ptr [ebp - 4]
    movzx movzx eax, word ptr [ecx + 10]
    push push dword ptr [ebp - 8]
    add add eax, dword ptr [ebp + 24]
    push push eax
    push push dword ptr [ebp + 12]
    call call dword ptr [ecx + 28]
    test test eax, eax
    jl sub_1007FF68
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_1007f64e ENDP
END
