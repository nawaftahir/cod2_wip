.686
.MODEL FLAT, C
EXTRN fp_101D4B90:DWORD
EXTRN fp_101D4BE4:DWORD
EXTRN g_101D7E10:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_100084c0 PROC
    mov edx, dword ptr [g_10678510]
    sub esp, 24
    push esi
    mov esi, eax
    imul eax, eax, 52
    imul esi, esi, 116
    mov ecx, dword ptr [esi + edx]
    add esi, edx
    add eax, 010678AC4h
    test ecx, ecx
    mov eax, dword ptr [eax + 4]
    je L0
    push ebp
    mov ebp, dword ptr [g_101D7E10]
    push eax
    push ebp
    call dword ptr [fp_101D4BE4]
    add esp, 8
    mov eax, ebp
    pop ebp
L0:
    lea ecx, [esp + 16]
    push ecx
    lea edx, [esp + 8]
    push edx
    push eax
    call dword ptr [fp_101D4B90]
    fld dword ptr [esi + 56]
    fld dword ptr [esp + 16]
    add esp, 12
    fmul st(1)
    fadd dword ptr [esi + 60]
    fstp dword ptr [ebx]
    fld dword ptr [esp + 8]
    fmul st(1)
    fadd dword ptr [esi + 64]
    fstp dword ptr [ebx + 4]
    fld dword ptr [esp + 12]
    fmul st(1)
    fadd dword ptr [esi + 68]
    fstp dword ptr [ebx + 8]
    fstp st(0)
    fld dword ptr [esi + 56]
    fld dword ptr [esp + 16]
    fmul st(1)
    fadd dword ptr [esi + 60]
    fstp dword ptr [edi]
    fld dword ptr [esp + 20]
    fmul st(1)
    fadd dword ptr [esi + 64]
    fstp dword ptr [edi + 4]
    fld dword ptr [esp + 24]
    fmul st(1)
    fadd dword ptr [esi + 68]
    pop esi
    fstp dword ptr [edi + 8]
    fstp st(0)
    add esp, 24
    ret
FUN_100084c0 ENDP
END
