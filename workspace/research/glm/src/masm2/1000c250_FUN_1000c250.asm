.686
.MODEL FLAT, C
EXTRN sub_1000C376:PROC
EXTRN sub_1000C381:PROC
EXTRN sub_1000C38F:PROC
EXTRN sub_1000C393:PROC
EXTRN sub_1000C3A2:PROC
EXTRN sub_1000C3A6:PROC
EXTRN sub_1000C3B5:PROC
EXTRN sub_1000C3C5:PROC
EXTRN sub_1000C3D7:PROC
EXTRN sub_1000C3DC:PROC
EXTRN sub_1000C43F:PROC
EXTRN sub_1000C450:PROC
EXTRN sub_10017202:PROC
EXTRN EXTRN fp_101D4C68:DWORD:DWORD
EXTRN EXTRN g_1019BD54:DWORD:DWORD
EXTRN EXTRN g_1019BF18:DWORD:DWORD
EXTRN EXTRN g_101D1B2C:DWORD:DWORD
.CODE
FUN_1000c250 PROC
    test test edi, edi
    mov mov eax, dword ptr [esp + 12]
    mov mov ecx, dword ptr [esp + 16]
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    mov mov dword ptr [edx], 03F800000h
    mov mov dword ptr [eax], 03F800000h
    push push esi
    mov mov dword ptr [ecx], 0
    je L0
    mov mov byte ptr [edi], 0
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [eax]
    xor xor esi, esi
    test test ecx, ecx
    jle L1
    xor xor ecx, ecx
    mov mov cx, word ptr [ebp + esi*2]
    mov mov eax, ecx
    movzx movzx ecx, cx
    shr shr ecx, 8
    and and eax, 0FFh
L0:
    add add ecx, -13
    cmp cmp ecx, 6
    mov mov dword ptr [esp + 12], eax
    ja sub_1000C376
    jmp jmp dword ptr [ecx*4 + 01000C368h]
    test test ebx, ebx
    je sub_1000C381
    fild fild dword ptr [esp + 12]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [ebx]
    jmp sub_1000C38F
    test test ebx, ebx
    je sub_1000C393
    fild fild dword ptr [esp + 12]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [ebx + 4]
    jmp sub_1000C3A2
    test test ebx, ebx
    je sub_1000C3A6
    fild fild dword ptr [esp + 12]
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [ebx + 8]
    jmp sub_1000C3B5
    fild fild dword ptr [esp + 12]
    fmul fmul dword ptr [edx]
    fmul fmul dword ptr [g_1019BF18]
    fstp fstp dword ptr [edx]
    jmp sub_1000C3C5
    test test edi, edi
    fild fild dword ptr [esp + 12]
    fmul fmul dword ptr [edx]
    fmul fmul dword ptr [g_1019BF18]
    fstp fstp dword ptr [edx]
    je sub_1000C3D7
    mov mov byte ptr [edi], 1
    jmp sub_1000C3DC
    fild fild dword ptr [esp + 12]
    mov mov eax, dword ptr [esp + 20]
    fmul fmul dword ptr [eax]
    fmul fmul dword ptr [g_1019BF18]
    fstp fstp dword ptr [eax]
    mov mov ecx, dword ptr [esp + 16]
    mov mov eax, dword ptr [ecx]
    inc inc esi
    cmp cmp esi, eax
    jl L1
    pop pop esi
    xor xor eax, eax
    pop pop ebp
    ret ret
    push push eax
    inc inc esi
    call dword ptr [fp_101D4C68]
    mov mov cl, byte ptr [eax]
    add add esp, 4
    test test cl, cl
    jne sub_1000C43F
    mov mov eax, dword ptr [g_101D1B2C]
    jmp sub_1000C450
    push push 7
    call sub_10017202
    add add esp, 4
    mov mov edx, dword ptr [esp + 24]
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [esp + 16]
    sub sub dword ptr [eax], esi
    lea lea eax, [ebp + esi*2]
L1:
    pop pop esi
    pop pop ebp
    ret ret
FUN_1000c250 ENDP
END
