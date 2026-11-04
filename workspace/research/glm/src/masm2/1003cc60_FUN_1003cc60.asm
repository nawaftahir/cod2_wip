.686
.MODEL FLAT, C
EXTRN sub_1003813E:PROC
EXTRN sub_1003D220:PROC
EXTRN sub_1003D226:PROC
EXTRN sub_1003D229:PROC
EXTRN sub_1003D234:PROC
EXTRN sub_1003D2A1:PROC
EXTRN sub_1003D2E6:PROC
EXTRN sub_1003D2F4:PROC
EXTRN sub_1003D2F6:PROC
EXTRN sub_1003D304:PROC
EXTRN sub_1003D3D1:PROC
EXTRN sub_1003D3DF:PROC
EXTRN sub_1003D3E1:PROC
EXTRN sub_1003D3E3:PROC
EXTRN sub_1003D459:PROC
EXTRN sub_1003D468:PROC
EXTRN sub_1003D4A5:PROC
EXTRN sub_1003D4B2:PROC
EXTRN sub_1003D4B3:PROC
EXTRN sub_1003D4B7:PROC
EXTRN sub_1003D4C5:PROC
EXTRN sub_1003D5D1:PROC
EXTRN sub_1003D5DF:PROC
EXTRN sub_1003D5E2:PROC
EXTRN sub_1003D5E5:PROC
EXTRN sub_1003D5E8:PROC
EXTRN sub_1003D5EB:PROC
EXTRN sub_1003D6BA:PROC
EXTRN sub_1003D705:PROC
EXTRN sub_1003D70F:PROC
EXTRN sub_1003D713:PROC
EXTRN sub_1003D714:PROC
EXTRN sub_100F6CB7:PROC
EXTRN sub_100F6D23:PROC
EXTRN sub_100F6D74:PROC
EXTRN sub_100F6DB4:PROC
EXTRN sub_100F6DE0:PROC
EXTRN sub_100F6E53:PROC
EXTRN sub_100F6E71:PROC
EXTRN sub_100F6EC3:PROC
EXTRN sub_100F6F10:PROC
EXTRN sub_100F6F33:PROC
EXTRN sub_100F6F80:PROC
EXTRN sub_100F6F93:PROC
EXTRN sub_100F6FF0:PROC
EXTRN sub_100F7009:PROC
EXTRN sub_100F7050:PROC
EXTRN sub_100F7073:PROC
EXTRN sub_100F70C5:PROC
EXTRN sub_100F7109:PROC
EXTRN sub_100F712F:PROC
EXTRN sub_100F71A3:PROC
EXTRN sub_100F71C5:PROC
EXTRN sub_100F725F:PROC
EXTRN EXTRN g_1019BDB0:DWORD:DWORD
EXTRN EXTRN g_101CE674:DWORD:DWORD
EXTRN EXTRN g_101CE698:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D496A:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076668C:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003cc60 PROC
    sub sub esp, 8
    mov mov eax, dword ptr [g_1076668C]
    push push ebx
    mov mov ebx, dword ptr [esp + 16]
    xor xor eax, ebx
    mov mov dword ptr [esp + 4], eax
    je sub_1003D220
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    test test edx, edx
    je L0
    push push ebx
    mov mov ebx, eax
    call sub_1003813E
    mov mov ebx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 8]
    add add esp, 4
    test test al, 1
    push push esi
    push push edi
    je L2
    mov mov esi, ebx
    and and esi, 1
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L1
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L4
L0:
    push push 010199DA8h
    push push 010193358h
    push push eax
    call sub_100F6D74
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CB7
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 14
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L3
    mov mov eax, dword ptr [esp + 12]
    test test al, 2
    je L6
    mov mov esi, ebx
    shr shr esi, 1
    not not esi
    and and esi, 1
    jmp L5
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L6
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L8
    push push 010199D38h
    push push 010193358h
    push push eax
    call sub_100F6DE0
