.686
.MODEL FLAT, C
EXTRN sub_100F8FE4:PROC
EXTRN g_1019BC88:DWORD
EXTRN g_1019BD54:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_1019BD90:DWORD
EXTRN g_1019BE00:DWORD
EXTRN g_1019BE08:DWORD
EXTRN g_1019BE10:DWORD
EXTRN g_1019BE18:DWORD
EXTRN g_1019BE20:DWORD
EXTRN g_1019BE28:DWORD
EXTRN g_1019BE30:DWORD
.CODE
FUN_10029320 PROC
    sub esp, 28
    fld qword ptr [g_1019BD80]
    push ebx
    push ebp
    fstp qword ptr [esp + 24]
    mov ebp, dword ptr [esp + 44]
    push esi
    xor ebx, ebx
    push edi
    mov dword ptr [esp + 16], ebx
    jmp L0
    lea ecx, [ecx]
L0:
    cmp ebx, 31
    jne L1
    fld qword ptr [g_1019BE30]
    jmp L5
L1:
    fild dword ptr [esp + 16]
    fmul dword ptr [g_1019BE28]
    fadd dword ptr [esp + 48]
    fld qword ptr [g_1019BE20]
    fcomp st(1)
    fnstsw ax
    test ah, 65
    je L3
    fld qword ptr [g_1019BC88]
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jp L2
    fstp st(0)
    fld qword ptr [g_1019BC88]
    jmp L4
L2:
    fld qword ptr [g_1019BE20]
    fcomp st(1)
    fnstsw ax
    test ah, 65
    jne L4
L3:
    fstp st(0)
    fld qword ptr [g_1019BE20]
L4:
    fld qword ptr [g_1019BE18]
    fldln2
    fxch st(1)
    fyl2x
    fxch st(1)
    fmul qword ptr [g_1019BE10]
    fsubr qword ptr [g_1019BD90]
    fmul qword ptr [g_1019BE08]
    fcos
    fldln2
    fxch st(1)
    fyl2x
    fdivp st(1)
L5:
    xor esi, esi
    fstp qword ptr [esp + 24]
    mov dword ptr [esp + 16], esi
    lea edi, [ebx + ebp]
L6:
    fild dword ptr [esp + 16]
    fmul dword ptr [g_1019BD54]
    fld qword ptr [esp + 24]
    call sub_100F8FE4
    fmul qword ptr [g_1019BE00]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 16]
    fadd qword ptr [esp + 32]
    fistp dword ptr [esp + 20]
    mov al, byte ptr [esp + 20]
    inc esi
    mov byte ptr [edi], al
    add edi, 32
    cmp esi, 000000100h
    mov dword ptr [esp + 16], esi
    jl L6
    inc ebx
    cmp ebx, 32
    mov dword ptr [esp + 16], ebx
    jl L0
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_10029320 ENDP
END
