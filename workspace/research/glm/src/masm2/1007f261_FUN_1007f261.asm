.686
.MODEL FLAT, C
EXTRN sub_1007EFC6:PROC
EXTRN sub_1007F671:PROC
EXTRN sub_1007F681:PROC
EXTRN sub_1007F686:PROC
EXTRN sub_1007F68F:PROC
EXTRN sub_1007F694:PROC
EXTRN sub_1007F6B8:PROC
EXTRN sub_1007F6E4:PROC
EXTRN sub_1007F6E5:PROC
EXTRN sub_1007F70E:PROC
EXTRN sub_1007F764:PROC
EXTRN sub_1007F77D:PROC
EXTRN sub_1007F783:PROC
EXTRN sub_1007F784:PROC
EXTRN sub_1007F793:PROC
EXTRN sub_1007F7D1:PROC
EXTRN sub_1007F7D5:PROC
EXTRN sub_1007F7DC:PROC
EXTRN sub_1007F7E4:PROC
EXTRN sub_1007F7EB:PROC
EXTRN sub_1007F839:PROC
EXTRN sub_1007F84B:PROC
EXTRN sub_1007F886:PROC
EXTRN sub_1007F8FB:PROC
EXTRN sub_1007F91C:PROC
EXTRN sub_1007F93F:PROC
EXTRN sub_1007F95D:PROC
EXTRN sub_1007F960:PROC
EXTRN sub_1007F96A:PROC
EXTRN sub_1007F9A1:PROC
EXTRN sub_1007F9AA:PROC
EXTRN sub_1007F9F9:PROC
EXTRN sub_1007FA2B:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_1007f261 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 16]
    push push ebx
    mov mov ebx, dword ptr [ecx + 32]
    push push esi
    mov mov esi, dword ptr [ecx + 24]
    mov mov dword ptr [ebp - 4], eax
    movzx movzx eax, word ptr [esi]
    push push edi
    xor xor edi, edi
    sub sub eax, edi
    mov mov dword ptr [ebp - 8], ebx
    je L14
    dec dec eax
    je L7
    dec dec eax
    je L5
    dec dec eax
    je L2
    dec dec eax
    dec dec eax
    je L0
    mov mov eax, 080004001h
    jmp sub_1007F694
    mov mov eax, dword ptr [ebp + 20]
    shl shl eax, 2
    xor xor edx, edx
    div div dword ptr [ecx + 52]
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jbe L1
    mov mov dword ptr [ebp + 20], eax
    cmp cmp dword ptr [ebp + 20], edi
    mov mov dword ptr [ebp + 16], edi
    jbe sub_1007F6B8
    xor xor ebx, ebx
    cmp cmp word ptr [esi + 10], bx
    jbe L3
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [ebp + 24]
    mov mov ecx, dword ptr [eax + 56]
    mov mov edi, dword ptr [ecx + ebx*4]
    push push dword ptr [edi + 48]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 12]
L0:
    push push eax
    call sub_1007EFC6
    test test eax, eax
    jl sub_1007F6E5
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi + 48]
    lea lea eax, [ecx + eax*4]
    mov mov dword ptr [ebp - 4], eax
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
    jmp sub_1007F70E
    movzx movzx ecx, word ptr [esi + 6]
    mov mov eax, dword ptr [ebp + 20]
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jbe L6
    mov mov dword ptr [ebp + 20], eax
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp + 20], 0
    mov mov edi, ebx
    jbe L13
    xor xor edx, edx
    test test ecx, ecx
    jbe L10
    movzx movzx eax, word ptr [esi + 4]
    xor xor ecx, ecx
    test test eax, eax
    jbe L11
    cmp cmp edx, 4
    jbe L8
    xor xor eax, eax
    jmp L9
L2:
    imul imul eax, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ebp + 16]
    add add eax, ecx
    lea lea eax, [edx + eax*4]
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov ebx, dword ptr [ebp - 8]
    mov mov dword ptr [edi], eax
    movzx movzx eax, word ptr [esi + 4]
    add add edi, 4
    inc inc ecx
    cmp cmp ecx, eax
    jb L11
    movzx movzx ecx, word ptr [esi + 6]
    inc inc edx
    cmp cmp edx, ecx
    jb L12
    inc inc dword ptr [ebp - 4]
