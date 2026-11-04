.686
.MODEL FLAT, C
EXTRN sub_1004C415:PROC
EXTRN sub_1004C425:PROC
EXTRN sub_1004C452:PROC
EXTRN sub_1004C470:PROC
EXTRN sub_1004C4C7:PROC
EXTRN sub_1004C4D0:PROC
EXTRN sub_1004C4D7:PROC
EXTRN sub_1004C4DB:PROC
EXTRN sub_1004C509:PROC
EXTRN sub_1004C5FC:PROC
EXTRN sub_1004C608:PROC
EXTRN sub_1004C694:PROC
EXTRN sub_1004C699:PROC
EXTRN EXTRN g_1019BCE0:DWORD:DWORD
EXTRN EXTRN g_1019BCE8:DWORD:DWORD
EXTRN EXTRN g_1019BCF0:DWORD:DWORD
EXTRN EXTRN g_1019BCF8:DWORD:DWORD
EXTRN EXTRN g_1019BD00:DWORD:DWORD
EXTRN EXTRN g_1019BD08:DWORD:DWORD
.CODE
FUN_1004c0e0 PROC
    sub sub esp, 20
    push push ebx
    push push esi
    mov mov esi, dword ptr [esp + 32]
    mov mov edx, dword ptr [esi + 44]
    mov mov eax, dword ptr [esi + 01A4h]
    mov mov ecx, dword ptr [esi + 0CCh]
    xor xor ebx, ebx
    cmp cmp edx, ebx
    mov mov dword ptr [esp + 12], ebx
    mov mov dword ptr [esp + 8], ebx
    mov mov dword ptr [esp + 16], ebx
    jle sub_1004C415
    push push ebp
    lea lea ebp, [eax + 44]
    push push edi
    lea lea edi, [ecx + 36]
    mov mov dword ptr [esp + 28], ebp
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [edi]
    dec dec eax
    cmp cmp eax, 7
    ja L0
    jmp jmp dword ptr [eax*4 + 01004C3F0h]
    xor xor ebx, ebx
    mov mov dword ptr [esp + 16], 010054CE0h
    mov mov dword ptr [esp + 20], ebx
    jmp L3
    xor xor ebx, ebx
    mov mov dword ptr [esp + 16], 010054870h
    mov mov dword ptr [esp + 20], ebx
    jmp L4
    xor xor ebx, ebx
    mov mov dword ptr [esp + 16], 010054550h
    mov mov dword ptr [esp + 20], ebx
    jmp L5
    mov mov eax, dword ptr [esi + 76]
    sub sub eax, 0
    je L3
    dec dec eax
    je L2
    dec dec eax
    je L1
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 48
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    jmp L6
    mov mov ebx, 2
    mov mov dword ptr [esp + 16], 010053800h
    mov mov dword ptr [esp + 20], ebx
    jmp L7
    mov mov ebx, 1
    mov mov dword ptr [esp + 16], 010053C30h
    mov mov dword ptr [esp + 20], ebx
    jmp L8
    xor xor ebx, ebx
    mov mov dword ptr [esp + 16], 010054020h
    mov mov dword ptr [esp + 20], ebx
    jmp L9
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 7
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [eax + 24], ecx
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov eax, dword ptr [esp + 16]
    mov mov dword ptr [ebp - 40], eax
    mov mov al, byte ptr [edi + 12]
    test test al, al
    je sub_1004C4C7
    cmp cmp dword ptr [ebp], ebx
    je sub_1004C4D0
    mov mov eax, dword ptr [edi + 40]
    test test eax, eax
    je sub_1004C4DB
    mov mov ecx, ebx
    sub sub ecx, 0
    mov mov dword ptr [ebp], ebx
    je sub_1004C4D7
L0:
    dec dec ecx
    je sub_1004C452
    dec dec ecx
    je L10
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 48
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    jmp sub_1004C509
    mov mov ecx, dword ptr [edi + 44]
    mov mov edx, 010190DA8h
    mov mov edi, edi
    movzx movzx ebp, word ptr [eax]
    mov mov dword ptr [esp + 32], ebp
    add add eax, 2
    add add ecx, 4
    fild fild dword ptr [esp + 32]
    add add eax, 2
    add add ecx, 4
    add add eax, 2
    fmul fmul qword ptr [edx]
    add add ecx, 4
    fstp fstp dword ptr [ecx - 12]
    movzx movzx ebp, word ptr [eax - 4]
    mov mov dword ptr [esp + 32], ebp
    add add eax, 2
    add add ecx, 4
    fild fild dword ptr [esp + 32]
    add add eax, 2
    add add ecx, 4
    add add eax, 2
    fmul fmul qword ptr [edx]
    add add ecx, 4
    add add eax, 2
    add add ecx, 4
    fmul fmul qword ptr [g_1019BD08]
    add add edx, 8
    fstp fstp dword ptr [ecx - 24]
    movzx movzx ebp, word ptr [eax - 10]
    mov mov dword ptr [esp + 32], ebp
    add add eax, 2
    add add ecx, 4
    cmp cmp edx, 010190DE8h
    fild fild dword ptr [esp + 32]
