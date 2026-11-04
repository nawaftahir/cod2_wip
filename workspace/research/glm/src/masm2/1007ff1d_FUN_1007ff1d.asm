.686
.MODEL FLAT, C
EXTRN sub_1007F008:PROC
EXTRN sub_10080427:PROC
EXTRN sub_10080440:PROC
EXTRN sub_1008046A:PROC
EXTRN sub_100804A2:PROC
EXTRN sub_100804BD:PROC
EXTRN sub_100804CE:PROC
EXTRN sub_100804D1:PROC
EXTRN sub_100804E3:PROC
EXTRN sub_100804FD:PROC
EXTRN sub_100804FE:PROC
EXTRN sub_10080502:PROC
EXTRN sub_10080526:PROC
EXTRN sub_10080527:PROC
EXTRN sub_10080548:PROC
EXTRN sub_10080566:PROC
EXTRN sub_10080587:PROC
EXTRN sub_100805A6:PROC
EXTRN sub_10080658:PROC
EXTRN sub_10080671:PROC
EXTRN sub_10080678:PROC
EXTRN sub_1008067A:PROC
EXTRN sub_10080687:PROC
EXTRN sub_100806C5:PROC
EXTRN sub_100806C9:PROC
EXTRN sub_100806D0:PROC
EXTRN sub_100806D8:PROC
EXTRN sub_100806DF:PROC
EXTRN sub_10080733:PROC
EXTRN sub_10080745:PROC
EXTRN sub_10080780:PROC
EXTRN sub_100807F1:PROC
EXTRN sub_10080812:PROC
EXTRN sub_10080838:PROC
EXTRN sub_10080855:PROC
EXTRN sub_10080858:PROC
EXTRN sub_10080861:PROC
EXTRN sub_1008089A:PROC
EXTRN sub_100808A2:PROC
EXTRN sub_100808EB:PROC
EXTRN sub_1008091D:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_1007ff1d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ecx + 32]
    push push ebx
    mov mov ebx, dword ptr [ebp + 16]
    push push esi
    mov mov esi, dword ptr [ecx + 24]
    mov mov dword ptr [ebp - 4], eax
    movzx movzx eax, word ptr [esi]
    sub sub eax, 0
    push push edi
    mov mov dword ptr [ebp - 8], ebx
    je L17
    dec dec eax
    je L16
    dec dec eax
    je L6
    dec dec eax
    je L3
    dec dec eax
    dec dec eax
    je L0
    mov mov eax, 080004001h
    jmp sub_1008046A
    mov mov eax, dword ptr [ebp + 20]
    mov mov ecx, dword ptr [ecx + 52]
    shl shl eax, 4
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jbe L1
    mov mov dword ptr [ebp + 20], eax
    imul imul ecx, dword ptr [ebp + 20]
    mov mov edx, dword ptr [ebp - 4]
    xor xor edi, edi
    test test ecx, ecx
    mov mov dword ptr [ebp - 20], ecx
    jbe L2
    mov mov eax, edi
    shr shr eax, 2
    mov mov ecx, eax
    shr shr ecx, 2
    mov mov ebx, edi
    and and ebx, 3
    and and eax, 3
    lea lea ecx, [ebx + ecx*4]
    lea lea eax, [eax + ecx*4]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov dword ptr [edx], eax
    add add edx, 4
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 20]
    jb L2
    mov mov eax, dword ptr [ebp - 4]
    and and dword ptr [ebp + 16], 0
    cmp cmp dword ptr [ebp + 20], 0
    mov mov dword ptr [ebp - 8], eax
    jbe sub_100804D1
    xor xor ebx, ebx
    cmp cmp word ptr [esi + 10], bx
    jbe L4
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [ebp + 24]
    mov mov ecx, dword ptr [eax + 56]
    mov mov edi, dword ptr [ecx + ebx*4]
    push push dword ptr [edi + 48]
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 12]
    push push eax
    call sub_1007F008
    test test eax, eax
    jl sub_100804FE
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [edi + 48]
    lea lea eax, [ecx + eax*4]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [edi + 40]
    add add dword ptr [ebp + 24], eax
    movzx movzx eax, word ptr [esi + 10]
    inc inc ebx
    cmp cmp ebx, eax
    jb L4
    inc inc dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 16]
    cmp cmp eax, dword ptr [ebp + 20]
    jb L5
    jmp sub_10080527
    movzx movzx eax, word ptr [esi + 8]
    mov mov ecx, dword ptr [ebp + 20]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe L7
