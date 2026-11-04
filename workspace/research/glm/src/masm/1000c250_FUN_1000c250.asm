.686
.MODEL FLAT, C
EXTRN sub_10017202:PROC
EXTRN fp_101D4C68:DWORD
EXTRN g_1019BD54:DWORD
EXTRN g_1019BF18:DWORD
EXTRN g_101D1B2C:DWORD
.CODE
FUN_1000c250 PROC
    test edi, edi
    mov eax, dword ptr [esp + 12]
    mov ecx, dword ptr [esp + 16]
    push ebp
    mov ebp, dword ptr [esp + 8]
    mov dword ptr [edx], 03F800000h
    mov dword ptr [eax], 03F800000h
    push esi
    mov dword ptr [ecx], 0
    je L0
    mov byte ptr [edi], 0
L0:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [eax]
    xor esi, esi
    test ecx, ecx
    jle L3
L1:
    xor ecx, ecx
    mov cx, word ptr [ebp + esi*2]
    mov eax, ecx
    movzx ecx, cx
    shr ecx, 8
    and eax, 0000000FFh
    add ecx, -13
    cmp ecx, 6
    mov dword ptr [esp + 12], eax
    ja L2
    jmp dword ptr [ecx*4 + 0x1000c368]
    test ebx, ebx
    je L2
    fild dword ptr [esp + 12]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [ebx]
    jmp L2
    test ebx, ebx
    je L2
    fild dword ptr [esp + 12]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [ebx + 4]
    jmp L2
    test ebx, ebx
    je L2
    fild dword ptr [esp + 12]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [ebx + 8]
    jmp L2
    fild dword ptr [esp + 12]
    fmul dword ptr [edx]
    fmul dword ptr [g_1019BF18]
    fstp dword ptr [edx]
    jmp L2
    test edi, edi
    fild dword ptr [esp + 12]
    fmul dword ptr [edx]
    fmul dword ptr [g_1019BF18]
    fstp dword ptr [edx]
    je L2
    mov byte ptr [edi], 1
    jmp L2
    fild dword ptr [esp + 12]
    mov eax, dword ptr [esp + 20]
    fmul dword ptr [eax]
    fmul dword ptr [g_1019BF18]
    fstp dword ptr [eax]
L2:
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [ecx]
    inc esi
    cmp esi, eax
    jl L1
L3:
    pop esi
    xor eax, eax
    pop ebp
    ret
    push eax
    inc esi
    call dword ptr [fp_101D4C68]
    mov cl, byte ptr [eax]
    add esp, 4
    test cl, cl
    jne L4
    mov eax, dword ptr [g_101D1B2C]
    jmp L5
L4:
    push 7
    call sub_10017202
    add esp, 4
L5:
    mov edx, dword ptr [esp + 24]
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 16]
    sub dword ptr [eax], esi
    lea eax, [ebp + esi*2]
    pop esi
    pop ebp
    ret
FUN_1000c250 ENDP
END
