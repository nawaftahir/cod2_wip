.686
.MODEL FLAT, C
EXTRN sub_1007F002:PROC
EXTRN sub_1007FF20:PROC
EXTRN sub_1007FF2D:PROC
EXTRN sub_1007FF49:PROC
EXTRN sub_1007FF4E:PROC
EXTRN sub_1007FF53:PROC
EXTRN sub_1007FF5D:PROC
EXTRN sub_1007FF72:PROC
EXTRN sub_1007FF96:PROC
EXTRN sub_1007FFBE:PROC
EXTRN sub_1007FFC3:PROC
EXTRN sub_1007FFDC:PROC
EXTRN sub_1007FFF0:PROC
EXTRN sub_1007FFF8:PROC
EXTRN sub_10080019:PROC
EXTRN sub_10080095:PROC
EXTRN sub_100800B0:PROC
EXTRN sub_100800C3:PROC
EXTRN sub_10080100:PROC
EXTRN sub_10080106:PROC
EXTRN sub_10080114:PROC
EXTRN sub_1008011B:PROC
EXTRN sub_10080161:PROC
EXTRN sub_10080173:PROC
EXTRN sub_100801AE:PROC
EXTRN sub_1008021B:PROC
EXTRN sub_1008023C:PROC
EXTRN sub_10080265:PROC
EXTRN sub_10080281:PROC
EXTRN sub_10080284:PROC
EXTRN sub_1008028D:PROC
EXTRN sub_100802C6:PROC
EXTRN sub_100802CE:PROC
EXTRN sub_10080311:PROC
EXTRN sub_10080347:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_1007fae3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    mov mov ecx, dword ptr [ebp + 8]
    push push ebx
    mov mov ebx, dword ptr [ecx + 32]
    push push esi
    mov mov esi, dword ptr [ecx + 24]
    movzx movzx eax, word ptr [esi]
    xor xor edx, edx
    sub sub eax, edx
    push push edi
    mov mov dword ptr [ebp - 4], ebx
    je L9
    dec dec eax
    je L7
    dec dec eax
    je L6
    dec dec eax
    je L3
    dec dec eax
    dec dec eax
    je L0
    mov mov eax, 080004001h
    jmp sub_1007FF5D
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
    xor xor edi, edi
    test test ecx, ecx
    mov mov dword ptr [ebp - 20], ecx
    mov mov edx, ebx
    jbe L2
    mov mov eax, edi
    shr shr eax, 2
    mov mov ecx, eax
    mov mov ebx, edi
    and and ebx, 3
    and and ecx, 3
    shr shr eax, 2
L0:
    lea lea ecx, [ebx + ecx*4]
    mov mov ebx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [edx], eax
    add add edx, 4
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 20]
    jb L2
    mov mov eax, dword ptr [ebp - 4]
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp + 20], 0
    mov mov dword ptr [ebp + 16], eax
    jbe sub_1007FFC3
    xor xor ebx, ebx
    cmp cmp word ptr [esi + 10], bx
    jbe L4
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [ebp + 24]
    mov mov ecx, dword ptr [eax + 56]
    mov mov edi, dword ptr [ecx + ebx*4]