L3:
    mov mov eax, dword ptr [ebp + 20]
L4:
    cmp cmp dword ptr [ebp - 4], eax
    jb L13
    mov mov dword ptr [ebp - 4], ebx
    jmp L25
    movzx movzx ecx, word ptr [esi + 4]
    mov mov eax, dword ptr [ebp + 20]
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jbe L16
    mov mov dword ptr [ebp + 20], eax
    mov mov dx, word ptr [esi + 6]
    cmp cmp dx, 4
    je L26
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp + 20], 0
    mov mov edi, ebx
    jbe L15
    xor xor ebx, ebx
    test test ecx, ecx
L5:
    jbe L21
    movzx movzx eax, dx
    xor xor ecx, ecx
    test test eax, eax
    jbe L21
    cmp cmp ecx, 4
    jbe L18
    xor xor eax, eax
    jmp L19
    movzx movzx eax, word ptr [esi + 4]
    imul imul eax, dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp + 16]
    add add eax, ebx
    lea lea eax, [ecx + eax*4]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov dword ptr [edi], eax
    mov mov dx, word ptr [esi + 6]
    add add edi, 4
    movzx movzx eax, dx
    inc inc ecx
    cmp cmp ecx, eax
    jb L21
    movzx movzx ecx, word ptr [esi + 4]
    inc inc ebx
    cmp cmp ebx, ecx
    jb L22
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
L6:
    cmp cmp eax, dword ptr [ebp + 20]
    jb L23
    mov mov ebx, dword ptr [ebp - 8]
    jmp L17
    movzx movzx eax, word ptr [esi + 8]
    mov mov ecx, dword ptr [ebp + 20]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe L27
    mov mov dword ptr [ebp + 20], eax
    mov mov ax, word ptr [esi + 6]
    cmp cmp ax, 4
    je sub_1007F68F
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 20], edi
    mov mov edx, ebx
    jbe L20
    movzx movzx eax, ax
    xor xor ecx, ecx
    test test eax, eax
    jbe sub_1007F686
L7:
    cmp cmp ecx, 4
    jbe sub_1007F671
    xor xor eax, eax
    jmp sub_1007F681
    mov mov ebx, dword ptr [ebp + 16]
    lea lea eax, [ecx + edi*4]
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov ebx, dword ptr [ebp - 8]
    mov mov dword ptr [edx], eax
    movzx movzx eax, word ptr [esi + 6]
    add add edx, 4
    inc inc ecx
    cmp cmp ecx, eax
L9:
    jb sub_1007F686
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 20]
    jb sub_1007F686
