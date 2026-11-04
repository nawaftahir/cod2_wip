.686
.MODEL FLAT, C
EXTRN sub_100F916A:PROC
EXTRN sub_100F916D:PROC
EXTRN sub_100F917B:PROC
EXTRN sub_100F91BA:PROC
EXTRN sub_100F926E:PROC
EXTRN sub_100F9273:PROC
EXTRN sub_100F92A1:PROC
EXTRN sub_100F92E9:PROC
EXTRN sub_10102F59:PROC
EXTRN sub_10102F65:PROC
EXTRN sub_10102F84:PROC
EXTRN sub_10102FA4:PROC
EXTRN sub_10103015:PROC
EXTRN sub_10103036:PROC
EXTRN sub_10103052:PROC
EXTRN sub_10103053:PROC
EXTRN sub_10103091:PROC
EXTRN sub_101030FA:PROC
EXTRN sub_1010315E:PROC
EXTRN sub_10103165:PROC
EXTRN sub_1010316E:PROC
EXTRN sub_10103F9D:PROC
EXTRN EXTRN g_101A4838:DWORD:DWORD
EXTRN EXTRN g_101A5230:DWORD:DWORD
EXTRN EXTRN g_101A5260:DWORD:DWORD
EXTRN EXTRN g_101ADD90:DWORD:DWORD
.CODE
FUN_100f8f7d PROC
    mov mov ecx, eax
    push push eax
    wait wait
    fnstcw fnstcw word ptr [esp]
    cmp cmp word ptr [esp], 027Fh
    je L0
    call sub_10102F59
    and and ecx, 07FF00000h
    lea lea edx, [esp + 8]
    cmp cmp ecx, 07FF00000h
    je L2
    call sub_10102FA4
    je L3
    test test eax, 07FF00000h
    je L9
    mov mov cl, byte ptr [esp + 15]
    and and cl, 080h
    jne sub_100F916A
    fyl2x fyl2x
    call sub_10102F84
    cmp cmp cl, 1
    jne L1
    fchs fchs
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_10103036
    lea lea ecx, [g_101A4838]
    mov mov edx, 29
    jmp sub_10103091
    cmp cmp dword ptr [g_101ADD90], 0
    jne sub_10103053
    lea lea ecx, [g_101A4838]
    mov mov edx, 29
    call sub_10102F65
    pop pop edx
    ret ret
    lea lea edx, [esp + 8]
    call sub_10103015
    test test byte ptr [esp + 22], 8
    jne L6
    inc inc ecx
    jmp L10
    faddp faddp st(1)
    mov mov eax, 1
    jmp L4
    test test byte ptr [esp + 14], 8
    jne L7
    faddp faddp st(1)
    mov mov eax, 7
    jmp L5
    xor xor ecx, ecx
    jmp L12
    xor xor ecx, ecx
    and and eax, 0FFFFFh
    or or eax, dword ptr [esp + 16]
    jne L8
    lea lea edx, [esp + 8]
    call sub_10103052
    mov mov eax, dword ptr [esp + 12]
    mov mov edx, eax
    and and eax, 07FF00000h
    and and edx, 0FFFFFh
    cmp cmp eax, 07FF00000h
    jne sub_100F916D
    or or edx, dword ptr [esp + 8]
    jne L13
    test test ecx, ecx
    jne L14
    sub sub esp, 116
    mov mov ecx, esp
    push push ecx
    sub sub esp, 16
    fstp fstp qword ptr [esp]
    fstp fstp qword ptr [esp + 8]
    wait wait
    fnsave fnsave dword ptr [ecx + 8]
    call sub_10103F9D
    add add esp, 16
    pop pop ecx
    frstor frstor dword ptr [ecx + 8]
    fld fld qword ptr [ecx]
    add add esp, 116
    test test eax, eax
    je sub_101030FA
    mov mov eax, 1
    jmp L13
    mov mov eax, dword ptr [esp + 12]
    and and eax, 0FFFFFh
    or or eax, dword ptr [esp + 8]
    jne L11
    fstp fstp st(0)
    mov mov eax, dword ptr [esp + 20]
    and and eax, 07FFFFFFFh
    or or eax, dword ptr [esp + 16]
    je sub_100F926E
    call sub_100F92A1
    mov mov ch, byte ptr [esp + 15]
    shr shr ch, 7
    test test dword ptr [esp + 23], 080h
    je sub_100F9273
    fld fld xword ptr [g_101A5260]
L9:
    test test ch, cl
    je sub_100F9273
    fchs fchs
    mov mov eax, 2
    jmp sub_100F917B
    fldz fldz
    test test ch, cl
    je sub_1010315E
    fchs fchs
    jmp sub_10103165
    fstp fstp st(0)
    fld1 fld1
    jmp sub_1010316E
    fld fld st(1)
    call sub_100F92E9
    fchs fchs
    test test cl, cl
    jne sub_100F917B
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld xword ptr [g_101A5230]
    mov mov eax, 1
    jmp sub_100F91BA
FUN_100f8f7d ENDP
END
