.686
.MODEL FLAT, C
EXTRN sub_1007F2A7:PROC
EXTRN sub_1007F2B8:PROC
EXTRN sub_1007F2C8:PROC
EXTRN sub_1007F2D1:PROC
EXTRN sub_1007F2D9:PROC
EXTRN sub_1007F2DE:PROC
EXTRN sub_1007F2E8:PROC
EXTRN sub_1007F2FA:PROC
EXTRN sub_1007F326:PROC
EXTRN sub_1007F327:PROC
EXTRN sub_1007F32B:PROC
EXTRN sub_1007F333:PROC
EXTRN sub_1007F33B:PROC
EXTRN sub_1007F342:PROC
EXTRN sub_1007F390:PROC
EXTRN sub_1007F3A2:PROC
EXTRN sub_1007F3DD:PROC
EXTRN sub_1007F453:PROC
EXTRN sub_1007F474:PROC
EXTRN sub_1007F497:PROC
EXTRN sub_1007F4B0:PROC
EXTRN sub_1007F4B3:PROC
EXTRN sub_1007F4BC:PROC
EXTRN sub_1007F4F5:PROC
EXTRN sub_1007F4FD:PROC
EXTRN sub_1007F54C:PROC
EXTRN sub_1007F582:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
.CODE
FUN_1007ef30 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebx + 32]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp + 16]
    push push esi
    mov mov esi, dword ptr [ebx + 24]
    mov mov dword ptr [ebp - 4], eax
    movzx movzx eax, word ptr [esi]
    xor xor ecx, ecx
    sub sub eax, ecx
    push push edi
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
    jmp sub_1007F2A7
    mov mov eax, dword ptr [ebp + 20]
    xor xor edx, edx
    div div dword ptr [ebx + 52]
    mov mov dword ptr [ebp + 20], eax
    movzx movzx eax, word ptr [esi + 8]
    cmp cmp dword ptr [ebp + 20], eax
    jbe L2
    mov mov dword ptr [ebp + 20], eax
    cmp cmp dword ptr [ebp + 20], ecx
    mov mov dword ptr [ebp + 8], ecx
    jbe sub_1007F2C8
    jmp L3
    xor xor ecx, ecx
    cmp cmp word ptr [esi + 10], cx
    mov mov dword ptr [ebp + 16], ecx
    jbe L5
    push push dword ptr [ebp + 24]
    mov mov eax, dword ptr [ebx + 56]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov edi, dword ptr [eax + ecx*4]
    push push dword ptr [edi + 48]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp + 12]
    push push ebx
    call L1
L1:
    test test eax, eax
    jl sub_1007F2FA
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi + 48]
    lea lea eax, [ecx + eax*4]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [edi + 40]
    add add dword ptr [ebp + 24], eax
    movzx movzx eax, word ptr [esi + 10]
    inc inc dword ptr [ebp + 16]
    cmp cmp dword ptr [ebp + 16], eax
    jb L5
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [ebp + 20]
    jb L5
    jmp sub_1007F326
    movzx movzx ecx, word ptr [esi + 4]
    movzx movzx eax, word ptr [esi + 6]
    mov mov edi, ecx
    imul imul edi, eax
    mov mov eax, dword ptr [ebp + 20]
    xor xor edx, edx
    div div edi
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
    movzx movzx edi, word ptr [esi + 6]
    add add ecx, eax
    imul imul ecx, edi
    add add ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [edi + ecx*4]
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
    jbe L16
    mov mov dword ptr [ebp + 20], eax
    mov mov ax, word ptr [esi + 2]
    cmp cmp ax, 3
    je sub_1007F2DE
    mov mov ecx, dword ptr [ebx + 52]
    imul imul ecx, dword ptr [ebp + 20]
    movzx movzx eax, ax
    dec dec eax