L1:
    push push dword ptr [edi + 48]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push eax
    call sub_1007F002
    test test eax, eax
    jl sub_1007FFF0
    mov mov ecx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [edi + 48]
    lea lea eax, [ecx + eax*4]
    mov mov dword ptr [ebp + 16], eax
    mov mov eax, dword ptr [edi + 40]
    add add dword ptr [ebp + 24], eax
    movzx movzx eax, word ptr [esi + 10]
    inc inc ebx
    cmp cmp ebx, eax
    jb L4
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp + 20]
    jb L5
    jmp sub_10080019
    movzx movzx eax, word ptr [esi + 8]
    mov mov ecx, dword ptr [ebp + 20]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe L8
    mov mov dword ptr [ebp + 20], eax
    mov mov edi, dword ptr [ebp - 4]
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 20], ebx
    jbe L25
    and and dword ptr [ebp - 8], 0
    cmp cmp word ptr [esi + 6], 0
    jbe L14
    movzx movzx eax, word ptr [esi + 4]
    xor xor edx, edx
    test test eax, eax
    jbe L13
    mov mov ecx, dword ptr [ebp - 8]
    shl shl ecx, 2
    cmp cmp edx, 4
    ja L10
    cmp cmp dword ptr [ebp - 8], 4
    ja L12
    mov mov eax, dword ptr [ebp + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov eax, dword ptr [ecx + eax]
    jmp L16
    xor xor eax, eax
    mov mov dword ptr [edi], eax
    movzx movzx eax, word ptr [esi + 4]
    add add edi, 4
    inc inc edx
    add add ecx, 16
    cmp cmp edx, eax
    jb L15
    movzx movzx ecx, word ptr [esi + 6]
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 8], ecx
    jb L15
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp + 20]
    jb L11
    jmp L27
    movzx movzx eax, word ptr [esi + 8]
    mov mov ecx, dword ptr [ebp + 20]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe L17
    mov mov dword ptr [ebp + 20], eax
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 20], edx
    mov mov dword ptr [ebp - 8], ebx
    jbe sub_1007FF20
    xor xor edx, edx
    cmp cmp word ptr [esi + 4], dx
    jbe L21
    movzx movzx eax, word ptr [esi + 6]
    xor xor ecx, ecx
L4:
    test test eax, eax
    jbe L22
    cmp cmp edx, 4
    ja L18
    cmp cmp ecx, 4
    ja L19
    mov mov ebx, dword ptr [ebp + 16]
    mov mov ebx, dword ptr [ebx + edi*4]
    lea lea eax, [ecx + edx*4]
    mov mov eax, dword ptr [ebx + eax*4]
    jmp L24
    xor xor eax, eax
    mov mov ebx, dword ptr [ebp - 8]
    add add dword ptr [ebp - 8], 4
    mov mov dword ptr [ebx], eax
    movzx movzx eax, word ptr [esi + 6]
    inc inc ecx
    cmp cmp ecx, eax
    jb L22
    movzx movzx ecx, word ptr [esi + 4]
    inc inc edx
    cmp cmp edx, ecx
    jb L23
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 20]
    jb L20
    jmp sub_1007FF72
    mov mov ecx, dword ptr [ebp + 20]
    movzx movzx eax, word ptr [esi + 8]
    shl shl ecx, 2
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe L26
    mov mov dword ptr [ebp + 20], eax
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp + 20], 0
    mov mov edx, ebx
    jbe sub_1007FF96
    movzx movzx eax, word ptr [esi + 6]
    xor xor ecx, ecx
    test test eax, eax
    jbe sub_1007FF4E
    cmp cmp ecx, 4
    jbe sub_1007FF2D
    xor xor eax, eax
    jmp sub_1007FF49
    mov mov eax, dword ptr [ebp - 8]
    mov mov edi, dword ptr [ebp - 8]
    mov mov ebx, dword ptr [ebp + 16]
    and and eax, 3
    shr shr edi, 2
    mov mov edi, dword ptr [ebx + edi*4]
    lea lea eax, [ecx + eax*4]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov dword ptr [edx], eax
    movzx movzx eax, word ptr [esi + 6]
    add add edx, 4
    inc inc ecx
    cmp cmp ecx, eax
    jb sub_1007FF4E
    inc inc dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [ebp + 20]
    jb sub_1007FF53
    jmp sub_1007FFDC
    mov mov edi, dword ptr [ebp + 20]
    movzx movzx eax, word ptr [esi + 8]
    shl shl edi, 4
    cmp cmp edi, eax
    mov mov dword ptr [ebp + 20], edi
    jbe sub_1007FFBE
    mov mov edi, eax
    mov mov dword ptr [ebp + 20], edi
    test test edi, edi
    mov mov ecx, ebx
    jbe sub_1007FFF8
    mov mov eax, edx
    shr shr eax, 2
    mov mov edi, eax
    mov mov ebx, edx
    and and ebx, 3
    and and edi, 3
    shr shr eax, 2
    lea lea edi, [ebx + edi*4]
    mov mov ebx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov dword ptr [ecx], eax
    add add ecx, 4
L10:
    inc inc edx
    cmp cmp edx, dword ptr [ebp + 20]
    jb sub_1007FFF8
L12:
    mov mov ax, word ptr [esi + 2]