L2:
    mov mov dword ptr [ebp + 20], eax
    mov mov dx, word ptr [esi + 4]
    cmp cmp dx, 4
    jne L8
    cmp cmp word ptr [esi + 6], dx
    je L22
    mov mov edi, dword ptr [ebp - 4]
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 20], ebx
    jbe L23
    and and dword ptr [ebp - 8], 0
    cmp cmp word ptr [esi + 6], 0
    jbe L13
L3:
    movzx movzx eax, dx
    xor xor ecx, ecx
    test test eax, eax
    jbe L12
    cmp cmp ecx, 4
    ja L9
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, 4
    ja L10
    mov mov edx, dword ptr [ebp + 16]
    lea lea eax, [eax + ebx*4]
    lea lea eax, [ecx + eax*4]
    mov mov eax, dword ptr [edx + eax*4]
    jmp L15
    xor xor eax, eax
    mov mov dword ptr [edi], eax
    mov mov dx, word ptr [esi + 4]
    add add edi, 4
    movzx movzx eax, dx
    inc inc ecx
    cmp cmp ecx, eax
    jb L12
    movzx movzx ecx, word ptr [esi + 6]
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 8], ecx
    jb L14
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp + 20]
    jb L11
    jmp L24
    movzx movzx eax, word ptr [esi + 8]
    mov mov ecx, dword ptr [ebp + 20]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe L18
    mov mov dword ptr [ebp + 20], eax
    mov mov cx, word ptr [esi + 4]
    cmp cmp cx, 4
    jne L19
    cmp cmp word ptr [esi + 6], cx
    jne L20
    cmp cmp dword ptr [ebp + 20], 0
    jbe sub_10080440
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
    fstp fstp dword ptr [edx + eax]
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
    jne L21
    jmp sub_100804BD
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp + 20], 0
    mov mov edi, dword ptr [ebp - 4]
    jbe sub_100804CE
    xor xor edx, edx
    test test cx, cx
    jbe L28
    movzx movzx eax, word ptr [esi + 6]
    xor xor ecx, ecx
    test test eax, eax
    jbe L27
    cmp cmp edx, 4
    ja L25
    cmp cmp ecx, 4
    ja L26
    mov mov eax, dword ptr [ebp - 8]
    mov mov ebx, dword ptr [ebp + 16]
    lea lea eax, [ecx + eax*4]
    lea lea eax, [edx + eax*4]
    mov mov eax, dword ptr [ebx + eax*4]
    jmp sub_10080427
    xor xor eax, eax
    mov mov dword ptr [edi], eax
    movzx movzx eax, word ptr [esi + 6]
    add add edi, 4
    inc inc ecx
    cmp cmp ecx, eax
    jb L27
    mov mov cx, word ptr [esi + 4]
    movzx movzx ebx, cx
    inc inc edx
    cmp cmp edx, ebx
    jb L29
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp + 20]
    jb L29
    jmp sub_10080526
    mov mov ecx, dword ptr [ebp + 20]
    movzx movzx eax, word ptr [esi + 8]
    shl shl ecx, 2
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe sub_100804A2
    mov mov dword ptr [ebp + 20], eax
L9:
    mov mov edx, dword ptr [ebp - 4]
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 20], edi
L10:
    jbe sub_10080548
L12:
    movzx movzx eax, word ptr [esi + 6]
    xor xor ecx, ecx
L14:
    test test eax, eax
    jbe sub_10080502
L15:
    cmp cmp ecx, 4
    jbe sub_100804E3
    xor xor eax, eax
    jmp sub_100804FD
    mov mov eax, edi
    shr shr eax, 2
    mov mov ebx, edi
    lea lea eax, [ecx + eax*4]
    and and ebx, 3
    lea lea eax, [ebx + eax*4]
    mov mov ebx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov dword ptr [edx], eax
    movzx movzx eax, word ptr [esi + 6]
    add add edx, 4
    inc inc ecx
    cmp cmp ecx, eax
    jb sub_10080502
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 20]
    jb sub_10080502
    jmp sub_10080587
    mov mov edi, dword ptr [ebp + 20]
    movzx movzx eax, word ptr [esi + 8]
    shl shl edi, 4
    cmp cmp edi, eax
    mov mov dword ptr [ebp + 20], edi
    jbe sub_10080566
    mov mov edi, eax
    mov mov dword ptr [ebp + 20], edi
    mov mov ecx, dword ptr [ebp - 4]
    xor xor edx, edx
    test test edi, edi
    jbe sub_100805A6
    mov mov eax, edx
    shr shr eax, 2
    mov mov edi, eax
    shr shr edi, 2
