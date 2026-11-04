.686
.MODEL FLAT, C
EXTRN sub_1002943E:PROC
EXTRN sub_100294C1:PROC
EXTRN sub_100F8FE4:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BD54:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BD90:DWORD:DWORD
EXTRN EXTRN g_1019BE00:DWORD:DWORD
EXTRN EXTRN g_1019BE08:DWORD:DWORD
EXTRN EXTRN g_1019BE10:DWORD:DWORD
EXTRN EXTRN g_1019BE18:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
EXTRN EXTRN g_1019BE28:DWORD:DWORD
EXTRN EXTRN g_1019BE30:DWORD:DWORD
.CODE
FUN_10029320 PROC
    sub sub esp, 28
    fld fld qword ptr [g_1019BD80]
    push push ebx
    push push ebp
    fstp fstp qword ptr [esp + 24]
    mov mov ebp, dword ptr [esp + 44]
    push push esi
    xor xor ebx, ebx
    push push edi
    mov mov dword ptr [esp + 16], ebx
    jmp L0
    lea lea ecx, [ecx]
    cmp cmp ebx, 31
    jne L1
    fld fld qword ptr [g_1019BE30]
    jmp L3
    fild fild dword ptr [esp + 16]
    fmul fmul dword ptr [g_1019BE28]
    fadd fadd dword ptr [esp + 48]
    fld fld qword ptr [g_1019BE20]
    fcomp fcomp st(1)
    fnstsw fnstsw ax
    test test ah, 65
    je L2
    fld fld qword ptr [g_1019BC88]
    fcomp fcomp st(1)
L1:
    fnstsw fnstsw ax
    test test ah, 5
    jp L2
    fstp fstp st(0)
    fld fld qword ptr [g_1019BC88]
    jmp L4
    fld fld qword ptr [g_1019BE20]
    fcomp fcomp st(1)
    fnstsw fnstsw ax
    test test ah, 65
    jne L5
    fstp fstp st(0)
    fld fld qword ptr [g_1019BE20]
    fld fld qword ptr [g_1019BE18]
    fldln2 fldln2
    fxch fxch st(1)
    fyl2x fyl2x
    fxch fxch st(1)
    fmul fmul qword ptr [g_1019BE10]
    fsubr fsubr qword ptr [g_1019BD90]
    fmul fmul qword ptr [g_1019BE08]
    fcos fcos
    fldln2 fldln2
    fxch fxch st(1)
    fyl2x fyl2x
    fdivp fdivp st(1)
    xor xor esi, esi
    fstp fstp qword ptr [esp + 24]
    mov mov dword ptr [esp + 16], esi
    lea lea edi, [ebx + ebp]
    fild fild dword ptr [esp + 16]
    fmul fmul dword ptr [g_1019BD54]
    fld fld qword ptr [esp + 24]
    call sub_100F8FE4
    fmul fmul qword ptr [g_1019BE00]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 16]
    fadd fadd qword ptr [esp + 32]
    fistp fistp dword ptr [esp + 20]
    mov mov al, byte ptr [esp + 20]
    inc inc esi
    mov mov byte ptr [edi], al
    add add edi, 32
    cmp cmp esi, 0100h
    mov mov dword ptr [esp + 16], esi
    jl sub_100294C1
    inc inc ebx
    cmp cmp ebx, 32
    mov mov dword ptr [esp + 16], ebx
    jl sub_1002943E
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
FUN_10029320 ENDP
END
