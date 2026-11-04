.686
.MODEL FLAT, C
EXTRN sub_1001D7AB:PROC
EXTRN sub_1002CFB3:PROC
EXTRN fp_101D49D8:DWORD
EXTRN fp_101D49F8:DWORD
EXTRN fp_101D4B3C:DWORD
EXTRN fp_101D4B64:DWORD
EXTRN fp_101D4B74:DWORD
.CODE
FUN_1002a360 PROC
    sub esp, 24
    push ebx
    mov ebx, eax
    mov eax, 07F7FFFFFh
    mov dword ptr [edi], eax
    mov dword ptr [edi + 4], eax
    mov dword ptr [edi + 8], eax
    mov eax, dword ptr [esp + 32]
    mov ecx, 0FF7FFFFFh
    push ebp
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 8], ecx
    lea eax, [esp + 28]
    push eax
    push 0
    lea ecx, [esp + 32]
    push ecx
    push ebx
    call dword ptr [fp_101D4B3C]
    push 000002000h
    mov dword ptr [esp + 36], eax
    call dword ptr [fp_101D49D8]
    push 00000FF78h
    mov dword ptr [esp + 36], eax
    call dword ptr [fp_101D49D8]
    push ebx
    mov dword ptr [esp + 48], eax
    call dword ptr [fp_101D4B64]
    push ebx
    mov ebp, eax
    call dword ptr [fp_101D4B74]
    add esp, 32
    test ebp, ebp
    mov ebx, eax
    jle L1
    mov edx, dword ptr [esp + 12]
    mov dword ptr [esp + 8], edx
    jmp L0
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [esp + 8]
    mov ecx, ebx
    call sub_1001D7AB
    mov edx, dword ptr [esp + 8]
    add edx, 64
    add ebx, 32
    dec ebp
    mov dword ptr [esp + 8], edx
    jne L0
L1:
    mov eax, dword ptr [esp + 16]
    test eax, eax
    mov dword ptr [esp + 8], 0
    jle L14
L2:
    mov ebp, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 8]
    mov edx, dword ptr [esp + 12]
    mov eax, dword ptr [eax + ecx*4]
    movsx ebx, word ptr [eax + 2]
    push 0
    push 0
    push ebp
    push edx
    push eax
    call sub_1002CFB3
    add esp, 20
    test ebx, ebx
    jle L13
    lea ecx, [ebp + 4]
L3:
    fld dword ptr [esi + 12]
    fmul dword ptr [ecx]
    fld dword ptr [ecx - 4]
    fmul dword ptr [esi]
    faddp st(1)
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 24]
    faddp st(1)
    fcom dword ptr [edi]
    fnstsw ax
    test ah, 5
    jp L4
    fst dword ptr [edi]
L4:
    mov edx, dword ptr [esp + 36]
    fcom dword ptr [edx]
    fnstsw ax
    test ah, 65
    jne L5
    fstp dword ptr [edx]
    jmp L6
L5:
    fstp st(0)
L6:
    fld dword ptr [ecx]
    fmul dword ptr [esi + 16]
    fld dword ptr [esi + 28]
    fmul dword ptr [ecx + 4]
    faddp st(1)
    fld dword ptr [ecx - 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fcom dword ptr [edi + 4]
    fnstsw ax
    test ah, 5
    jp L7
    fst dword ptr [edi + 4]
L7:
    fcom dword ptr [edx + 4]
    fnstsw ax
    test ah, 65
    jne L8
    fstp dword ptr [edx + 4]
    jmp L9
L8:
    fstp st(0)
L9:
    fld dword ptr [esi + 20]
    fmul dword ptr [ecx]
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 32]
    faddp st(1)
    fld dword ptr [ecx - 4]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fcom dword ptr [edi + 8]
    fnstsw ax
    test ah, 5
    jp L10
    fst dword ptr [edi + 8]
L10:
    fcom dword ptr [edx + 8]
    fnstsw ax
    test ah, 65
    jne L11
    fstp dword ptr [edx + 8]
    jmp L12
L11:
    fstp st(0)
L12:
    add ecx, 12
    dec ebx
    jne L3
L13:
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [esp + 16]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 8], eax
    jl L2
    jmp L15
L14:
    mov ebp, dword ptr [esp + 20]
L15:
    push ebp
    call dword ptr [fp_101D49F8]
    mov eax, dword ptr [esp + 16]
    push eax
    call dword ptr [fp_101D49F8]
    add esp, 8
    pop ebp
    pop ebx
FUN_1002a360 ENDP
END