L17:
    mov mov ebx, edx
    and and ebx, 3
    and and eax, 3
    lea lea edi, [ebx + edi*4]
    lea lea eax, [eax + edi*4]
    mov mov edi, dword ptr [ebp + 16]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov dword ptr [ecx], eax
    add add ecx, 4
    inc inc edx
    cmp cmp edx, dword ptr [ebp + 20]
    jb sub_100805A6
    mov mov ebx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 8], ebx
    mov mov ax, word ptr [esi + 2]
    cmp cmp ax, 3
    je sub_1008067A
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx + 52]
    imul imul ecx, dword ptr [ebp + 20]
    movzx movzx eax, ax
    dec dec eax
    je sub_10080658
    dec dec eax
    jne sub_10080687
    fnstcw fnstcw word ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 16]
    or or eax, 0C00h
    mov mov dword ptr [ebp - 20], eax
    fldcw fldcw word ptr [ebp - 20]
    test test ecx, ecx
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 16], eax
    jbe sub_10080671
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
    jne sub_10080678
    fldcw fldcw word ptr [ebp - 16]
    jmp sub_100806C5
    test test ecx, ecx
    jbe sub_100806C9
    mov mov edx, dword ptr [ebp - 4]
    mov mov edi, ebx
    sub sub edi, edx
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [edx + edi]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100806D8
    xor xor eax, eax
    inc inc eax
    jmp sub_100806DF
    xor xor eax, eax
    mov mov dword ptr [edx], eax
    add add edx, 4
    dec dec ecx
    jne sub_100806D0
    mov mov ebx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 8], ebx
    mov mov eax, dword ptr [ebp + 8]
    mov mov ax, word ptr [eax + 8]
    test test ax, ax
    je sub_100807F1
    cmp cmp word ptr [esi], 3
    je sub_10080733
    movzx movzx edx, word ptr [esi + 6]
    movzx movzx edi, word ptr [esi + 4]
    jmp sub_10080745
    movzx movzx edx, word ptr [esi + 4]
    movzx movzx edi, word ptr [esi + 6]
    test test dl, 3
    je sub_10080812
    cmp cmp ax, 1
    mov mov dword ptr [ebp - 12], 01010FECCh
    je sub_10080780
    mov mov dword ptr [ebp - 12], 01010FEBCh
    imul imul edi, dword ptr [ebp + 20]
    lea lea esi, [edx + 3]
    and and esi, -4
    test test edi, edi
    mov mov dword ptr [ebp + 16], edi
    jbe sub_10080838
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
    mov mov dword ptr [ebp - 8], ecx
    mov mov ecx, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 20], ecx
    mov mov edi, esi
    shl shl edi, 2
    sub sub dword ptr [ebp - 8], edi
    mov mov ecx, edx
    shl shl ecx, 2
    sub sub ebx, edi
    sub sub eax, ecx
    cmp cmp esi, edx
    mov mov dword ptr [ebp + 16], esi
    jbe sub_10080855
    mov mov ecx, dword ptr [ebp - 8]
    dec dec dword ptr [ebp + 16]
    mov mov edi, dword ptr [ebp - 12]
    sub sub ecx, 4
L23:
    mov mov dword ptr [ebp - 16], ecx
    mov mov ecx, dword ptr [ebp + 16]
    and and ecx, 3
    cmp cmp dword ptr [ebp + 16], edx
    mov mov edi, dword ptr [edi + ecx*4]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [ecx], edi
    ja sub_10080858
    test test edx, edx
    jbe sub_1008089A
    mov mov ecx, ebx
    mov mov dword ptr [ebp + 16], eax
    mov mov dword ptr [ebp - 16], edx
    sub sub dword ptr [ebp + 16], 4
    mov mov edi, dword ptr [ebp + 16]
    mov mov edi, dword ptr [edi]
    sub sub ecx, 4
    dec dec dword ptr [ebp - 16]
    mov mov dword ptr [ecx], edi
    jne sub_100808A2
    dec dec dword ptr [ebp - 20]
    jne sub_10080861
    mov mov ebx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ecx + 44]
    imul imul eax, dword ptr [ebp + 20]
    movzx movzx edx, word ptr [ecx + 12]
    cmp cmp eax, edx
    jbe sub_100808EB
    mov mov eax, edx
    push push eax
    push push dword ptr [ebp - 4]
    movzx movzx eax, word ptr [ecx + 10]
L24:
    add add eax, dword ptr [ebp + 24]
    push push ebx
    push push eax
    push push dword ptr [ebp + 12]
    call call dword ptr [ecx + 28]
    test test eax, eax
L27:
    jl sub_1008091D
L28:
    xor xor eax, eax
    pop pop edi
    pop pop esi
L29:
    pop pop ebx
    leave leave
    ret ret 20
FUN_1007ff1d ENDP
END
