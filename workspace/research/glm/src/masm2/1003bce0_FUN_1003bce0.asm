.686
.MODEL FLAT, C
EXTRN sub_1003AC65:PROC
EXTRN sub_1003BC8C:PROC
EXTRN sub_1003BDA6:PROC
EXTRN sub_1003BDBA:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_1003bce0 PROC
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [ecx + 0168h]
    sub sub esp, 8
    test test eax, eax
    je sub_1003BDA6
    fld fld dword ptr [edx + 28]
    fcomp fcomp dword ptr [ecx + 0174h]
    fnstsw fnstsw ax
    test test ah, 65
    jnp sub_1003BDBA
    fld fld dword ptr [edx + 28]
    fcomp fcomp dword ptr [ecx + 017Ch]
    fnstsw fnstsw ax
    test test ah, 1
    jne L0
    fld fld dword ptr [g_1019BC78]
    jmp L1
    fld fld dword ptr [edx + 28]
    fsub fsub dword ptr [ecx + 0174h]
    fld fld dword ptr [ecx + 017Ch]
    fsub fsub dword ptr [ecx + 0174h]
    fdivp fdivp st(1)
    mov mov eax, dword ptr [esp + 12]
    fld fld st(0)
    fmul fmul dword ptr [ecx + 0180h]
    push push eax
    mov mov eax, dword ptr [ecx + 0188h]
    push push eax
    mov mov eax, dword ptr [edx + 24]
    fstp fstp dword ptr [esp + 12]
    fmul fmul dword ptr [ecx + 0178h]
    fadd fadd dword ptr [ecx + 0170h]
    mov mov ecx, dword ptr [ecx + 0184h]
    push push ecx
    mov mov ecx, dword ptr [edx]
    push push eax
    fstp fstp dword ptr [esp + 16]
    push push ecx
    call sub_1003AC65
    fst fst dword ptr [edx]
    mov mov edx, dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 24]
    add add esp, 20
    push push edx
    push push ecx
    fstp fstp dword ptr [esp]
    call sub_1003BC8C
    add add esp, 8
    add add esp, 8
    ret ret
FUN_1003bce0 ENDP
END
