.686
.MODEL FLAT, C
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
EXTRN g_101A4838:DWORD
EXTRN g_101A5230:DWORD
EXTRN g_101A5260:DWORD
EXTRN g_101ADD90:DWORD
.CODE
FUN_100f8f7d PROC
    mov ecx, eax
    push eax
    wait
    fnstcw word ptr [esp]
    cmp word ptr [esp], 00000027Fh
    je L0
    call sub_10102F59
L0:
    and ecx, 07FF00000h
    lea edx, [esp + 8]
    cmp ecx, 07FF00000h
    je L10
    call sub_10102FA4
    je L9
    test eax, 07FF00000h
    je L13
L1:
    mov cl, byte ptr [esp + 15]
    and cl, 000000080h
    jne L17
L2:
    fyl2x
    call sub_10102F84
    cmp cl, 1
    jne L3
    fchs
L3:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10103036
    lea ecx, [g_101A4838]
    mov edx, 29
    jmp sub_10103091
L4:
    cmp dword ptr [g_101ADD90], 0
    jne sub_10103053
    lea ecx, [g_101A4838]
    mov edx, 29
    call sub_10102F65
    pop edx
    ret
L5:
    lea edx, [esp + 8]
    call sub_10103015
    test byte ptr [esp + 22], 8
    jne L6
    inc ecx
    jmp L11
L6:
    faddp st(1)
    mov eax, 1
    jmp L4
L7:
    test byte ptr [esp + 14], 8
    jne L6
L8:
    faddp st(1)
    mov eax, 7
    jmp L4
L9:
    xor ecx, ecx
    jmp L11
L10:
    xor ecx, ecx
    and eax, 0000FFFFFh
    or eax, dword ptr [esp + 16]
    jne L5
    lea edx, [esp + 8]
    call sub_10103052
L11:
    mov eax, dword ptr [esp + 12]
    mov edx, eax
    and eax, 07FF00000h
    and edx, 0000FFFFFh
    cmp eax, 07FF00000h
    jne L12
    or edx, dword ptr [esp + 8]
    jne L7
L12:
    test ecx, ecx
    jne L8
    sub esp, 116
    mov ecx, esp
    push ecx
    sub esp, 16
    fstp qword ptr [esp]
    fstp qword ptr [esp + 8]
    wait
    fnsave dword ptr [ecx + 8]
    call sub_10103F9D
    add esp, 16
    pop ecx
    frstor dword ptr [ecx + 8]
    fld qword ptr [ecx]
    add esp, 116
    test eax, eax
    je sub_101030FA
    mov eax, 1
    jmp L4
L13:
    mov eax, dword ptr [esp + 12]
    and eax, 0000FFFFFh
    or eax, dword ptr [esp + 8]
    jne L1
    fstp st(0)
    mov eax, dword ptr [esp + 20]
    and eax, 07FFFFFFFh
    or eax, dword ptr [esp + 16]
    je L16
    call sub_100F92A1
    mov ch, byte ptr [esp + 15]
    shr ch, 7
    test dword ptr [esp + 23], 000000080h
    je L15
    fld xword ptr [g_101A5260]
    test ch, cl
    je L14
    fchs
L14:
    mov eax, 2
    jmp L4
L15:
    fldz
    test ch, cl
    je sub_1010315E
    fchs
    jmp sub_10103165
L16:
    fstp st(0)
    fld1
    jmp sub_1010316E
L17:
    fld st(1)
    call sub_100F92E9
    fchs
    test cl, cl
    jne L2
    fstp st(0)
    fstp st(0)
    fld xword ptr [g_101A5230]
    mov eax, 1
    jmp L4
FUN_100f8f7d ENDP
END
