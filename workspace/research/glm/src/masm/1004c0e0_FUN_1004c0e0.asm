.686
.MODEL FLAT, C
EXTRN g_1019BCE0:DWORD
EXTRN g_1019BCE8:DWORD
EXTRN g_1019BCF0:DWORD
EXTRN g_1019BCF8:DWORD
EXTRN g_1019BD00:DWORD
EXTRN g_1019BD08:DWORD
.CODE
FUN_1004c0e0 PROC
    sub esp, 20
    push ebx
    push esi
    mov esi, dword ptr [esp + 32]
    mov edx, dword ptr [esi + 44]
    mov eax, dword ptr [esi + 0000001A4h]
    mov ecx, dword ptr [esi + 0000000CCh]
    xor ebx, ebx
    cmp edx, ebx
    mov dword ptr [esp + 12], ebx
    mov dword ptr [esp + 8], ebx
    mov dword ptr [esp + 16], ebx
    jle L14
    push ebp
    lea ebp, [eax + 44]
    push edi
    lea edi, [ecx + 36]
    mov dword ptr [esp + 28], ebp
    lea ebx, [ebx]
L0:
    mov eax, dword ptr [edi]
    dec eax
    cmp eax, 7
    ja L4
    jmp dword ptr [eax*4 + 0x1004c3f0]
    xor ebx, ebx
    mov dword ptr [esp + 16], 010054CE0h
    mov dword ptr [esp + 20], ebx
    jmp L6
    xor ebx, ebx
    mov dword ptr [esp + 16], 010054870h
    mov dword ptr [esp + 20], ebx
    jmp L6
    xor ebx, ebx
    mov dword ptr [esp + 16], 010054550h
    mov dword ptr [esp + 20], ebx
    jmp L6
    mov eax, dword ptr [esi + 76]
    sub eax, 0
    je L3
    dec eax
    je L2
    dec eax
    je L1
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 48
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    jmp L5
L1:
    mov ebx, 2
    mov dword ptr [esp + 16], 010053800h
    mov dword ptr [esp + 20], ebx
    jmp L6
L2:
    mov ebx, 1
    mov dword ptr [esp + 16], 010053C30h
    mov dword ptr [esp + 20], ebx
    jmp L6
L3:
    xor ebx, ebx
    mov dword ptr [esp + 16], 010054020h
    mov dword ptr [esp + 20], ebx
    jmp L6
L4:
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 7
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [edi]
    mov dword ptr [eax + 24], ecx
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
L5:
    add esp, 4
L6:
    mov eax, dword ptr [esp + 16]
    mov dword ptr [ebp - 40], eax
    mov al, byte ptr [edi + 12]
    test al, al
    je L13
    cmp dword ptr [ebp], ebx
    je L13
    mov eax, dword ptr [edi + 40]
    test eax, eax
    je L13
    mov ecx, ebx
    sub ecx, 0
    mov dword ptr [ebp], ebx
    je L11
    dec ecx
    je L9
    dec ecx
    je L7
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 48
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
    jmp L13
L7:
    mov ecx, dword ptr [edi + 44]
    mov edx, 010190DA8h
    mov edi, edi
L8:
    movzx ebp, word ptr [eax]
    mov dword ptr [esp + 32], ebp
    add eax, 2
    add ecx, 4
    fild dword ptr [esp + 32]
    add eax, 2
    add ecx, 4
    add eax, 2
    fmul qword ptr [edx]
    add ecx, 4
    fstp dword ptr [ecx - 12]
    movzx ebp, word ptr [eax - 4]
    mov dword ptr [esp + 32], ebp
    add eax, 2
    add ecx, 4
    fild dword ptr [esp + 32]
    add eax, 2
    add ecx, 4
    add eax, 2
    fmul qword ptr [edx]
    add ecx, 4
    add eax, 2
    add ecx, 4
    fmul qword ptr [g_1019BD08]
    add edx, 8
    fstp dword ptr [ecx - 24]
    movzx ebp, word ptr [eax - 10]
    mov dword ptr [esp + 32], ebp
    add eax, 2
    add ecx, 4
    cmp edx, 010190DE8h
    fild dword ptr [esp + 32]
    fmul qword ptr [edx - 8]
    fmul qword ptr [g_1019BD00]
    fstp dword ptr [ecx - 24]
    movzx ebp, word ptr [eax - 10]
    mov dword ptr [esp + 32], ebp
    fild dword ptr [esp + 32]
    fmul qword ptr [edx - 8]
    fmul qword ptr [g_1019BCF8]
    fstp dword ptr [ecx - 20]
    movzx ebp, word ptr [eax - 8]
    mov dword ptr [esp + 32], ebp
    fild dword ptr [esp + 32]
    fmul qword ptr [edx - 8]
    fstp dword ptr [ecx - 16]
    movzx ebp, word ptr [eax - 6]
    mov dword ptr [esp + 32], ebp
    fild dword ptr [esp + 32]
    fmul qword ptr [edx - 8]
    fmul qword ptr [g_1019BCF0]
    fstp dword ptr [ecx - 12]
    movzx ebp, word ptr [eax - 4]
    mov dword ptr [esp + 32], ebp
    fild dword ptr [esp + 32]
    fmul qword ptr [edx - 8]
    fmul qword ptr [g_1019BCE8]
    fstp dword ptr [ecx - 8]
    movzx ebp, word ptr [eax - 2]
    mov dword ptr [esp + 32], ebp
    fild dword ptr [esp + 32]
    fmul qword ptr [edx - 8]
    fmul qword ptr [g_1019BCE0]
    fstp dword ptr [ecx - 4]
    jl L8
    jmp L13
L9:
    mov ecx, dword ptr [edi + 44]
    lea edx, [ecx + 8]
    lea ecx, [eax + 4]
    mov esi, 010190D2Ah
    neg eax
L10:
    movsx ebp, word ptr [esi - 2]
    movzx ebx, word ptr [ecx - 4]
    imul ebx, ebp
    add ebx, 000000800h
    sar ebx, 12
    mov dword ptr [edx - 8], ebx
    movsx ebp, word ptr [esi]
    movzx ebx, word ptr [ecx - 2]
    imul ebx, ebp
    add ebx, 000000800h
    sar ebx, 12
    mov dword ptr [edx - 4], ebx
    movzx ebp, word ptr [ecx]
    movsx ebx, word ptr [eax + ecx + 010190D28h]
    imul ebx, ebp
    add ebx, 000000800h
    sar ebx, 12
    mov dword ptr [edx], ebx
    movsx ebx, word ptr [eax + ecx + 010190D2Ah]
    movzx ebp, word ptr [ecx + 2]
    imul ebx, ebp
    add ebx, 000000800h
    sar ebx, 12
    mov dword ptr [edx + 4], ebx
    add esi, 8
    add edx, 16
    add ecx, 8
    cmp esi, 010190DAAh
    jl L10
    mov ebx, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 40]
    jmp L13
L11:
    mov edx, dword ptr [edi + 44]
    xor ecx, ecx
L12:
    movzx ebp, word ptr [eax + ecx*2]
    mov dword ptr [edx + ecx*4], ebp
    inc ecx
    cmp ecx, 64
    jl L12
L13:
    mov eax, dword ptr [esp + 24]
    mov ebp, dword ptr [esp + 28]
    mov ecx, dword ptr [esi + 44]
    inc eax
    add ebp, 4
    add edi, 84
    cmp eax, ecx
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 28], ebp
    jl L0
    pop edi
    pop ebp
L14:
    pop esi
    pop ebx
    add esp, 20
    ret
FUN_1004c0e0 ENDP
END
