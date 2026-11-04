.686
.MODEL FLAT, C
EXTRN sub_1001D7AB:PROC
EXTRN sub_1002A55E:PROC
EXTRN sub_1002A57E:PROC
EXTRN sub_1002A584:PROC
EXTRN sub_1002A5A8:PROC
EXTRN sub_1002A5AA:PROC
EXTRN sub_1002A5C1:PROC
EXTRN sub_1002A5C4:PROC
EXTRN sub_1002A5C7:PROC
EXTRN sub_1002A5E3:PROC
EXTRN sub_1002A5EA:PROC
EXTRN sub_1002A62D:PROC
EXTRN sub_1002A649:PROC
EXTRN sub_1002A650:PROC
EXTRN sub_1002A698:PROC
EXTRN sub_1002CFB3:PROC
EXTRN EXTRN fp_101D49D8:DWORD:DWORD
EXTRN EXTRN fp_101D49F8:DWORD:DWORD
EXTRN EXTRN fp_101D4B3C:DWORD:DWORD
EXTRN EXTRN fp_101D4B64:DWORD:DWORD
EXTRN EXTRN fp_101D4B74:DWORD:DWORD
.CODE
FUN_1002a360 PROC
    sub sub esp, 24
    push push ebx
    mov mov ebx, eax
    mov mov eax, 07F7FFFFFh
    mov mov dword ptr [edi], eax
    mov mov dword ptr [edi + 4], eax
    mov mov dword ptr [edi + 8], eax
    mov mov eax, dword ptr [esp + 32]
    mov mov ecx, 0FF7FFFFFh
    push push ebp
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [eax + 4], ecx
    mov mov dword ptr [eax + 8], ecx
    lea lea eax, [esp + 28]
    push push eax
    push push 0
    lea lea ecx, [esp + 32]
    push push ecx
    push push ebx
    call dword ptr [fp_101D4B3C]
    push push 02000h
    mov mov dword ptr [esp + 36], eax
    call dword ptr [fp_101D49D8]
    push push 0FF78h
    mov mov dword ptr [esp + 36], eax
    call dword ptr [fp_101D49D8]
    push push ebx
    mov mov dword ptr [esp + 48], eax
    call dword ptr [fp_101D4B64]
    push push ebx
    mov mov ebp, eax
    call dword ptr [fp_101D4B74]
    add add esp, 32
    test test ebp, ebp
    mov mov ebx, eax
    jle L1
    mov mov edx, dword ptr [esp + 12]
    mov mov dword ptr [esp + 8], edx
    jmp L0
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 8]
    mov mov ecx, ebx
    call sub_1001D7AB
    mov mov edx, dword ptr [esp + 8]
    add add edx, 64
    add add ebx, 32
    dec dec ebp
    mov mov dword ptr [esp + 8], edx
    jne L2
    mov mov eax, dword ptr [esp + 16]
    test test eax, eax
    mov mov dword ptr [esp + 8], 0
    jle sub_1002A5AA
    mov mov ebp, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, dword ptr [esp + 8]
    mov mov edx, dword ptr [esp + 12]
    mov mov eax, dword ptr [eax + ecx*4]
    movsx movsx ebx, word ptr [eax + 2]
    push push 0
    push push 0
    push push ebp
    push push edx
    push push eax
    call sub_1002CFB3
    add add esp, 20
    test test ebx, ebx
    jle sub_1002A5C1
    lea lea ecx, [ebp + 4]
    fld fld dword ptr [esi + 12]
    fmul fmul dword ptr [ecx]
    fld fld dword ptr [ecx - 4]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [esi + 24]
    faddp faddp st(1)
    fcom fcom dword ptr [edi]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1002A55E
    fst fst dword ptr [edi]
    mov mov edx, dword ptr [esp + 36]
    fcom fcom dword ptr [edx]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1002A57E
    fstp fstp dword ptr [edx]
L1:
    jmp sub_1002A584
    fstp fstp st(0)
    fld fld dword ptr [ecx]
    fmul fmul dword ptr [esi + 16]
    fld fld dword ptr [esi + 28]
    fmul fmul dword ptr [ecx + 4]
    faddp faddp st(1)
    fld fld dword ptr [ecx - 4]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fcom fcom dword ptr [edi + 4]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1002A5C7
    fst fst dword ptr [edi + 4]
    fcom fcom dword ptr [edx + 4]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1002A5E3
    fstp fstp dword ptr [edx + 4]
    jmp sub_1002A5EA
    fstp fstp st(0)
    fld fld dword ptr [esi + 20]
    fmul fmul dword ptr [ecx]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [esi + 32]
    faddp faddp st(1)
    fld fld dword ptr [ecx - 4]
    fmul fmul dword ptr [esi + 8]
    faddp faddp st(1)
    fcom fcom dword ptr [edi + 8]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1002A62D
    fst fst dword ptr [edi + 8]
    fcom fcom dword ptr [edx + 8]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_1002A649
    fstp fstp dword ptr [edx + 8]
    jmp sub_1002A650
    fstp fstp st(0)
    add add ecx, 12
    dec dec ebx
    jne sub_1002A5C4
    mov mov eax, dword ptr [esp + 8]
    mov mov ecx, dword ptr [esp + 16]
    inc inc eax
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 8], eax
    jl sub_1002A5A8
    jmp sub_1002A698
    mov mov ebp, dword ptr [esp + 20]
    push push ebp
    call dword ptr [fp_101D49F8]
    mov mov eax, dword ptr [esp + 16]
    push push eax
    call dword ptr [fp_101D49F8]
    add add esp, 8
    pop pop ebp
    pop pop ebx
FUN_1002a360 ENDP
END
