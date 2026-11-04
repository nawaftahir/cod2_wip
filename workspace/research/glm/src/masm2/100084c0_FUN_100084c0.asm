.686
.MODEL FLAT, C
EXTRN EXTRN fp_101D4B90:DWORD:DWORD
EXTRN EXTRN fp_101D4BE4:DWORD:DWORD
EXTRN EXTRN g_101D7E10:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_100084c0 PROC
    mov mov edx, dword ptr [g_10678510]
    sub sub esp, 24
    push push esi
    mov mov esi, eax
    imul imul eax, eax, 52
    imul imul esi, esi, 116
    mov mov ecx, dword ptr [esi + edx]
    add add esi, edx
    add add eax, 010678AC4h
    test test ecx, ecx
    mov mov eax, dword ptr [eax + 4]
    je L0
    push push ebp
    mov mov ebp, dword ptr [g_101D7E10]
    push push eax
    push push ebp
    call dword ptr [fp_101D4BE4]
    add add esp, 8
    mov mov eax, ebp
    pop pop ebp
    lea lea ecx, [esp + 16]
    push push ecx
    lea lea edx, [esp + 8]
    push push edx
    push push eax
    call dword ptr [fp_101D4B90]
    fld fld dword ptr [esi + 56]
    fld fld dword ptr [esp + 16]
    add add esp, 12
    fmul fmul st(1)
    fadd fadd dword ptr [esi + 60]
    fstp fstp dword ptr [ebx]
    fld fld dword ptr [esp + 8]
    fmul fmul st(1)
    fadd fadd dword ptr [esi + 64]
    fstp fstp dword ptr [ebx + 4]
    fld fld dword ptr [esp + 12]
    fmul fmul st(1)
    fadd fadd dword ptr [esi + 68]
    fstp fstp dword ptr [ebx + 8]
    fstp fstp st(0)
    fld fld dword ptr [esi + 56]
    fld fld dword ptr [esp + 16]
    fmul fmul st(1)
    fadd fadd dword ptr [esi + 60]
    fstp fstp dword ptr [edi]
    fld fld dword ptr [esp + 20]
    fmul fmul st(1)
    fadd fadd dword ptr [esi + 64]
    fstp fstp dword ptr [edi + 4]
    fld fld dword ptr [esp + 24]
    fmul fmul st(1)
    fadd fadd dword ptr [esi + 68]
    pop pop esi
    fstp fstp dword ptr [edi + 8]
    fstp fstp st(0)
    add add esp, 24
    ret ret
FUN_100084c0 ENDP
END