L8:
    je sub_1007F2B8
    dec dec eax
    jne sub_1007F2E8
    fnstcw fnstcw word ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 16]
    or or eax, 0C00h
    mov mov dword ptr [ebp - 20], eax
    fldcw fldcw word ptr [ebp - 20]
    test test ecx, ecx
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 16], eax
    jbe sub_1007F2D1
    mov mov eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 4]
    sub sub edx, eax
    fld fld dword ptr [edx + eax]
    fstp fstp dword ptr [ebp + 16]
    fld fld dword ptr [ebp + 16]
    fistp fistp dword ptr [ebp - 20]
    mov mov edi, dword ptr [ebp - 20]
    mov mov dword ptr [eax], edi
    add add eax, 4
    dec dec ecx
    jne sub_1007F2D9
    fldcw fldcw word ptr [ebp - 16]
    jmp sub_1007F327
    test test ecx, ecx
    jbe sub_1007F32B
    mov mov edx, dword ptr [ebp - 8]
    mov mov edi, dword ptr [ebp - 4]
    sub sub edi, edx
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [edx + edi]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1007F33B
    xor xor eax, eax
    inc inc eax
    jmp sub_1007F342
    xor xor eax, eax
    mov mov dword ptr [edx], eax
    add add edx, 4
    dec dec ecx
    jne sub_1007F333
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], eax
    mov mov ax, word ptr [ebx + 8]
    test test ax, ax
    je sub_1007F453
    cmp cmp word ptr [esi], 3
    je sub_1007F390
    movzx movzx edx, word ptr [esi + 6]
    movzx movzx edi, word ptr [esi + 4]
    jmp sub_1007F3A2
    movzx movzx edx, word ptr [esi + 4]
    movzx movzx edi, word ptr [esi + 6]
    test test dl, 3
    je sub_1007F474
    cmp cmp ax, 1
L12:
    mov mov dword ptr [ebp - 16], 01010FE4Ch
    je sub_1007F3DD
    mov mov dword ptr [ebp - 16], 01010FE3Ch
    imul imul edi, dword ptr [ebp + 20]
    lea lea esi, [edx + 3]
    and and esi, -4
    test test edi, edi
    mov mov dword ptr [ebp + 16], edi
    jbe sub_1007F497
    mov mov ebx, dword ptr [ebp - 8]
    lea lea ecx, [edi*4 + 4]
    imul imul edi, esi
    mov mov eax, ecx
    imul imul ecx, esi
    imul imul eax, edx
    add add eax, dword ptr [ebp - 4]
    add add edi, edx
    add add ecx, ebx
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [ebp + 16]
    lea lea edi, [ebx + edi*4]
    mov mov dword ptr [ebp - 20], ecx
    mov mov ebx, esi
    shl shl ebx, 2
    sub sub dword ptr [ebp - 12], ebx
    mov mov ecx, edx
    shl shl ecx, 2
    sub sub edi, ebx
    sub sub eax, ecx
    cmp cmp esi, edx
    mov mov dword ptr [ebp + 16], esi
    jbe sub_1007F4B0
    mov mov ecx, dword ptr [ebp - 12]
    dec dec dword ptr [ebp + 16]
    mov mov ebx, dword ptr [ebp - 16]
    sub sub ecx, 4
    mov mov dword ptr [ebp - 4], ecx
    mov mov ecx, dword ptr [ebp + 16]
    and and ecx, 3
L13:
    cmp cmp dword ptr [ebp + 16], edx
    mov mov ebx, dword ptr [ebx + ecx*4]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx], ebx
    ja sub_1007F4B3
    test test edx, edx
    jbe sub_1007F4F5
    mov mov ecx, edi
    mov mov dword ptr [ebp + 16], eax
    mov mov dword ptr [ebp - 4], edx
    sub sub dword ptr [ebp + 16], 4
    mov mov ebx, dword ptr [ebp + 16]
    mov mov ebx, dword ptr [ebx]
    sub sub ecx, 4
    dec dec dword ptr [ebp - 4]
    mov mov dword ptr [ecx], ebx
    jne sub_1007F4FD
    dec dec dword ptr [ebp - 20]
    jne sub_1007F4BC
    mov mov ebx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebx + 44]
    imul imul eax, dword ptr [ebp + 20]
    movzx movzx ecx, word ptr [ebx + 12]
    cmp cmp eax, ecx
    jbe sub_1007F54C
L16:
    mov mov eax, ecx
    push push eax
    push push dword ptr [ebp - 8]
    movzx movzx eax, word ptr [ebx + 10]
    push push dword ptr [ebp - 4]
    add add eax, dword ptr [ebp + 24]
    push push eax
    push push dword ptr [ebp + 12]
    call call dword ptr [ebx + 28]
    test test eax, eax
    jl sub_1007F582
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_1007ef30 ENDP
END
