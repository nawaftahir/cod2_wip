.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BC90:DWORD:DWORD
.CODE
FUN_1005cdd0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 36
    mov mov eax, dword ptr [ecx + 8]
    fld fld dword ptr [eax + 8]
    mov mov edx, dword ptr [ecx]
    push push esi
    mov mov esi, dword ptr [ecx + 4]
    fmul fmul dword ptr [esi + 4]
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [eax + 4]
    fsubp fsubp st(1)
    fmul fmul dword ptr [edx]
    fstp fstp qword ptr [esp + 16]
    fld fld dword ptr [eax + 4]
    fmul fmul dword ptr [edx + 8]
    fld fld dword ptr [eax + 8]
    fmul fmul dword ptr [edx + 4]
    fsubp fsubp st(1)
    fmul fmul dword ptr [esi]
    fstp fstp qword ptr [esp + 24]
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [edx + 4]
    fld fld dword ptr [esi + 4]
    fmul fmul dword ptr [edx + 8]
    fsubp fsubp st(1)
    fmul fmul dword ptr [eax]
    fstp fstp qword ptr [esp + 32]
    fld fld qword ptr [esp + 32]
    fadd fadd qword ptr [esp + 24]
    fadd fadd qword ptr [esp + 16]
    fstp fstp qword ptr [esp + 8]
    fld fld qword ptr [esp + 8]
    fabs fabs
    fcomp fcomp qword ptr [g_1019BC90]
    fnstsw fnstsw ax
    test test ah, 5
    jp L0
    xor xor eax, eax
    pop pop esi
    mov mov esp, ebp
    pop pop ebp
    ret ret
    fld fld qword ptr [g_1019BC88]
    mov mov eax, dword ptr [ecx + 8]
    fdiv fdiv qword ptr [esp + 8]
    mov mov esi, dword ptr [ecx + 4]
    fstp fstp qword ptr [esp + 8]
    fld fld dword ptr [eax + 8]
    fmul fmul dword ptr [esi + 4]
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [eax + 4]
    fsubp fsubp st(1)
    fmul fmul dword ptr [edx + 12]
    fstp fstp qword ptr [esp + 16]
    fld fld dword ptr [eax + 4]
    fmul fmul dword ptr [edx + 8]
    fld fld dword ptr [eax + 8]
    fmul fmul dword ptr [edx + 4]
    fsubp fsubp st(1)
    fmul fmul dword ptr [esi + 12]
    fstp fstp qword ptr [esp + 24]
    fld fld dword ptr [esi + 8]
    fmul fmul dword ptr [edx + 4]
    fld fld dword ptr [esi + 4]
    fmul fmul dword ptr [edx + 8]
    fsubp fsubp st(1)
    fmul fmul dword ptr [eax + 12]
    fstp fstp qword ptr [esp + 32]
    fld fld qword ptr [esp + 32]
    fadd fadd qword ptr [esp + 24]
    fadd fadd qword ptr [esp + 16]
    fmul fmul qword ptr [esp + 8]
    fstp fstp dword ptr [edi]
    mov mov eax, dword ptr [ecx + 4]
    mov mov edx, dword ptr [ecx + 8]
    fld fld dword ptr [eax + 8]
    fmul fmul dword ptr [edx]
    mov mov esi, dword ptr [ecx]
    fld fld dword ptr [eax]
    fmul fmul dword ptr [edx + 8]
    fsubp fsubp st(1)
    fmul fmul dword ptr [esi + 12]
    fstp fstp qword ptr [esp + 16]
    fld fld dword ptr [esi]
    fmul fmul dword ptr [edx + 8]
    fld fld dword ptr [edx]
    fmul fmul dword ptr [esi + 8]
    fsubp fsubp st(1)
    fmul fmul dword ptr [eax + 12]
    fstp fstp qword ptr [esp + 24]
    fld fld dword ptr [eax]
    fmul fmul dword ptr [esi + 8]
    fld fld dword ptr [eax + 8]
    fmul fmul dword ptr [esi]
    fsubp fsubp st(1)
    fmul fmul dword ptr [edx + 12]
    fstp fstp qword ptr [esp + 32]
    fld fld qword ptr [esp + 32]
    fadd fadd qword ptr [esp + 24]
    fadd fadd qword ptr [esp + 16]
    fmul fmul qword ptr [esp + 8]
    fstp fstp dword ptr [edi + 4]
    mov mov edx, dword ptr [ecx + 4]
    mov mov eax, dword ptr [ecx + 8]
    fld fld dword ptr [edx]
    fmul fmul dword ptr [eax + 4]
    mov mov ecx, dword ptr [ecx]
    fld fld dword ptr [edx + 4]
    fmul fmul dword ptr [eax]
    fsubp fsubp st(1)
    fmul fmul dword ptr [ecx + 12]
    fstp fstp qword ptr [esp + 16]
    fld fld dword ptr [eax]
    pop pop esi
    fmul fmul dword ptr [ecx + 4]
    fld fld dword ptr [ecx]
    fmul fmul dword ptr [eax + 4]
    fsubp fsubp st(1)
    fmul fmul dword ptr [edx + 12]
    fstp fstp qword ptr [esp + 20]
    fld fld dword ptr [ecx]
    fmul fmul dword ptr [edx + 4]
    fld fld dword ptr [edx]
    fmul fmul dword ptr [ecx + 4]
    fsubp fsubp st(1)
    fmul fmul dword ptr [eax + 12]
    mov mov eax, 1
    fstp fstp qword ptr [esp + 28]
    fld fld qword ptr [esp + 28]
    fadd fadd qword ptr [esp + 20]
    fadd fadd qword ptr [esp + 12]
    fmul fmul qword ptr [esp + 4]
    fstp fstp dword ptr [edi + 8]
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_1005cdd0 ENDP
END
