.686
.MODEL FLAT, C
EXTRN sub_1003813E:PROC
EXTRN sub_1003D220:PROC
EXTRN sub_1003D70F:PROC
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
EXTRN g_1019BDB0:DWORD
EXTRN g_101CE674:DWORD
EXTRN g_101CE698:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D496A:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076668C:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003cc60 PROC
    sub esp, 8
    mov eax, dword ptr [g_1076668C]
    push ebx
    mov ebx, dword ptr [esp + 16]
    xor eax, ebx
    mov dword ptr [esp + 4], eax
    je sub_1003D220
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    test edx, edx
    je L0
    push ebx
    mov ebx, eax
    call sub_1003813E
    mov ebx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 8]
    add esp, 4
L0:
    test al, 1
    push esi
    push edi
    je L3
    mov esi, ebx
    and esi, 1
L1:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L2
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L2
    push 010199DA8h
    push 010193358h
    push eax
    call sub_100F6D74
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CB7
    add esp, 16
L2:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 14
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L1
    mov eax, dword ptr [esp + 12]
L3:
    test al, 2
    je L6
    mov esi, ebx
    shr esi, 1
    not esi
    and esi, 1
    jmp L4
    lea ebx, [ebx]
L4:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L5
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L5
    push 010199D38h
    push 010193358h
    push eax
    call sub_100F6DE0
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D23
    add esp, 16
L5:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 7
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L4
    mov eax, dword ptr [esp + 12]
L6:
    test bl, 2
    je L7
    mov edx, dword ptr [g_1076668C]
    and edx, 12
    or ebx, edx
    and eax, 0FFFFFFF3h
    mov dword ptr [esp + 12], eax
L7:
    test al, 12
    je L11
    mov eax, ebx
    and eax, 12
    cmp eax, 4
    jne L8
    mov esi, eax
    jmp L9
L8:
    xor ecx, ecx
    cmp eax, 8
    setne cl
    dec ecx
    and ecx, 0FFFFFFFBh
    add ecx, 8
    mov esi, ecx
L9:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L10
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L10
    push 010199D00h
    push 010193358h
    push eax
    call sub_100F6E71
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6DB4
    add esp, 16
L10:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 23
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L9
    mov eax, dword ptr [esp + 12]
L11:
    test al, 48
    je L18
    mov eax, dword ptr [g_101CE698]
    mov edx, ebx
    sar edx, 4
    and edx, 3
    mov dword ptr [esp + 24], edx
    fild dword ptr [esp + 24]
    fld st(0)
    fmul dword ptr [eax + 8]
    mov al, byte ptr [g_101D496A]
    test al, al
    fmul dword ptr [g_1019BDB0]
    fstp dword ptr [esp + 24]
    je L14
    mov ecx, dword ptr [g_101CE674]
    fmul dword ptr [ecx + 8]
    fstp dword ptr [esp + 16]
    mov esi, dword ptr [esp + 16]
    mov edi, edi
L12:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L13
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L13
    push 010199CB0h
    push 010193358h
    push eax
    call sub_100F6F10
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6E53
    add esp, 16
L13:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 0000000AFh
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L12
    jmp L15
L14:
    fstp st(0)
    fld dword ptr [esp + 24]
    fadd st(0), st(0)
    fstp dword ptr [esp + 24]
L15:
    mov esi, dword ptr [esp + 24]
    jmp L16
    lea ebx, [ebx]
L16:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L17
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L17
    push 010199C68h
    push 010193358h
    push eax
    call sub_100F6F80
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6EC3
    add esp, 16
L17:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 0000000C3h
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L16
    mov eax, dword ptr [esp + 12]
L18:
    test bl, 64
    je L21
    test al, 64
    je L25
    jmp L19
    lea esp, [esp]
L19:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L20
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L20
    push 010199C30h
    push 010193358h
    push eax
    call sub_100F6FF0
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6F33
    add esp, 16
L20:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 1
    push 52
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L19
    mov eax, dword ptr [esp + 12]
    jmp L25
L21:
    test al, 64
    je L24
    mov edi, edi
L22:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L23
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L23
    push 010199BF8h
    push 010193358h
    push eax
    call sub_100F7050
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6F93
    add esp, 16
L23:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 0
    push 52
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L22
    mov eax, dword ptr [esp + 12]
L24:
    mov edx, dword ptr [g_1076668C]
    and edx, 0FFFFFF80h
    or ebx, edx
    and eax, 127
    mov dword ptr [esp + 12], eax
L25:
    test bl, bl
    jns L28
    test al, al
    jns L32
L26:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L27
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L27
    push 010199BBCh
    push 010193358h
    push eax
    call sub_100F70C5
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F7009
    add esp, 16
L27:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 1
    push 0000000B9h
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L26
    mov eax, dword ptr [esp + 12]
    jmp L32
L28:
    test al, al
    jns L31
    jmp L29
    lea esp, [esp]
L29:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L30
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L30
    push 010199B80h
    push 010193358h
    push eax
    call sub_100F712F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F7073
    add esp, 16
L30:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 0
    push 0000000B9h
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L29
    mov eax, dword ptr [esp + 12]
L31:
    mov ecx, dword ptr [g_1076668C]
    and ecx, 0FFF00000h
    or ebx, ecx
    and eax, 0000FFFFFh
    mov dword ptr [esp + 12], eax
L32:
    test eax, 01FF1FF00h
    je L37
    xor edi, edi
    nop
L33:
    mov ecx, dword ptr [edi + 010190764h]
    mov edx, eax
    sar edx, cl
    test dl, 7
    je L36
    mov esi, ebx
    sar esi, cl
    and esi, 7
L34:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L35
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L35
    push 010199B18h
    push 010193358h
    push eax
    call sub_100F71C5
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F7109
    add esp, 16
L35:
    mov ecx, dword ptr [esi*4 + 010190724h]
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ecx
    mov ecx, dword ptr [edi + 010190768h]
    push ecx
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L34
    mov eax, dword ptr [esp + 12]
L36:
    add edi, 8
    cmp edi, 48
    jb L33
L37:
    test eax, 0E00E0000h
    je sub_1003D70F
    xor edi, edi
    mov ecx, dword ptr [edi + 010190794h]
    mov edx, eax
    sar edx, cl
    test dl, 7
    je sub_1003D714
    mov esi, ebx
    sar esi, cl
    and esi, 7
    jmp L38
    lea ebx, [ebx]
L38:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L39
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L39
    push 010199AA8h
    push 010193358h
    push eax
    call sub_100F725F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F71A3
    add esp, 16
L39:
    mov ecx, dword ptr [esi*4 + 010190744h]
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ecx
    mov ecx, dword ptr [edi + 010190798h]
    push ecx
    push eax
    call dword ptr [edx + 0xe4]
    mov eax, dword ptr [g_1076A830]
FUN_1003cc60 ENDP
END
