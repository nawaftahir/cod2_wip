.686
.MODEL FLAT, C
EXTRN g_101A536C:DWORD
EXTRN g_101A537C:DWORD
EXTRN g_101A5384:DWORD
.CODE
FUN_10104c46 PROC
    push eax
    push ebx
    push ecx
    mov eax, dword ptr [esp + 22]
    xor eax, 000000700h
    test eax, 000000700h
    jne L5
    shr eax, 11
    and eax, 15
    cmp byte ptr [eax + 0101A534Ch], 0
    je L5
    mov eax, dword ptr [esp + 22]
    and eax, 07FFF0000h
    cmp eax, 07FFF0000h
    je L5
    mov eax, dword ptr [esp + 46]
    and eax, 07FFF0000h
    je L5
    cmp eax, 07FFF0000h
    je L5
    mov eax, dword ptr [esp + 44]
    add eax, eax
    jne L5
    mov eax, dword ptr [esp + 20]
    add eax, eax
    jne L5
    mov eax, dword ptr [esp + 24]
    and eax, 000007FFFh
    add eax, 63
    mov ebx, dword ptr [esp + 48]
    and ebx, 000007FFFh
    sub ebx, eax
    ja L1
L0:
    mov eax, dword ptr [esp + 24]
    and eax, 000007FFFh
    add eax, 10
    mov ebx, dword ptr [esp + 48]
    and ebx, 000007FFFh
    sub ebx, eax
    js L5
    fld xword ptr [esp + 40]
    mov eax, dword ptr [esp + 24]
    mov ebx, dword ptr [esp + 48]
    and ebx, 000007FFFh
    mov ecx, ebx
    sub ebx, eax
    and ebx, 7
    or ebx, 4
    sub ecx, ebx
    mov ebx, eax
    and ebx, 000008000h
    or ecx, ebx
    mov dword ptr [esp + 24], ecx
    fld xword ptr [esp + 16]
    mov dword ptr [esp + 24], eax
    fxch st(1)
    fprem
    fstp xword ptr [esp + 40]
    fstp st(0)
    jmp L0
L1:
    test edx, 2
    jne L2
    fld xword ptr [esp + 16]
    fstp xword ptr [esp + 28]
L2:
    fnstcw word ptr [esp + 52]
    mov eax, dword ptr [esp + 52]
    or eax, 00000033Fh
    mov dword ptr [esp + 56], eax
    fldcw word ptr [esp + 56]
    mov eax, dword ptr [esp + 24]
    and eax, 000007FFFh
    mov ebx, dword ptr [esp + 48]
    and ebx, 000007FFFh
    sub ebx, eax
    and ebx, 63
    or ebx, 32
    add ebx, 1
    mov ecx, ebx
    mov eax, dword ptr [esp + 24]
    mov ebx, dword ptr [esp + 48]
    and ebx, 000007FFFh
    and eax, 000008000h
    or ebx, eax
    mov dword ptr [esp + 24], ebx
    fld xword ptr [esp + 16]
    fabs
    fld xword ptr [esp + 40]
    fabs
L3:
    fcom st(1)
    fnstsw ax
    and eax, 000000100h
    jne L4
    fsub st(1)
L4:
    fxch st(1)
    fmul qword ptr [g_101A537C]
    fxch st(1)
    sub ecx, 1
    jne L3
    mov ebx, dword ptr [esp + 48]
    fstp xword ptr [esp + 40]
    fstp st(0)
    fld xword ptr [esp + 28]
    fld xword ptr [g_101A5384]
    fprem
    fstp st(0)
    fld xword ptr [esp + 40]
    fldcw word ptr [esp + 52]
    and ebx, 000008000h
    je L6
    fchs
    jmp L6
L5:
    fld xword ptr [esp + 16]
    fld xword ptr [esp + 40]
    fprem
L6:
    test edx, 3
    je L8
    fnstsw word ptr [esp + 60]
    test edx, 1
    je L7
    fnstcw word ptr [esp + 52]
    mov eax, dword ptr [esp + 52]
    or eax, 000000300h
    mov dword ptr [esp + 56], eax
    fldcw word ptr [esp + 56]
    fmul qword ptr [g_101A536C]
    fldcw word ptr [esp + 52]
L7:
    mov eax, dword ptr [esp + 60]
    fxch st(1)
    fstp st(0)
    fld xword ptr [esp + 28]
    fxch st(1)
    and eax, 000004300h
    sub esp, 28
    fnstenv [esp]
    and dword ptr [esp + 4], 00000BCFFh
    or dword ptr [esp + 4], eax
    fldenv [esp]
    add esp, 28
L8:
    pop ecx
    pop ebx
    pop eax
    ret
FUN_10104c46 ENDP
END