L3:
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D23
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 7
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L7
    mov mov eax, dword ptr [esp + 12]
    test test bl, 2
    je L9
    mov mov edx, dword ptr [g_1076668C]
    and and edx, 12
    or or ebx, edx
    and and eax, -13
    mov mov dword ptr [esp + 12], eax
    test test al, 12
    je L12
    mov mov eax, ebx
    and and eax, 12
    cmp cmp eax, 4
    jne L10
    mov mov esi, eax
    jmp L11
    xor xor ecx, ecx
    cmp cmp eax, 8
    setne setne cl
    dec dec ecx
    and and ecx, -5
    add add ecx, 8
    mov mov esi, ecx
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L13
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
L5:
    je L15
    push push 010199D00h
    push push 010193358h
    push push eax
    call sub_100F6E71
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6DB4
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 23
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L14
    mov mov eax, dword ptr [esp + 12]
    test test al, 48
    je L20
    mov mov eax, dword ptr [g_101CE698]
    mov mov edx, ebx
    sar sar edx, 4
    and and edx, 3
    mov mov dword ptr [esp + 24], edx
    fild fild dword ptr [esp + 24]
    fld fld st(0)
    fmul fmul dword ptr [eax + 8]
    mov mov al, byte ptr [g_101D496A]
    test test al, al
    fmul fmul dword ptr [g_1019BDB0]
    fstp fstp dword ptr [esp + 24]
    je L16
    mov mov ecx, dword ptr [g_101CE674]
    fmul fmul dword ptr [ecx + 8]
    fstp fstp dword ptr [esp + 16]
    mov mov esi, dword ptr [esp + 16]
    mov mov edi, edi
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L17
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L18
    push push 010199CB0h
    push push 010193358h
    push push eax
    call sub_100F6F10
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6E53
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 0AFh
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L19
    jmp L21
    fstp fstp st(0)
    fld fld dword ptr [esp + 24]
    fadd fadd st(0), st(0)
    fstp fstp dword ptr [esp + 24]
    mov mov esi, dword ptr [esp + 24]
    jmp L22
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L23
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L24
    push push 010199C68h
    push push 010193358h
    push push eax
    call sub_100F6F80
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6EC3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 0C3h
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L25
    mov mov eax, dword ptr [esp + 12]
    test test bl, 64
    je sub_1003D229
    test test al, 64
    je sub_1003D2A1
    jmp L26
    lea lea esp, [esp]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003D226
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D234
    push push 010199C30h
    push push 010193358h
    push push eax
    call sub_100F6FF0
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6F33
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 1
    push push 52
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D234
    mov mov eax, dword ptr [esp + 12]
    jmp sub_1003D304
    test test al, 64
    je sub_1003D2F6
    mov mov edi, edi
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003D2E6
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D2F4
    push push 010199BF8h
    push push 010193358h
    push push eax
    call sub_100F7050
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6F93
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 0
    push push 52
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D2F4
    mov mov eax, dword ptr [esp + 12]
    mov mov edx, dword ptr [g_1076668C]
    and and edx, -128
    or or ebx, edx
    and and eax, 127
    mov mov dword ptr [esp + 12], eax
    test test bl, bl
    jns sub_1003D3E1
    test test al, al
    jns sub_1003D468
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003D3D1
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D3DF
    push push 010199BBCh
    push push 010193358h
    push push eax
    call sub_100F70C5
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F7009
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push 1
    push push 0B9h
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D3E3
    mov mov eax, dword ptr [esp + 12]
    jmp sub_1003D4C5
    test test al, al
    jns sub_1003D4B2
    jmp sub_1003D459
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
L16:
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003D4A5
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
L19:
    test test cl, cl
    je sub_1003D4B3
    push push 010199B80h
    push push 010193358h
    push push eax
    call sub_100F712F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F7073
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push 0
    push push 0B9h
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D4B7
    mov mov eax, dword ptr [esp + 12]
    mov mov ecx, dword ptr [g_1076668C]
    and and ecx, 0FFF00000h
    or or ebx, ecx
    and and eax, 0FFFFFh
    mov mov dword ptr [esp + 12], eax
    test test eax, 01FF1FF00h
    je sub_1003D5E2
    xor xor edi, edi
    nop nop
    mov mov ecx, dword ptr [edi + 010190764h]
    mov mov edx, eax
    sar sar edx, cl
    test test dl, 7
    je sub_1003D5E8
    mov mov esi, ebx
    sar sar esi, cl
    and and esi, 7
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003D5D1
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D5DF
    push push 010199B18h
    push push 010193358h
    push push eax
    call sub_100F71C5
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F7109
    add add esp, 16
    mov mov ecx, dword ptr [esi*4 + 010190724h]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ecx
    mov mov ecx, dword ptr [edi + 010190768h]
    push push ecx
    push push eax
L23:
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D5EB
    mov mov eax, dword ptr [esp + 12]
    add add edi, 8
    cmp cmp edi, 48
    jb sub_1003D5E5
    test test eax, 0E00E0000h
    je sub_1003D70F
    xor xor edi, edi
    mov mov ecx, dword ptr [edi + 010190794h]
    mov mov edx, eax
    sar sar edx, cl
    test test dl, 7
    je sub_1003D714
    mov mov esi, ebx
    sar sar esi, cl
    and and esi, 7
    jmp sub_1003D6BA
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003D705
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D713
    push push 010199AA8h
    push push 010193358h
    push push eax
    call sub_100F725F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F71A3
    add add esp, 16
    mov mov ecx, dword ptr [esi*4 + 010190744h]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ecx
    mov mov ecx, dword ptr [edi + 010190798h]
    push push ecx
    push push eax
    call call dword ptr [edx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
FUN_1003cc60 ENDP
END
