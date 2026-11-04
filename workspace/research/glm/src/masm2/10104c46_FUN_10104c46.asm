.686
.MODEL FLAT, C
EXTRN sub_10104E50:PROC
EXTRN sub_10104E88:PROC
EXTRN sub_10104F02:PROC
EXTRN sub_10104F06:PROC
EXTRN sub_10104F80:PROC
EXTRN sub_10104F84:PROC
EXTRN sub_10104FD5:PROC
EXTRN sub_10104FF4:PROC
EXTRN EXTRN g_101A536C:DWORD:DWORD
EXTRN EXTRN g_101A537C:DWORD:DWORD
EXTRN EXTRN g_101A5384:DWORD:DWORD
.CODE
FUN_10104c46 PROC
    push push eax
    push push ebx
    push push ecx
    mov mov eax, dword ptr [esp + 22]
    xor xor eax, 0700h
    test test eax, 0700h
    jne L1
    shr shr eax, 11
    and and eax, 15
    cmp cmp byte ptr [eax + 0101A534Ch], 0
    je L2
    mov mov eax, dword ptr [esp + 22]
    and and eax, 07FFF0000h
    cmp cmp eax, 07FFF0000h
    je L3
    mov mov eax, dword ptr [esp + 46]
    and and eax, 07FFF0000h
    je L4
    cmp cmp eax, 07FFF0000h
    je L6
    mov mov eax, dword ptr [esp + 44]
    add add eax, eax
    jne L7
    mov mov eax, dword ptr [esp + 20]
    add add eax, eax
    jne sub_10104E50
    mov mov eax, dword ptr [esp + 24]
    and and eax, 07FFFh
    add add eax, 63
    mov mov ebx, dword ptr [esp + 48]
    and and ebx, 07FFFh
    sub sub ebx, eax
    ja L0
    mov mov eax, dword ptr [esp + 24]
    and and eax, 07FFFh
    add add eax, 10
    mov mov ebx, dword ptr [esp + 48]
    and and ebx, 07FFFh
    sub sub ebx, eax
    js sub_10104E88
    fld fld xword ptr [esp + 40]
    mov mov eax, dword ptr [esp + 24]
    mov mov ebx, dword ptr [esp + 48]
    and and ebx, 07FFFh
    mov mov ecx, ebx
    sub sub ebx, eax
    and and ebx, 7
    or or ebx, 4
    sub sub ecx, ebx
    mov mov ebx, eax
    and and ebx, 08000h
    or or ecx, ebx
    mov mov dword ptr [esp + 24], ecx
    fld fld xword ptr [esp + 16]
    mov mov dword ptr [esp + 24], eax
    fxch fxch st(1)
    fprem fprem
    fstp fstp xword ptr [esp + 40]
    fstp fstp st(0)
    jmp L0
    test test edx, 2
    jne L5
    fld fld xword ptr [esp + 16]
    fstp fstp xword ptr [esp + 28]
    fnstcw fnstcw word ptr [esp + 52]
    mov mov eax, dword ptr [esp + 52]
    or or eax, 033Fh
    mov mov dword ptr [esp + 56], eax
    fldcw fldcw word ptr [esp + 56]
    mov mov eax, dword ptr [esp + 24]
    and and eax, 07FFFh
    mov mov ebx, dword ptr [esp + 48]
    and and ebx, 07FFFh
    sub sub ebx, eax
    and and ebx, 63
    or or ebx, 32
    add add ebx, 1
    mov mov ecx, ebx
    mov mov eax, dword ptr [esp + 24]
    mov mov ebx, dword ptr [esp + 48]
    and and ebx, 07FFFh
    and and eax, 08000h
    or or ebx, eax
    mov mov dword ptr [esp + 24], ebx
    fld fld xword ptr [esp + 16]
    fabs fabs
    fld fld xword ptr [esp + 40]
    fabs fabs
    fcom fcom st(1)
    fnstsw fnstsw ax
    and and eax, 0100h
    jne sub_10104F02
    fsub fsub st(1)
    fxch fxch st(1)
    fmul fmul qword ptr [g_101A537C]
    fxch fxch st(1)
    sub sub ecx, 1
    jne sub_10104F06
    mov mov ebx, dword ptr [esp + 48]
L0:
    fstp fstp xword ptr [esp + 40]
    fstp fstp st(0)
    fld fld xword ptr [esp + 28]
    fld fld xword ptr [g_101A5384]
    fprem fprem
    fstp fstp st(0)
    fld fld xword ptr [esp + 40]
    fldcw fldcw word ptr [esp + 52]
    and and ebx, 08000h
    je sub_10104F80
    fchs fchs
    jmp sub_10104F84
    fld fld xword ptr [esp + 16]
    fld fld xword ptr [esp + 40]
    fprem fprem
    test test edx, 3
    je sub_10104FF4
    fnstsw fnstsw word ptr [esp + 60]
    test test edx, 1
    je sub_10104FD5
    fnstcw fnstcw word ptr [esp + 52]
    mov mov eax, dword ptr [esp + 52]
    or or eax, 0300h
    mov mov dword ptr [esp + 56], eax
    fldcw fldcw word ptr [esp + 56]
    fmul fmul qword ptr [g_101A536C]
    fldcw fldcw word ptr [esp + 52]
    mov mov eax, dword ptr [esp + 60]
    fxch fxch st(1)
    fstp fstp st(0)
    fld fld xword ptr [esp + 28]
    fxch fxch st(1)
    and and eax, 04300h
    sub sub esp, 28
    fnstenv fnstenv [esp]
    and and dword ptr [esp + 4], 0BCFFh
    or or dword ptr [esp + 4], eax
    fldenv fldenv [esp]
    add add esp, 28
    pop pop ecx
    pop pop ebx
    pop pop eax
    ret ret
FUN_10104c46 ENDP
END