L12:
    jmp L24
    mov mov ecx, dword ptr [ebp + 20]
    movzx movzx eax, word ptr [esi + 8]
    shl shl ecx, 2
    cmp cmp ecx, eax
    mov mov dword ptr [ebp + 20], ecx
    jbe sub_1007F6E4
    mov mov dword ptr [ebp + 20], eax
    mov mov ax, word ptr [esi + 2]
    cmp cmp ax, 3
    je sub_1007F783
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx + 52]
    imul imul ecx, dword ptr [ebp + 20]
    movzx movzx eax, ax
    dec dec eax
    je sub_1007F764
    dec dec eax
    jne sub_1007F793
    fnstcw fnstcw word ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 16]
    or or eax, 0C00h
    mov mov dword ptr [ebp - 20], eax
    fldcw fldcw word ptr [ebp - 20]
    test test ecx, ecx
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 16], eax
    jbe sub_1007F77D
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, ebx
    sub sub edx, ebx
    fld fld dword ptr [edx + eax]
    fstp fstp dword ptr [ebp + 16]
    fld fld dword ptr [ebp + 16]
    fistp fistp dword ptr [ebp - 20]
    mov mov edi, dword ptr [ebp - 20]
    mov mov dword ptr [eax], edi
    add add eax, 4
    dec dec ecx
    jne sub_1007F784
    fldcw fldcw word ptr [ebp - 16]
    jmp sub_1007F7D1
    test test ecx, ecx
    jbe sub_1007F7D5
    mov mov edi, dword ptr [ebp - 4]
    mov mov edx, ebx
    sub sub edi, ebx
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [edx + edi]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1007F7E4
    xor xor eax, eax
    inc inc eax
    jmp sub_1007F7EB
    xor xor eax, eax
    mov mov dword ptr [edx], eax
    add add edx, 4
    dec dec ecx
    jne sub_1007F7DC
    mov mov dword ptr [ebp - 4], ebx
    mov mov eax, dword ptr [ebp + 8]
    mov mov ax, word ptr [eax + 8]
    test test ax, ax
    je sub_1007F8FB
    cmp cmp word ptr [esi], 3
    je sub_1007F839
    movzx movzx edx, word ptr [esi + 6]
    movzx movzx edi, word ptr [esi + 4]
    jmp sub_1007F84B
    movzx movzx edx, word ptr [esi + 4]
    movzx movzx edi, word ptr [esi + 6]
    test test dl, 3
    je sub_1007F91C
    cmp cmp ax, 1
    mov mov dword ptr [ebp - 16], 01010FE6Ch
    je sub_1007F886
    mov mov dword ptr [ebp - 16], 01010FE5Ch
    imul imul edi, dword ptr [ebp + 20]
    lea lea esi, [edx + 3]
    and and esi, -4
    test test edi, edi
    jbe sub_1007F93F
    lea lea ecx, [edi*4 + 4]
    mov mov eax, edx
    imul imul eax, ecx
L20:
    add add eax, dword ptr [ebp - 4]
    mov mov ecx, edi
    imul imul ecx, esi
    add add ecx, edx
L22:
    lea lea ecx, [ebx + ecx*4]
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, esi
    lea lea ebx, [edi*4 + 4]
    imul imul ecx, ebx
    add add ecx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 20], edi
    mov mov edi, esi
    shl shl edi, 2
    sub sub dword ptr [ebp - 12], edi
    sub sub ecx, edi
    mov mov edi, edx
    shl shl edi, 2
    sub sub eax, edi
    cmp cmp esi, edx
    mov mov dword ptr [ebp + 16], esi
    jbe sub_1007F95D
    mov mov dword ptr [ebp - 4], ecx
    dec dec dword ptr [ebp + 16]
    mov mov edi, dword ptr [ebp + 16]
    mov mov ebx, dword ptr [ebp - 16]
    sub sub dword ptr [ebp - 4], 4
    and and edi, 3
    cmp cmp dword ptr [ebp + 16], edx
    mov mov edi, dword ptr [ebx + edi*4]
L25:
    mov mov ebx, dword ptr [ebp - 4]
    mov mov dword ptr [ebx], edi
    ja sub_1007F960
    test test edx, edx
    jbe sub_1007F9A1
    mov mov edi, dword ptr [ebp - 12]
    mov mov dword ptr [ebp + 16], eax
    mov mov dword ptr [ebp - 4], edx
    sub sub dword ptr [ebp + 16], 4
    mov mov ebx, dword ptr [ebp + 16]
    mov mov ebx, dword ptr [ebx]
    sub sub edi, 4
    dec dec dword ptr [ebp - 4]
    mov mov dword ptr [edi], ebx
    jne sub_1007F9AA
    dec dec dword ptr [ebp - 20]
    jne sub_1007F96A
    mov mov ebx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], ebx
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ecx + 44]
L27:
    imul imul eax, dword ptr [ebp + 20]
    movzx movzx edx, word ptr [ecx + 12]
    cmp cmp eax, edx
    jbe sub_1007F9F9
    mov mov eax, edx
    push push eax
    movzx movzx eax, word ptr [ecx + 10]
    add add eax, dword ptr [ebp + 24]
    push push ebx
    push push dword ptr [ebp - 4]
    push push eax
    push push dword ptr [ebp + 12]
    call call dword ptr [ecx + 28]
    test test eax, eax
    jl sub_1007FA2B
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_1007f261 ENDP
END