L8:
    fmul fmul qword ptr [edx - 8]
    fmul fmul qword ptr [g_1019BD00]
    fstp fstp dword ptr [ecx - 24]
    movzx movzx ebp, word ptr [eax - 10]
L9:
    mov mov dword ptr [esp + 32], ebp
    fild fild dword ptr [esp + 32]
    fmul fmul qword ptr [edx - 8]
    fmul fmul qword ptr [g_1019BCF8]
    fstp fstp dword ptr [ecx - 20]
    movzx movzx ebp, word ptr [eax - 8]
    mov mov dword ptr [esp + 32], ebp
    fild fild dword ptr [esp + 32]
    fmul fmul qword ptr [edx - 8]
    fstp fstp dword ptr [ecx - 16]
    movzx movzx ebp, word ptr [eax - 6]
    mov mov dword ptr [esp + 32], ebp
    fild fild dword ptr [esp + 32]
    fmul fmul qword ptr [edx - 8]
    fmul fmul qword ptr [g_1019BCF0]
    fstp fstp dword ptr [ecx - 12]
    movzx movzx ebp, word ptr [eax - 4]
    mov mov dword ptr [esp + 32], ebp
    fild fild dword ptr [esp + 32]
    fmul fmul qword ptr [edx - 8]
    fmul fmul qword ptr [g_1019BCE8]
    fstp fstp dword ptr [ecx - 8]
    movzx movzx ebp, word ptr [eax - 2]
    mov mov dword ptr [esp + 32], ebp
    fild fild dword ptr [esp + 32]
    fmul fmul qword ptr [edx - 8]
    fmul fmul qword ptr [g_1019BCE0]
    fstp fstp dword ptr [ecx - 4]
    jl sub_1004C470
    jmp sub_1004C608
    mov mov ecx, dword ptr [edi + 44]
    lea lea edx, [ecx + 8]
    lea lea ecx, [eax + 4]
    mov mov esi, 010190D2Ah
    neg neg eax
    movsx movsx ebp, word ptr [esi - 2]
    movzx movzx ebx, word ptr [ecx - 4]
    imul imul ebx, ebp
    add add ebx, 0800h
    sar sar ebx, 12
    mov mov dword ptr [edx - 8], ebx
    movsx movsx ebp, word ptr [esi]
    movzx movzx ebx, word ptr [ecx - 2]
    imul imul ebx, ebp
L10:
    add add ebx, 0800h
    sar sar ebx, 12
    mov mov dword ptr [edx - 4], ebx
    movzx movzx ebp, word ptr [ecx]
    movsx movsx ebx, word ptr [eax + ecx + 010190D28h]
    imul imul ebx, ebp
    add add ebx, 0800h
    sar sar ebx, 12
    mov mov dword ptr [edx], ebx
    movsx movsx ebx, word ptr [eax + ecx + 010190D2Ah]
    movzx movzx ebp, word ptr [ecx + 2]
    imul imul ebx, ebp
    add add ebx, 0800h
    sar sar ebx, 12
    mov mov dword ptr [edx + 4], ebx
    add add esi, 8
    add add edx, 16
    add add ecx, 8
    cmp cmp esi, 010190DAAh
    jl sub_1004C5FC
    mov mov ebx, dword ptr [esp + 20]
    mov mov esi, dword ptr [esp + 40]
    jmp sub_1004C694
    mov mov edx, dword ptr [edi + 44]
    xor xor ecx, ecx
    movzx movzx ebp, word ptr [eax + ecx*2]
    mov mov dword ptr [edx + ecx*4], ebp
    inc inc ecx
    cmp cmp ecx, 64
    jl sub_1004C699
    mov mov eax, dword ptr [esp + 24]
    mov mov ebp, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esi + 44]
    inc inc eax
    add add ebp, 4
    add add edi, 84
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [esp + 28], ebp
    jl sub_1004C425
    pop pop edi
    pop pop ebp
    pop pop esi
    pop pop ebx
    add add esp, 20
    ret ret
FUN_1004c0e0 ENDP
END
