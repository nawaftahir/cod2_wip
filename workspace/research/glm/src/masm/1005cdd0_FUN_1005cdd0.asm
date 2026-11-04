.686
.MODEL FLAT, C
EXTRN g_1019BC88:DWORD
EXTRN g_1019BC90:DWORD
.CODE
FUN_1005cdd0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 36
    mov eax, dword ptr [ecx + 8]
    fld dword ptr [eax + 8]
    mov edx, dword ptr [ecx]
    push esi
    mov esi, dword ptr [ecx + 4]
    fmul dword ptr [esi + 4]
    fld dword ptr [esi + 8]
    fmul dword ptr [eax + 4]
    fsubp st(1)
    fmul dword ptr [edx]
    fstp qword ptr [esp + 16]
    fld dword ptr [eax + 4]
    fmul dword ptr [edx + 8]
    fld dword ptr [eax + 8]
    fmul dword ptr [edx + 4]
    fsubp st(1)
    fmul dword ptr [esi]
    fstp qword ptr [esp + 24]
    fld dword ptr [esi + 8]
    fmul dword ptr [edx + 4]
    fld dword ptr [esi + 4]
    fmul dword ptr [edx + 8]
    fsubp st(1)
    fmul dword ptr [eax]
    fstp qword ptr [esp + 32]
    fld qword ptr [esp + 32]
    fadd qword ptr [esp + 24]
    fadd qword ptr [esp + 16]
    fstp qword ptr [esp + 8]
    fld qword ptr [esp + 8]
    fabs
    fcomp qword ptr [g_1019BC90]
    fnstsw ax
    test ah, 5
    jp L0
    xor eax, eax
    pop esi
    mov esp, ebp
    pop ebp
    ret
L0:
    fld qword ptr [g_1019BC88]
    mov eax, dword ptr [ecx + 8]
    fdiv qword ptr [esp + 8]
    mov esi, dword ptr [ecx + 4]
    fstp qword ptr [esp + 8]
    fld dword ptr [eax + 8]
    fmul dword ptr [esi + 4]
    fld dword ptr [esi + 8]
    fmul dword ptr [eax + 4]
    fsubp st(1)
    fmul dword ptr [edx + 12]
    fstp qword ptr [esp + 16]
    fld dword ptr [eax + 4]
    fmul dword ptr [edx + 8]
    fld dword ptr [eax + 8]
    fmul dword ptr [edx + 4]
    fsubp st(1)
    fmul dword ptr [esi + 12]
    fstp qword ptr [esp + 24]
    fld dword ptr [esi + 8]
    fmul dword ptr [edx + 4]
    fld dword ptr [esi + 4]
    fmul dword ptr [edx + 8]
    fsubp st(1)
    fmul dword ptr [eax + 12]
    fstp qword ptr [esp + 32]
    fld qword ptr [esp + 32]
    fadd qword ptr [esp + 24]
    fadd qword ptr [esp + 16]
    fmul qword ptr [esp + 8]
    fstp dword ptr [edi]
    mov eax, dword ptr [ecx + 4]
    mov edx, dword ptr [ecx + 8]
    fld dword ptr [eax + 8]
    fmul dword ptr [edx]
    mov esi, dword ptr [ecx]
    fld dword ptr [eax]
    fmul dword ptr [edx + 8]
    fsubp st(1)
    fmul dword ptr [esi + 12]
    fstp qword ptr [esp + 16]
    fld dword ptr [esi]
    fmul dword ptr [edx + 8]
    fld dword ptr [edx]
    fmul dword ptr [esi + 8]
    fsubp st(1)
    fmul dword ptr [eax + 12]
    fstp qword ptr [esp + 24]
    fld dword ptr [eax]
    fmul dword ptr [esi + 8]
    fld dword ptr [eax + 8]
    fmul dword ptr [esi]
    fsubp st(1)
    fmul dword ptr [edx + 12]
    fstp qword ptr [esp + 32]
    fld qword ptr [esp + 32]
    fadd qword ptr [esp + 24]
    fadd qword ptr [esp + 16]
    fmul qword ptr [esp + 8]
    fstp dword ptr [edi + 4]
    mov edx, dword ptr [ecx + 4]
    mov eax, dword ptr [ecx + 8]
    fld dword ptr [edx]
    fmul dword ptr [eax + 4]
    mov ecx, dword ptr [ecx]
    fld dword ptr [edx + 4]
    fmul dword ptr [eax]
    fsubp st(1)
    fmul dword ptr [ecx + 12]
    fstp qword ptr [esp + 16]
    fld dword ptr [eax]
    pop esi
    fmul dword ptr [ecx + 4]
    fld dword ptr [ecx]
    fmul dword ptr [eax + 4]
    fsubp st(1)
    fmul dword ptr [edx + 12]
    fstp qword ptr [esp + 20]
    fld dword ptr [ecx]
    fmul dword ptr [edx + 4]
    fld dword ptr [edx]
    fmul dword ptr [ecx + 4]
    fsubp st(1)
    fmul dword ptr [eax + 12]
    mov eax, 1
    fstp qword ptr [esp + 28]
    fld qword ptr [esp + 28]
    fadd qword ptr [esp + 20]
    fadd qword ptr [esp + 12]
    fmul qword ptr [esp + 4]
    fstp dword ptr [edi + 8]
    mov esp, ebp
    pop ebp
    ret
FUN_1005cdd0 ENDP
END