L14:
    cmp cmp ax, 3
L15:
    je sub_100800B0
    mov mov ecx, dword ptr [ebp + 8]
L16:
    mov mov ecx, dword ptr [ecx + 52]
    imul imul ecx, dword ptr [ebp + 20]
    movzx movzx eax, ax
    dec dec eax
    je sub_10080095
    dec dec eax
    jne sub_100800C3
    fnstcw fnstcw word ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 16]
    or or eax, 0C00h
    mov mov dword ptr [ebp - 20], eax
    fldcw fldcw word ptr [ebp - 20]
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 16], eax
    xor xor eax, eax
    test test ecx, ecx
    jbe sub_100800B0
    mov mov edx, dword ptr [ebp - 4]
    lea lea edx, [edx + eax*4]
    mov mov edi, dword ptr [edx]
    mov mov dword ptr [ebp + 16], edi
    fld fld dword ptr [ebp + 16]
    fistp fistp dword ptr [ebp - 20]
    mov mov edi, dword ptr [ebp - 20]
    inc inc eax
    cmp cmp eax, ecx
    mov mov dword ptr [edx], edi
    jb sub_100800B0
    fldcw fldcw word ptr [ebp - 16]
    jmp sub_10080100
    xor xor edx, edx
    test test ecx, ecx
    jbe sub_10080106
    mov mov eax, dword ptr [ebp - 4]
    fld fld dword ptr [g_1019BC84]
    lea lea edi, [eax + edx*4]
    fld fld dword ptr [edi]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10080114
    xor xor eax, eax
    inc inc eax
    jmp sub_1008011B
    xor xor eax, eax
L17:
    inc inc edx
    cmp cmp edx, ecx
    mov mov dword ptr [edi], eax
    jb sub_10080106
    mov mov eax, dword ptr [ebp + 8]
    mov mov ax, word ptr [eax + 8]
    test test ax, ax
    je sub_1008021B
    cmp cmp word ptr [esi], 3
    je sub_10080161
    movzx movzx edx, word ptr [esi + 6]
    movzx movzx edi, word ptr [esi + 4]
    jmp sub_10080173
    movzx movzx edx, word ptr [esi + 4]
    movzx movzx edi, word ptr [esi + 6]
    test test dl, 3
    je sub_1008023C
    cmp cmp ax, 1
    mov mov dword ptr [ebp - 12], 01010FEACh
    je sub_100801AE
    mov mov dword ptr [ebp - 12], 01010FE9Ch
    imul imul edi, dword ptr [ebp + 20]
    lea lea esi, [edx + 3]
    and and esi, -4
    test test edi, edi
    mov mov dword ptr [ebp + 16], edi
    jbe sub_10080265
    mov mov ebx, dword ptr [ebp - 4]
    lea lea ecx, [edi*4 + 4]
    imul imul edi, esi
L21:
    mov mov eax, ecx
    imul imul ecx, esi
    imul imul eax, edx
    add add eax, ebx
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
    jbe sub_10080281
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
    ja sub_10080284
    test test edx, edx
    jbe sub_100802C6
    mov mov ecx, ebx
    mov mov dword ptr [ebp + 16], eax
    mov mov dword ptr [ebp - 16], edx
    sub sub dword ptr [ebp + 16], 4
    mov mov edi, dword ptr [ebp + 16]
    mov mov edi, dword ptr [edi]
    sub sub ecx, 4
    dec dec dword ptr [ebp - 16]
    mov mov dword ptr [ecx], edi
    jne sub_100802CE
    dec dec dword ptr [ebp - 20]
    jne sub_1008028D
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ecx + 44]
    imul imul eax, dword ptr [ebp + 20]
    movzx movzx edx, word ptr [ecx + 12]
    cmp cmp eax, edx
    jbe sub_10080311
    mov mov eax, edx
    push push eax
    push push dword ptr [ebp - 4]
    movzx movzx eax, word ptr [ecx + 10]
    push push dword ptr [ebp - 4]
    add add eax, dword ptr [ebp + 24]
    push push eax
    push push dword ptr [ebp + 12]
    call call dword ptr [ecx + 28]
    test test eax, eax
    jl sub_10080347
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_1007fae3 ENDP
END
